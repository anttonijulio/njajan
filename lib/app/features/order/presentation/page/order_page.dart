import 'package:flutter/material.dart';

import '../../../../core/utils/components/app_bbar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBBar(
        appBBarTitleType: AppBBarTitleType.text,
        title: 'Orderan Kamu',
        showBackArrow: false,
      ),
    );
  }
}
