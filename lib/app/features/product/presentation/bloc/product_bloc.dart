import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/product.dart';
import '../../domain/usecase/get_all_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProduct getAllProduct;

  ProductBloc({required this.getAllProduct}) : super(ProductInitial()) {
    on<GetAllProductEvent>(_onGetAllProductEvent);
  }

  void _onGetAllProductEvent(
    GetAllProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(GetAllProductLoading());

    final response = await getAllProduct.execute();

    response.fold(
      (l) => emit(GetAllProductFailure(message: l.message)),
      (r) {
        if (r.isNotEmpty) {
          print(r.first);
          emit(GetAllProductLoaded(products: r));
        } else {
          emit(const GetAllProductEmpty(message: 'Produk Kosong'));
        }
      },
    );
  }
}
