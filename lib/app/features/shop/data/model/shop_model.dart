import '../../domain/entity/shop.dart';
import 'location_model.dart';

class ShopModel extends Shop {
  const ShopModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.address,
    required super.location,
    required super.description,
    required super.category,
    required super.ratting,
    required super.review,
  });

  factory ShopModel.fromRemote(Map<String, dynamic>? data) {
    return ShopModel(
      id: data?['id'],
      name: data?['name'],
      imageUrl: data?['imageUrl'],
      address: data?['address'],
      location: LocationModel.fromRemote(data?['location']),
      description: data?['description'],
      category: data?['category'] as List<String>,
      ratting: data?['ratting'],
      review: data?['review'],
    );
  }
}
