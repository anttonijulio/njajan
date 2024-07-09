import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../entity/product.dart';

abstract interface class ProductRepository {
  // get all product
  Future<Either<Failure, List<Product>>> getAllProduct();
}
