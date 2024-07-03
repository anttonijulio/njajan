import 'package:flutter/material.dart';

import '../../../../../core/utils/strings/asset_strings.dart';

class LoginIllustration extends StatelessWidget {
  const LoginIllustration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 231, 231, 231),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        AssetStrings.login,
        fit: BoxFit.contain,
      ),
    );
  }
}
