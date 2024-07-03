import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/components/app_button.dart';
import '../../../../core/utils/dialog/app_dialog.dart';
import '../../../../core/utils/helper/gap.dart';
import '../bloc/auth_bloc.dart';
import '../widget/register/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final emailFNode = FocusNode();
  final passFNode = FocusNode();
  final confirmPassFNode = FocusNode();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    emailFNode.dispose();
    passFNode.dispose();
    confirmPassFNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          return current is RegisterLoading ||
              current is RegisterSuccess ||
              current is RegisterFailure;
        },
        listener: (context, state) {
          if (state is RegisterLoading) {
            AppDialog.showLoading();
          } else if (state is RegisterSuccess) {
            AppDialog.closeLoading();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.login,
              (route) => false,
            );
            AppDialog.flushbar(context: context, text: state.message);
          } else if (state is RegisterFailure) {
            AppDialog.closeLoading();
            AppDialog.show(context, content: state.message);
          } else {
            AppDialog.closeLoading();
            AppDialog.show(context, content: 'STATE TIDAK VALID');
          }
        },
        //* page
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: kToolbarHeight + 16,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* label register
              const Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Gap.h(16),

              //* form register
              RegisterForm(
                formKey: formKey,
                usernameController: usernameController,
                emailController: emailController,
                passController: passController,
                confirmPassController: confirmPassController,
                emailFNode: emailFNode,
                passFNode: passFNode,
                confirmPassFNode: confirmPassFNode,
              ),
              Gap.h(16),

              //* tombol register
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) {
                  return current is RegisterLoading;
                },
                builder: (context, state) {
                  return AppButton(
                    label: 'Register',
                    onPressed: (state is RegisterLoading)
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(RegisterEvent(
                                    email: emailController.text.trim(),
                                    password: passController.text.trim(),
                                    username: usernameController.text.trim(),
                                  ));
                            }
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
