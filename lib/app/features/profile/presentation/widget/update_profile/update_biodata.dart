import 'package:flutter/material.dart';

import '../../../../../core/utils/components/app_text_field.dart';
import '../../../../../core/utils/validator/validator.dart';

class UpdateBiodata extends StatelessWidget {
  const UpdateBiodata({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* input nama lengkap
          const Text(
            'Nama Lengkap',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          AppTextField(
            controller: nameController,
            maxLength: 30,
            hintText: 'Masukan nama lengkap anda',
            validator: (value) => Validator.v(value, 'Nama lengkap'),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 8),

          //* input nomor telepon
          const Text(
            'Nomor Telepon',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          AppTextField(
            controller: phoneController,
            validator: (value) => Validator.v(value, 'Nomor telepon'),
            maxLength: 13,
            hintText: '0822 **** ****',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 8),

          //* input alamat
          const Text(
            'Alamat',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          AppTextField(
            controller: addressController,
            maxLines: 4,
            maxLength: 200,
            validator: (value) => Validator.v(value, 'Alamat'),
            keyboardType: TextInputType.streetAddress,
            onFieldSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
            hintText: 'Masukan alamat lengkap anda',
          ),
        ],
      ),
    );
  }
}
