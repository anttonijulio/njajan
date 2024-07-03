import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../core/utils/colors/colors.dart';
import 'favorite/presentation/page/favorite_page.dart';
import 'home/presentation/page/home_page.dart';
import 'order/presentation/page/order_page.dart';
import 'profile/presentation/bloc/profile_bloc.dart';
import 'profile/presentation/page/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = const <Widget>[
    HomePage(),
    FavoritePage(),
    OrderPage(),
    ProfilePage(),
  ];

  int selectedPage = 0;
  late int currentPage;

  @override
  void initState() {
    currentPage = selectedPage;
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        backgroundColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: AppColors.primary,
        onTap: (page) => setState(() {
          selectedPage = page;
        }),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_1),
            activeIcon: Icon(Iconsax.home_15),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            activeIcon: Icon(Iconsax.heart5),
            label: 'Disukai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.receipt),
            activeIcon: Icon(Iconsax.receipt_15),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            activeIcon: Icon(Iconsax.profile_circle5),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
