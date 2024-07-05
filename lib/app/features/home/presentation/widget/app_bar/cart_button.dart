import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.shopping_cart),
        ),
        Positioned(
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: const Text(
              '3',
              style: TextStyle(
                fontSize: 9,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
