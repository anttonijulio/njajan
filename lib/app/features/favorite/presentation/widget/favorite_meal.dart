import 'package:flutter/material.dart';

import '../../../../core/utils/components/product_card.dart';

class FavoriteMeal extends StatelessWidget {
  const FavoriteMeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) {
        return const ProductCard(
          scrollDirection: Axis.vertical,
        );
      },
    );
  }
}
