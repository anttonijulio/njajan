import 'package:flutter/material.dart';

import '../../../../core/utils/components/app_bbar.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBBar(
        title: 'Metode Pembayaran',
        appBBarTitleType: AppBBarTitleType.text,
      ),
    );
  }
}
