import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LocationDelivery extends StatelessWidget {
  const LocationDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 16,
        right: 8,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Antar ke',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Iconsax.arrow_down_1,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Iconsax.location,
                size: 16,
              ),
              const SizedBox(width: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const Text(
                  'Jl bulustalan IV no 407, Kelurahan Bulustalan, Semarang Selatan, Kota Semarang',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
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
