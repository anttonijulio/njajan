import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/utils/strings/app_string.dart';
import '../../domain/entity/shop.dart';
import '../../domain/repository/shop_repository.dart';
import '../datasource/shop_remote_datasource.dart';

class ShopRepositoryImpl implements ShopRepository {
  final InternetConnectionChecker connection;
  final ShopRemoteDatasource shopRemote;

  ShopRepositoryImpl({
    required this.connection,
    required this.shopRemote,
  });

  @override
  Future<Either<Failure, Shop>> getTokoById({
    required String id,
  }) async {
    if (!await connection.hasConnection) {
      return left(Failure(message: AppString.noConnection));
    }

    try {
      final toko = await shopRemote.getShopById(id: id);

      return right(toko);
    } on FirebaseException catch (e) {
      return left(Failure(message: e.message ?? '-'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
