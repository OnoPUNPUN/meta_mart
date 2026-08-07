import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/search/domain/entities/category.dart';
import 'package:meta_mart/features/search/domain/usecases/get_categories_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetCategoriesUsecase getCategoriesUsecase;
  SearchBloc(this.getCategoriesUsecase) : super(SearchInitial()) {
    on<GetCategoriesEvent>(_onGetCategoriesEvent);
  }

  Future<void> _onGetCategoriesEvent(
    GetCategoriesEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());

    final result = await getCategoriesUsecase(NoParams());

    result.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (categories) => emit(SearchLoaded(categories)),
    );
  }
}
