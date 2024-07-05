import 'package:flutter/material.dart';

import 'cart_button.dart';
import 'notification_button.dart';
import 'search_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      snap: true,
      title: SearchButton(),
      actions: [
        NotificationButton(),
        CartButton(),
        SizedBox(width: 8),
      ],
    );
  }
}
