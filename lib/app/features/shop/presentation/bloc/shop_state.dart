part of 'shop_bloc.dart';

sealed class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

final class ShopInitial extends ShopState {}

class GetTokoLoading extends ShopState {}

class GetTokoLoaded extends ShopState {
  final Shop shop;

  const GetTokoLoaded({required this.shop});

  @override
  List<Object> get props => [shop];
}

class GetTokoFailure extends ShopState {
  final String message;

  const GetTokoFailure({required this.message});

  @override
  List<Object> get props => [message];
}
