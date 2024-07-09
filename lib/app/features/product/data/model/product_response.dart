import 'product_model.dart';

class ProductResponse {
  final List<ProductModel> listProduct;

  ProductResponse({required this.listProduct});

  factory ProductResponse.fromRemote(Map<String, dynamic>? data) {
    return ProductResponse(
      listProduct: (data?['products'] as List)
          .cast<Map<String, dynamic>?>()
          .map((product) => ProductModel.fromRemote(product))
          .toList(),
    );
  }
}
