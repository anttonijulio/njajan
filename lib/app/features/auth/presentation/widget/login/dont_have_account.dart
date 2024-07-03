import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Belum Punya Akun? '),
          const SizedBox(width: 2),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoute.register,
                (route) => route.isFirst,
              );
            },
            child: const Text('Register Disini'),
          ),
        ],
      ),
    );
  }
}
