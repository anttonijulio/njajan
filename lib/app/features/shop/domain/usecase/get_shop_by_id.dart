import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/shop.dart';
import '../repository/shop_repository.dart';

class GetShopById implements Usecase<Shop, String> {
  final ShopRepository shopRepository;

  GetShopById({required this.shopRepository});

  @override
  Future<Either<Failure, Shop>> execute({
    required String params,
  }) async {
    return await shopRepository.getTokoById(id: params);
  }
}
