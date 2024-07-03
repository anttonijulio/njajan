import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../data/model/container_profile_menu_model.dart';

class ContainerAppInformation extends StatelessWidget {
  ContainerAppInformation({super.key});

  final contents = [
    ContainerProfileMenuModel(
      id: 'pusat_bantuan',
      leadingIcon: Iconsax.sms_notification,
      title: 'Pusat Bantuan',
      onTap: () {},
    ), //* pusat bantuan
    ContainerProfileMenuModel(
      id: 'info_aplikasi',
      leadingIcon: Iconsax.info_circle,
      title: 'Info Aplikasi',
      onTap: () {},
    ), //* info aplikasi
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lebih Lanjut',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        Material(
          elevation: 10,
          shadowColor: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          child: ListView.builder(
            itemCount: contents.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final content = contents[index];

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    content.leadingIcon,
                    color: AppColors.secondary,
                  ),
                ),
                title: Text(
                  content.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
                onTap: content.onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
