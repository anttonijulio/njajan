part of 'shop_bloc.dart';

sealed class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class GetTokoEvent extends ShopEvent {
  final String id;

  const GetTokoEvent({required this.id});

  @override
  List<Object> get props => [id];
}
