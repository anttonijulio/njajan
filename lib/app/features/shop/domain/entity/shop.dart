import 'package:equatable/equatable.dart';

import 'location.dart';

class Shop extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final Location location;
  final String description;
  final List<String> category;
  final double ratting;
  final int review;

  const Shop({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.location,
    required this.description,
    required this.category,
    required this.ratting,
    required this.review,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        address,
        location,
        description,
        category,
        ratting,
        review,
      ];
}
