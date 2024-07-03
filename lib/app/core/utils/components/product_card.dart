import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.scrollDirection});

  final Axis scrollDirection;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool likeProduct = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // product image, chip promo
          Stack(
            children: [
              // image
              Container(
                width: double.infinity,
                height: 140,
                margin: const EdgeInsets.only(bottom: 12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/450px-Good_Food_Display_-_NCI_Visuals_Online.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // banner promo
              Visibility(
                visible: true,
                child: Positioned(
                  top: 8,
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(6),
                    child: const Text(
                      'Promo',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              // banner promo
              Visibility(
                visible: true,
                child: Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF332C45),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      _dicountTitle(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // title
          const Text(
            'Lumpia basah mas roni',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 2),

          // description
          Row(
            children: [
              // jarak
              const Text(
                '1.5 Km',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                  fontSize: 12,
                ),
              ),

              const SizedBox(width: 4),

              // divider
              const Text(
                '|',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),

              const Icon(
                Iconsax.star5,
                size: 16,
                color: Colors.amber,
              ),
              const SizedBox(width: 4),

              const Text(
                '4.6 (12.k)',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                  fontSize: 12,
                ),
              ),

              const Spacer(),

              GestureDetector(
                onTap: () => setState(() {
                  likeProduct = !likeProduct;
                }),
                child: Icon(
                  (likeProduct == true) ? Iconsax.heart5 : Iconsax.heart,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  double? _width() {
    if (widget.scrollDirection == Axis.horizontal) {
      return 165.0;
    } else {
      return null;
    }
  }

  String _dicountTitle() {
    if (widget.scrollDirection == Axis.vertical) {
      return 'Diskon 40% Disetiap Pemesananmu';
    }
    return 'Diskon 40%';
  }
}
