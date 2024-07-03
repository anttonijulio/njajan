import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppDialog {
  AppDialog._();

  // show dialog
  static void show(
    BuildContext context, {
    required String content,
    Widget? title,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          title: title,
          content: Text(content),
          actions: actions,
          titlePadding: titlePadding,
          actionsPadding: actionsPadding,
          contentPadding: contentPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }

  static void flushbar({
    required BuildContext context,
    required String text,
    FlushbarPosition fluashbarPosition = FlushbarPosition.TOP,
    Duration duration = const Duration(seconds: 4),
  }) {
    Flushbar(
      messageText: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      duration: duration,
      flushbarPosition: fluashbarPosition,
      backgroundColor: Colors.black38,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
    ).show(context);
  }

  static void showLoading() async {
    await EasyLoading.show(status: 'Memuat');
  }

  static void closeLoading() async {
    await EasyLoading.dismiss();
  }

  static void showBottomSheet(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    double borderRadius = 0,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: isDismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius),
        ),
      ),
      builder: (context) {
        return child;
      },
    );
  }
}
