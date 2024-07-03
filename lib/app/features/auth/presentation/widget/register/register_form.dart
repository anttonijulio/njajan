import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/components/app_text_field.dart';
import '../../../../../core/utils/validator/validator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.emailController,
    required this.passController,
    required this.confirmPassController,
    required this.emailFNode,
    required this.passFNode,
    required this.confirmPassFNode,
  });

  final GlobalKey formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;
  final FocusNode emailFNode;
  final FocusNode passFNode;
  final FocusNode confirmPassFNode;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  String? validator(String? value, String title) {
    if (value == null || value.isEmpty) {
      return '$title tidak boleh kosong';
    }
    if (title == 'Konfirmasi Password') {
      if (widget.confirmPassController.text != widget.passController.text) {
        return 'Password tidak cocok';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* input username
          const Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          AppTextField(
            controller: widget.usernameController,
            hintText: 'Masukan Username Anda',
            keyboardType: TextInputType.name,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.emailFNode);
            },
            validator: (value) => Validator.v(value, 'Username'),
          ),
          const SizedBox(height: 16),

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
            focusNode: widget.emailFNode,
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
            focusNode: widget.passFNode,
            hintText: 'Masukan Password Anda',
            obscureText: hidePassword,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              return Validator.v(value, 'Password');
            },
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.confirmPassFNode);
            },
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                hidePassword = !hideConfirmPassword;
              }),
              icon: Icon(
                (hidePassword) ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),

          //* input konfirmasi password
          const Text(
            'Konfirmasi Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          AppTextField(
            controller: widget.confirmPassController,
            hintText: 'Masukan Ulang Password Anda',
            obscureText: hideConfirmPassword,
            focusNode: widget.confirmPassFNode,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              return validator(value, 'Konfirmasi Password');
            },
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                hideConfirmPassword = !hideConfirmPassword;
              }),
              icon: Icon(
                (hideConfirmPassword) ? Iconsax.eye_slash : Iconsax.eye,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
