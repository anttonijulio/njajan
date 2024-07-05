import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/strings/asset_strings.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  final carouselContent = [
    AssetStrings.sliderBanner1,
    AssetStrings.sliderBanner2,
    AssetStrings.sliderBanner3,
    AssetStrings.sliderBanner4,
  ];

  int currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Penawaran menarik',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // carousel slider
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CarouselSlider.builder(
                  itemCount: carouselContent.length,
                  itemBuilder: (c, i, ri) {
                    return SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            carouselContent[i],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 140,
                    autoPlayInterval: const Duration(seconds: 8),
                    onPageChanged: (index, reason) => setState(() {
                      currentCarouselIndex = index;
                    }),
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
