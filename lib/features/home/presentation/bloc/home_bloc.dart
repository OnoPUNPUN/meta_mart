import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/home/domain/entities/product.dart';
import 'package:meta_mart/features/home/domain/usecases/get_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsUsecase getProductsUsecase;
  static const int _limit = 10;

  HomeBloc(this.getProductsUsecase) : super(HomeInitial()) {
    on<ProductsFetched>(_onProductsFetchedEvent);
    on<ProductsRefreshed>(_onProductsRefreshed);
  }

  Future<void> _onProductsFetchedEvent(
    ProductsFetched event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;

    if (currentState is HomeLoading || currentState is HomeLoadingMore) {
      return;
    }

    if (currentState is HomeLoaded && currentState.hasReachedEnd) {
      return;
    }

    final List<Product> oldProducts;
    final int currentOffset;

    if (currentState is HomeLoaded) {
      oldProducts = currentState.products;
      currentOffset = currentState.offset;

      emit(HomeLoadingMore(products: oldProducts, offset: currentOffset));
    } else {
      oldProducts = [];
      currentOffset = 0;

      emit(HomeLoading());
    }

    final result = await getProductsUsecase(
      GetProductParams(offset: currentOffset, limit: _limit),
    );

    result.fold(
      (failure) {
        if (oldProducts.isNotEmpty) {
          emit(HomeLoaded(oldProducts, currentOffset, false));
        } else {
          emit(HomeFailure(failure.message));
        }
      },
      (newProducts) {
        final allProducts = [...oldProducts, ...newProducts];

        emit(
          HomeLoaded(
            allProducts,
            currentOffset + newProducts.length,
            newProducts.length < _limit,
          ),
        );
      },
    );
  }

  Future<void> _onProductsRefreshed(
    ProductsRefreshed event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeInitial());
    add(const ProductsFetched());
  }
}
