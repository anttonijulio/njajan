import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/product.dart';
import '../repository/product_repository.dart';

class GetAllProduct implements NoParamUsecase<List<Product>> {
  final ProductRepository productRepository;

  GetAllProduct({required this.productRepository});

  @override
  Future<Either<Failure, List<Product>>> execute() async {
    return await productRepository.getAllProduct();
  }
}
