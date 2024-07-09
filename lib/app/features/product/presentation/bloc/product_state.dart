part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class GetAllProductLoading extends ProductState {}

class GetAllProductLoaded extends ProductState {
  final List<Product> products;

  const GetAllProductLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class GetAllProductEmpty extends ProductState {
  final String message;

  const GetAllProductEmpty({required this.message});

  @override
  List<Object> get props => [message];
}

class GetAllProductFailure extends ProductState {
  final String message;

  const GetAllProductFailure({required this.message});

  @override
  List<Object> get props => [message];
}
