import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/components/app_button.dart';
import '../../../../../core/utils/dialog/app_dialog.dart';
import '../../bloc/profile_bloc.dart';

class ButtonUpdateProfile extends StatelessWidget {
  const ButtonUpdateProfile({
    super.key,
    required this.formKey,
    required this.selectedAvatar,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.selectedGender,
    required this.selectedDateOfBirth,
    required this.isSelectedDateOfBirth,
  });

  final GlobalKey<FormState> formKey;
  final XFile? selectedAvatar;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final String selectedGender;
  final DateTime selectedDateOfBirth;
  final bool isSelectedDateOfBirth;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) {
        return current is UpdateProfileLoading ||
            current is UpdateProfileSuccess ||
            current is UpdateProfileFailure;
      },
      listener: (context, state) {
        if (state is UpdateProfileLoading) {
          AppDialog.showLoading();
        } else if (state is UpdateProfileSuccess) {
          AppDialog.closeLoading();
          AppDialog.show(
            context,
            barrierDismissible: false,
            content: state.message,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoute.main,
                    (route) => false,
                  );
                },
                child: const Text('Lihat profile'),
              ),
            ],
          );
        } else if (state is UpdateProfileFailure) {
          AppDialog.closeLoading();
          AppDialog.show(context, content: state.message);
        } else {
          AppDialog.closeLoading();
          AppDialog.show(context, content: 'STATE TDAK VALID');
        }
      },
      child: AppButton(
        label: 'Update Profil',
        onPressed: isValidUpdated() ? () => updateProfile(context) : null,
      ),
    );
  }

  //* is valid updated
  bool isValidUpdated() {
    return selectedAvatar != null &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        selectedGender.isNotEmpty &&
        isSelectedDateOfBirth != false;
  }

  //* submit update profile
  void updateProfile(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<ProfileBloc>().add(UpdateProfileEvent(
            avatarFilePath: selectedAvatar!.path,
            name: nameController.text,
            phoneNumber: phoneController.text.trim(),
            address: addressController.text,
            gender: selectedGender,
            dateOfBirth: selectedDateOfBirth.toString(),
          ));
    }
  }
}
