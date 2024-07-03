import 'package:flutter/material.dart';

enum AppBBarTitleType { widget, text }

class AppBBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBBar({
    super.key,
    this.actions,
    this.centerTitle = true,
    this.showBackArrow = true,
    this.title = 'title',
    this.child,
    required this.appBBarTitleType,
  });

  final List<Widget>? actions;
  final bool showBackArrow;
  final bool centerTitle;
  final String title;
  final Widget? child;
  final AppBBarTitleType appBBarTitleType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          offset: const Offset(0, 10),
          blurRadius: 10,
          spreadRadius: 7,
        )
      ]),
      child: AppBar(
        elevation: 0,
        title: _title(title, child),
        actions: actions,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: centerTitle,
        leading: _leading(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget? _title(String title, Widget? child) {
    if (appBBarTitleType == AppBBarTitleType.text) {
      return Text(
        title,
        style: const TextStyle(
          color: Color(0xFF332C45),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return child;
    }
  }

  Widget? _leading(BuildContext context) {
    if (showBackArrow == true) {
      return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      );
    } else {
      return null;
    }
  }
}
