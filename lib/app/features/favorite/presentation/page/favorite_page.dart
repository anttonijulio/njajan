import 'package:flutter/material.dart';

import '../widget/favorite_meal.dart';
import '../widget/favorite_shop.dart';
import '../widget/favorite_tab_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Jajan Yang Disukai'),
          titleTextStyle: const TextStyle(
            color: Color(0xFF332C45),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FavoriteTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  FavoriteMeal(),
                  FavoriteShop(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
