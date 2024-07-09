import 'package:equatable/equatable.dart';

import '../../../product/domain/entity/product.dart';
import 'location.dart';

class Shop extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final String address;
  final Location location;
  final List<Product> products;
  final List<String> categories;
  final double rating;
  final int review;

  const Shop({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.address,
    required this.location,
    required this.products,
    required this.categories,
    required this.rating,
    required this.review,
  });

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        description,
        address,
        location,
        products,
        categories,
        rating,
        review,
      ];
}
