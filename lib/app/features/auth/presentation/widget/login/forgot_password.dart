import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(
          context,
          AppRoute.forgotPassword,
        ),
        child: const Text('Lupa Password?'),
      ),
    );
  }
}
