import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/home/domain/entities/product.dart';
import 'package:meta_mart/features/home/domain/usecases/get_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsUsecase getProductsUsecase;

  HomeBloc(this.getProductsUsecase) : super(HomeInitial()) {
    on<GetProductsEvent>(_onGetProductsEvent);
  }

  Future<void> _onGetProductsEvent(
    GetProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final result = await getProductsUsecase(NoParams());

    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (products) => emit(HomeLoaded(products)),
    );
  }
}
