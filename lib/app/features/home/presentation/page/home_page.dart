import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widget/app_bar/home_app_bar.dart';
import '../widget/body/event_meal.dart';
import '../widget/body/menu_category.dart';
import '../widget/body/offer_banner.dart';
import '../widget/body/shop_recommentaions.dart';
import '../widget/body/special_offers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final refController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HomeAppBar(),
            SliverFillRemaining(
              child: SmartRefresher(
                controller: refController,
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 3));
                  refController.refreshCompleted();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // penawaran menarik
                      const SpecialOffers(),

                      // kategori menu
                      MenuCategory(),

                      // jajan disekitarmu
                      const EventMeal(
                        eventTitle: 'Jajan Disekitarmu',
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                      ),

                      // banner penawaran
                      const OfferBanner(),

                      // jajanan teratas
                      const EventMeal(
                        eventTitle: 'Jajanan Teratas',
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                      ),

                      // toko pilihan
                      const ShopRecommendations(),

                      // untuk kamu - rekomendasi
                      const EventMeal(
                        eventTitle: 'Untuk Kamu!',
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
