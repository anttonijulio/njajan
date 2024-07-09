import 'package:flutter/material.dart';
import 'package:njajan_app/app/core/utils/components/app_bbar.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBBar(
        appBBarTitleType: AppBBarTitleType.text,
        title: 'Toko',
      ),
    );
  }
}
