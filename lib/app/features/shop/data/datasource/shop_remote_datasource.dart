import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/shop_model.dart';

abstract interface class ShopRemoteDatasource {
  // get toko
  Future<ShopModel> getToko({required String id});
}

class ShopRemoteDatasourceImpl implements ShopRemoteDatasource {
  final FirebaseFirestore firestore;

  ShopRemoteDatasourceImpl({required this.firestore});

  @override
  Future<ShopModel> getToko({required String id}) async {
    try {
      final doc = await firestore.collection('shop').doc(id).get();

      final toko = doc.data();

      return ShopModel.fromRemote(toko);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
