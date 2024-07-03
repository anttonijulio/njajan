import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:njajan_app/app/core/utils/dialog/app_dialog.dart';

import '../../../../core/routes/app_routes.dart';
import '../bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(UserAuthStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          return current is UserAuthenticated || current is UserUnauthenticated;
        },
        listener: (context, state) {
          if (state is UserAuthenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.main,
              (route) => false,
            );
          } else if (state is UserUnauthenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.login,
              (route) => false,
            );
          } else {
            AppDialog.show(context, content: 'STATE TIDAK VALID');
          }
        },
        //* page
        child: const Center(
          child: Text('SPLASH'),
        ),
      ),
    );
  }
}
