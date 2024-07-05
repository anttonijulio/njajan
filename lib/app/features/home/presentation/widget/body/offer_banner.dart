import 'package:flutter/material.dart';

import '../../../../../core/utils/strings/asset_strings.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          AssetStrings.sliderBanner1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
