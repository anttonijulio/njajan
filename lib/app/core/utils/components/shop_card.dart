import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../strings/asset_strings.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // shop pic
          SizedBox(
            height: 140,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Image.asset(
                AssetStrings.restaurant,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // title
          const Text(
            'Marabunta',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 2),

          // location
          const Row(
            children: [
              Icon(
                Iconsax.location,
                size: 20,
              ),
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  'Kota Lama',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
