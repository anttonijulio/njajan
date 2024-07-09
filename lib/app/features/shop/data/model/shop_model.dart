import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../product/data/model/product_model.dart';
import '../../domain/entity/location.dart';
import '../../domain/entity/shop.dart';

class ShopModel extends Shop {
  const ShopModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.description,
    required super.address,
    required super.location,
    required super.products,
    required super.categories,
    required super.rating,
    required super.review,
  });

  factory ShopModel.fromRemote(Map<String, dynamic>? data) {
    GeoPoint geoPoint = (data?['location'] as GeoPoint?) ?? const GeoPoint(0.0, 0.0);
    return ShopModel(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      imageUrl: data?['imageUrl'] ?? '',
      description: data?['description'] ?? '',
      address: data?['address'] ?? '',
      location: Location(
        latitude: geoPoint.latitude,
        longitude: geoPoint.longitude,
      ),
      products: (data?['products'] as List?)
              ?.map((product) => ProductModel.fromRemote(product))
              .toList() ??
          [],
      categories: List<String>.from(data?['categories'] ?? []),
      rating: (data?['rating'] ?? 0).toDouble(),
      review: data?['review'] ?? 0,
    );
  }
}
