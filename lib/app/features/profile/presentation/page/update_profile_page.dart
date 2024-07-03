import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/components/app_bbar.dart';
import '../../../../core/utils/dialog/app_dialog.dart';
import '../../../../core/utils/helper/gap.dart';
import '../widget/update_profile/button_update_profile.dart';
import '../widget/update_profile/update_avatar.dart';
import '../widget/update_profile/update_date_of_birth.dart';
import '../widget/update_profile/update_gender.dart';
import '../widget/update_profile/update_biodata.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({
    super.key,
    required this.args,
  });

  final UpdateProfileArgs args;

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final genders = ['Laki-laki', 'Perempuan'];
  late String selectedGender;

  late DateTime selectedDateOfBirth;
  late bool isSelectedDateOfBirth;

  XFile? selectedAvatar;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    selectedGender = '';
    selectedDateOfBirth = DateTime(2000);
    isSelectedDateOfBirth = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBBar(
        title: 'Biodata',
        appBBarTitleType: AppBBarTitleType.text,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* update foto profil
            UpdateAvatar(
              profile: widget.args,
              selectedImage: selectedAvatar,
              showImagePicker: () => showImagePicker(context),
            ),
            Gap.h(16),

            //* update nama, nomor telepon, dan alamat
            UpdateBiodata(
              formKey: formKey,
              nameController: nameController,
              phoneController: phoneController,
              addressController: addressController,
            ),
            Gap.h(8),

            //* update jenis kelamin
            UpdateGender(
              selectedGender: selectedGender,
              showGenderPicker: () => showGenderPicker(context),
            ),
            Gap.h(24),

            //* pilih tanggal lahir
            UpdateDateOfBirth(
              isSelectedDateOfBirth: isSelectedDateOfBirth,
              selectedDateOfBirth: selectedDateOfBirth,
              showDateBirthPicker: () => showDateBirthPicker(context),
            ),
            Gap.h(36),

            //* button submit
            ButtonUpdateProfile(
              formKey: formKey,
              selectedAvatar: selectedAvatar,
              nameController: nameController,
              phoneController: phoneController,
              addressController: addressController,
              selectedGender: selectedGender,
              selectedDateOfBirth: selectedDateOfBirth,
              isSelectedDateOfBirth: isSelectedDateOfBirth,
            ),
          ],
        ),
      ),
    );
  }

  //* show image picker
  void showImagePicker(BuildContext context) {
    AppDialog.showBottomSheet(
      context,
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Iconsax.gallery),
            title: const Text('Galeri'),
            onTap: () {
              pickImage(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.camera),
            title: const Text('Kamera'),
            onTap: () {
              pickImage(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() => selectedAvatar = pickedFile);
    }
  }

  //* show gender picker
  void showGenderPicker(BuildContext context) {
    AppDialog.showBottomSheet(
      context,
      child: SafeArea(
        child: Wrap(
          children: List.generate(
            genders.length,
            (index) {
              final gender = genders[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    (gender == 'Laki-laki') ? Iconsax.man : Iconsax.woman,
                    color: Colors.grey,
                  ),
                ),
                title: Text(gender),
                onTap: () {
                  setState(() => selectedGender = gender);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  //* show date of birth picker
  void showDateBirthPicker(BuildContext context) {
    AppDialog.showBottomSheet(
      context,
      isDismissible: false,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        color: Colors.grey.shade50,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Gap.h(8),
            GestureDetector(
              onTap: () {
                setState(() => isSelectedDateOfBirth = true);
                Navigator.pop(context);
              },
              child: const Text(
                'Selesai',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: ScrollDatePicker(
                selectedDate: selectedDateOfBirth,
                minimumDate: DateTime(1974),
                maximumDate: DateTime(2009, 12, 31),
                locale: const Locale('id'),
                options: DatePickerOptions(
                  backgroundColor: Colors.grey.shade50,
                  isLoop: false,
                  itemExtent: 40,
                ),
                scrollViewOptions: const DatePickerScrollViewOptions(
                  month: ScrollViewDetailOptions(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                onDateTimeChanged: (date) {
                  setState(() => selectedDateOfBirth = date);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
