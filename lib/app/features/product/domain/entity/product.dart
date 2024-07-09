import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String shopId;
  final String name;
  final String imageUrl;
  final String description;
  final int price;
  final int stock;
  final bool isAvailable;
  final int likes;
  final String sold;
  final String category;

  const Product({
    required this.id,
    required this.shopId,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.stock,
    required this.isAvailable,
    required this.likes,
    required this.sold,
    required this.category,
  });

  @override
  List<Object> get props => [
        id,
        shopId,
        name,
        imageUrl,
        description,
        price,
        stock,
        isAvailable,
        likes,
        sold,
        category,
      ];
}
