import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/components/app_button.dart';
import '../../../../core/utils/dialog/app_dialog.dart';
import '../../../../core/utils/helper/gap.dart';
import '../bloc/auth_bloc.dart';
import '../widget/login/dont_have_account.dart';
import '../widget/login/forgot_password.dart';
import '../widget/login/login_form.dart';
import '../widget/login/login_illustration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final passFNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    passFNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          return current is LoginLoading ||
              current is LoginSuccess ||
              current is LoginFailure;
        },
        listener: (context, state) {
          if (state is LoginLoading) {
            AppDialog.showLoading();
          } else if (state is LoginSuccess) {
            AppDialog.closeLoading();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.main,
              (route) => false,
            );
            AppDialog.flushbar(context: context, text: state.message);
          } else if (state is LoginFailure) {
            AppDialog.closeLoading();
            AppDialog.show(context, content: state.message);
          } else {
            AppDialog.closeLoading();
            AppDialog.show(context, content: 'STATE TIDAK VALID');
          }
        },
        //* page
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* ilustrasi login
              const LoginIllustration(),
              Gap.h(16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* form login email dan password
                    LoginForm(
                      formKey: formKey,
                      emailController: emailController,
                      passController: passController,
                      passFNode: passFNode,
                    ),
                    Gap.h(4),

                    //* lupa password?
                    const ForgotPassword(),
                    Gap.h(4),

                    //* tombol login
                    AppButton(
                      label: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(LoginEvent(
                                email: emailController.text.trim(),
                                password: passController.text.trim(),
                              ));
                        }
                      },
                    ),
                    Gap.h(4),

                    //* belum punya akun? register disini
                    const DontHaveAccount(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
