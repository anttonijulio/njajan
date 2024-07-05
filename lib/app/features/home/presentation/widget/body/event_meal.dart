import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/components/product_card.dart';

class EventMeal extends StatelessWidget {
  const EventMeal({
    super.key,
    required this.eventTitle,
    required this.scrollDirection,
    required this.physics,
  });

  final String eventTitle;
  final Axis scrollDirection;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Text(
            eventTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // product card
        SizedBox(
          height: _height(),
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: scrollDirection,
            itemCount: 5,
            physics: physics,
            separatorBuilder: (context, index) {
              if (scrollDirection == Axis.horizontal) {
                return const SizedBox(width: 12);
              } else {
                return const SizedBox(height: 12);
              }
            },
            itemBuilder: (context, index) {
              return ProductCard(
                scrollDirection: scrollDirection,
              );
            },
          ),
        ),
      ],
    );
  }

  double? _height() {
    if (scrollDirection == Axis.horizontal) {
      return 300;
    } else {
      return null;
    }
  }
}
