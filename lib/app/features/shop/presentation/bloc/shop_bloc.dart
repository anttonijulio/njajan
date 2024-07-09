import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/shop.dart';
import '../../domain/usecase/get_shop_by_id.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final GetShopById getToko;

  ShopBloc({required this.getToko}) : super(ShopInitial()) {
    on<GetTokoEvent>(_onGetTokoEvent);
  }

  void _onGetTokoEvent(
    GetTokoEvent event,
    Emitter<ShopState> emit,
  ) async {
    emit(GetTokoLoading());

    final response = await getToko.execute(params: event.id);

    response.fold(
      (l) => emit(GetTokoFailure(message: l.message)),
      (r) => emit(GetTokoLoaded(shop: r)),
    );
  }
}
