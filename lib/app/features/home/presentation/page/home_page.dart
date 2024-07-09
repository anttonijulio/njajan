import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/utils/helper/gap.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../widget/body/event_meal.dart';
import '../widget/body/menu_category.dart';
import '../widget/body/offer_banner.dart';
import '../widget/body/shop_recommentaions.dart';
import '../widget/body/special_offers.dart';
// import '../widget/app_bar/home_app_bar.dart';
// import '../widget/body/event_meal.dart';
// import '../widget/body/menu_category.dart';
// import '../widget/body/offer_banner.dart';
// import '../widget/body/shop_recommentaions.dart';
// import '../widget/body/special_offers.dart';

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
      // body: SafeArea(
      //   child: BlocBuilder<ProductBloc, ProductState>(
      //     builder: (context, state) {
      //       if (state is GetAllProductLoading) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       } else if (state is GetAllProductLoaded) {
      //         return ListView.separated(
      //           itemCount: state.products.length,
      //           padding: const EdgeInsets.all(16),
      //           separatorBuilder: (c, i) => Gap.h(16),
      //           itemBuilder: (context, index) {
      //             final product = state.products[index];

      //             return ListTile(
      //               leading: CircleAvatar(
      //                 maxRadius: 35,
      //                 minRadius: 30,
      //                 backgroundImage: NetworkImage(product.imageUrl),
      //               ),
      //               title: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     product.name,
      //                     maxLines: 1,
      //                     overflow: TextOverflow.ellipsis,
      //                   ),
      //                   Text(
      //                     product.name,
      //                     maxLines: 3,
      //                     overflow: TextOverflow.ellipsis,
      //                     style: const TextStyle(
      //                       color: Colors.grey,
      //                       fontSize: 12,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               subtitle: Text(product.description),
      //               autofocus: (index == 4),
      //               isThreeLine: true,
      //             );
      //           },
      //         );
      //       } else if (state is GetAllProductEmpty) {
      //         return Padding(
      //           padding: const EdgeInsets.all(16),
      //           child: Center(
      //             child: Text(state.message, textAlign: TextAlign.center),
      //           ),
      //         );
      //       } else if (state is GetAllProductFailure) {
      //         return Padding(
      //           padding: const EdgeInsets.all(16),
      //           child: Center(
      //             child: Text(state.message, textAlign: TextAlign.center),
      //           ),
      //         );
      //       } else {
      //         return const Center(child: Text('INVALID STATE'));
      //       }
      //     },
      //   ),
      // ),
      appBar: AppBar(
        title: Material(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cari jajanmu disini',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Iconsax.search_normal,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
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
    );
  }
}
