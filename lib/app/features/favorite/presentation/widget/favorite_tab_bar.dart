import 'package:flutter/material.dart';

class FavoriteTabBar extends StatelessWidget {
  const FavoriteTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Material(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
            child: TabBar(
              labelPadding: const EdgeInsets.symmetric(vertical: 14),
              unselectedLabelColor: Colors.grey.shade600,
              indicator: BoxDecoration(
                color: const Color(0xFF332C45),
                borderRadius: BorderRadius.circular(8),
              ),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Text('Jajan'),
                Text('Toko'),
              ],
            ),
          ),
        ),
        Container(
          height: 12,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 10),
                blurRadius: 15,
              )
            ],
          ),
        ),
      ],
    );
  }
}
