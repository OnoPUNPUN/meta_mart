part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ProductsFetched extends HomeEvent {
  const ProductsFetched();
}

class ProductsRefreshed extends HomeEvent {
  const ProductsRefreshed();
}
