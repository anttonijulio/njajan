import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/components/app_text_field.dart';
import '../../../../../core/utils/validator/validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passController,
    required this.passFNode,
  });

  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController passController;
  final FocusNode passFNode;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* input email
          const Text(
            'Email',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          AppTextField(
            controller: widget.emailController,
            hintText: 'Masukan Email Anda',
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.passFNode);
            },
            validator: (value) => Validator.v(value, 'Email'),
          ),
          const SizedBox(height: 16),

          //* input password
          const Text(
            'Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          AppTextField(
            controller: widget.passController,
            hintText: 'Masukan Password Anda',
            obscureText: hidePassword,
            focusNode: widget.passFNode,
            keyboardType: TextInputType.visiblePassword,
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
            validator: (value) => Validator.v(value, 'Password'),
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                hidePassword = !hidePassword;
              }),
              icon: Icon(
                (hidePassword) ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
