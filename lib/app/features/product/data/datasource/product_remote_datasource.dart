import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_model.dart';
import '../model/product_response.dart';

abstract interface class ProductRemoteDatasource {
  // get all product
  Future<List<ProductModel>> getAllProduct();
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final FirebaseFirestore firestore;

  ProductRemoteDatasourceImpl({required this.firestore});

  @override
  Future<List<ProductModel>> getAllProduct() async {
    try {
      final productTokoJuara = await _getProductByShop('toko_juara');
      final productTokoMbakYuli = await _getProductByShop('toko_mbak_yuli');
      final productTokoSeleraRasa = await _getProductByShop('toko_selera_rasa');

      return [...productTokoJuara, ...productTokoMbakYuli, ...productTokoSeleraRasa];
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> _getProductByShop(
    String shopId,
  ) async {
    final shop = await firestore.collection('shop').doc(shopId).get();

    final shopData = shop.data();
    return ProductResponse.fromRemote(shopData).listProduct;
  }
}
