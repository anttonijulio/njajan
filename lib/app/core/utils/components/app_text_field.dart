import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.errorText,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      minLines: minLines,
      autocorrect: false,
      maxLines: maxLines,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      cursorColor: AppColors.grayScale90,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: errorText,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
