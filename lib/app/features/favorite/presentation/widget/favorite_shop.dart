import 'package:flutter/material.dart';

import '../../../../core/utils/strings/asset_strings.dart';

class FavoriteShop extends StatelessWidget {
  const FavoriteShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetStrings.emtyFavorite,
          fit: BoxFit.contain,
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 16),
        const Text(
          'Sepertinya Anda belum memiliki Toko yang disukai',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
