part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> products;
  final int offset;
  final bool hasReachedEnd;

  const HomeLoaded(this.products, this.offset, this.hasReachedEnd);

  @override
  List<Object> get props => [products, offset, hasReachedEnd];
}

class HomeLoadingMore extends HomeState {
  final List<Product> products;
  final int offset;

  const HomeLoadingMore({required this.products, required this.offset});

  @override
  List<Object> get props => [products, offset];
}

class HomeFailure extends HomeState {
  final String message;

  const HomeFailure(this.message);

  @override
  List<Object> get props => [message];
}
