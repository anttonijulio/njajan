import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entity/product.dart';
import '../../domain/repository/product_repository.dart';
import '../datasource/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final InternetConnectionChecker connection;
  final ProductRemoteDatasource remoteProduct;

  ProductRepositoryImpl({
    required this.connection,
    required this.remoteProduct,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final products = await remoteProduct.getAllProduct();

      return right(products);
    } on FirebaseException catch (e) {
      return left(Failure(message: e.message ?? '-'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
