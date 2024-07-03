import 'package:flutter/material.dart';

class ContainerProfileMenuModel {
  final String id;
  final IconData leadingIcon;
  final String title;
  final String? subtitle;
  final bool? enabled;
  final void Function()? onTap;

  ContainerProfileMenuModel({
    required this.id,
    required this.leadingIcon,
    required this.title,
    this.subtitle,
    this.enabled,
    this.onTap,
  });
}
