import 'package:flutter/material.dart';

import '../../../../../core/utils/strings/asset_strings.dart';
import '../../../data/model/category_model.dart';

class MenuCategory extends StatelessWidget {
  MenuCategory({
    super.key,
  });

  // category
  final _categories = [
    CategoryModel(
      title: 'Kue Basah',
      icon: AssetStrings.kueBasah,
    ),
    CategoryModel(
      title: 'Jajanan Pasar',
      icon: AssetStrings.cemilan,
    ),
    CategoryModel(
      title: 'Camilan Kering',
      icon: AssetStrings.kueKering,
    ),
    CategoryModel(
      title: 'Minuman',
      icon: AssetStrings.minuman,
    ),
    CategoryModel(
      title: 'Toko',
      icon: AssetStrings.toko,
    ),
    CategoryModel(
      title: 'Olahan Singkong',
      icon: AssetStrings.cemilan,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                category.icon,
                height: 35,
                width: 35,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 4),
              Text(
                category.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
