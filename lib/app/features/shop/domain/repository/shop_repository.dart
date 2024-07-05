import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../entity/shop.dart';

abstract interface class ShopRepository {
  // get toko
  Future<Either<Failure, Shop>> getToko({required String id});
}
