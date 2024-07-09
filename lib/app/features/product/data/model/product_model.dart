import '../../domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.shopId,
    required super.name,
    required super.imageUrl,
    required super.description,
    required super.price,
    required super.stock,
    required super.isAvailable,
    required super.likes,
    required super.sold,
    required super.category,
  });

  factory ProductModel.fromRemote(Map<String, dynamic>? data) {
    return ProductModel(
      id: data?['id'] ?? '',
      shopId: data?['shop_id'] ?? '',
      name: data?['name'] ?? '',
      imageUrl: data?['imageUrl'] ?? '',
      description: data?['description'] ?? '',
      price: data?['price'] ?? 0,
      stock: data?['stock'] ?? 0,
      isAvailable: data?['isAvailable'] ?? false,
      likes: data?['likes'] ?? 0,
      sold: data?['sold'] ?? '',
      category: data?['category'] ?? '',
    );
  }
}
