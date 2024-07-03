import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/strings/asset_strings.dart';

class UpdateAvatar extends StatelessWidget {
  const UpdateAvatar({
    super.key,
    required this.showImagePicker,
    required this.selectedImage,
    required this.profile,
  });

  final void Function()? showImagePicker;
  final XFile? selectedImage;
  final UpdateProfileArgs profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //* ganti foto profile
          InkWell(
            onTap: showImagePicker,
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  //* tampilan foto profile
                  child: ClipOval(
                    child: _buildProfileImageState(context),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 4,
                  child: Material(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          //* username
          Text(
            profile.username,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          //* email
          Text(
            profile.email,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImageState(BuildContext context) {
    if (selectedImage != null) {
      return Image.file(
        File(selectedImage!.path),
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        frameBuilder: (c, chld, frm, wasAsyncLoad) {
          if (wasAsyncLoad) {
            return chld;
          }
          return AnimatedOpacity(
            opacity: (frm == null) ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: chld,
          );
        },
        errorBuilder: (c, e, st) {
          log(e.toString(), name: 'ERROR LOAD IMAGE FROM DEVICE');
          return Image.asset(
            AssetStrings.errorProfil,
            width: 100,
            height: 100,
          );
        },
      );
    } else {
      return Image.network(
        profile.avatar,
        errorBuilder: (c, e, st) {
          log(e.toString(), name: 'ERROR LOAD IMAGE FROM FIREBASE');
          return Image.network(
            'https://ui-avatars.com/api/?name=${profile.username}',
            width: 100,
            height: 100,
          );
        },
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    }
  }
}
