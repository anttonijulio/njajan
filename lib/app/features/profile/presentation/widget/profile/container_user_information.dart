import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/components/app_button.dart';
import '../../../../../core/utils/dialog/app_dialog.dart';
import '../../../../../core/utils/helper/gap.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../data/model/container_profile_menu_model.dart';
import '../../bloc/profile_bloc.dart';

class ContainerUserInformation extends StatelessWidget {
  const ContainerUserInformation({super.key});

  List<ContainerProfileMenuModel> contents(BuildContext context) {
    return [
      ContainerProfileMenuModel(
        id: 'akun',
        leadingIcon: Iconsax.profile_circle,
        title: 'Akun',
        subtitle: 'Edit profil anda disini',
      ), //* update akun
      ContainerProfileMenuModel(
        id: 'pembayaran',
        leadingIcon: Iconsax.wallet,
        title: 'Pembayaran',
        subtitle: 'Sesuakan metode pembayaran yang kamu miliki',
        onTap: () {
          Navigator.pushNamed(context, AppRoute.paymentMethod);
        },
      ), //* metode pembayaran
      ContainerProfileMenuModel(
        id: 'logout',
        leadingIcon: Icons.logout,
        title: 'Keluar',
        subtitle: 'keluar dengan aman dari akun ini',
        onTap: () => logout(context),
      ), //* button logout
    ];
  }

  void logout(BuildContext context) {
    AppDialog.showBottomSheet(
      context,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Anda yakin ingin keluar dari akun ini?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap.h(16),
            AppButton(
              label: 'Keluar',
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi Pengguna',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Material(
          elevation: 10,
          color: Colors.white,
          shadowColor: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          child: ListView.builder(
            itemCount: contents(context).length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final content = contents(context)[index];

              if (content.id == 'logout') {
                return _buildLogoutButton(content);
              }
              if (content.id == 'akun') {
                return _buildMenuAkun(content);
              }

              return ListTile(
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
                subtitle: Text(
                  content.subtitle ?? '-',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
                onTap: content.onTap,
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  //* build tombol logout
  Widget _buildLogoutButton(ContainerProfileMenuModel content) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return current is LogoutLoading ||
            current is LogoutSuccess ||
            current is LogoutFailure;
      },
      buildWhen: (previous, current) {
        return current is LogoutLoading;
      },
      listener: (context, state) {
        if (state is LogoutLoading) {
          AppDialog.showLoading();
        } else if (state is LogoutSuccess) {
          AppDialog.closeLoading();
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoute.login,
            (route) => false,
          );
          AppDialog.flushbar(context: context, text: state.message);
        } else if (state is LogoutFailure) {
          AppDialog.closeLoading();
          AppDialog.show(context, content: state.message);
        } else {
          AppDialog.closeLoading();
          AppDialog.show(context, content: 'INVALID STATE');
        }
      },
      builder: (context, state) {
        //* button logout
        return ListTile(
          enabled: (state is! LogoutLoading),
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
          subtitle: Text(
            content.subtitle ?? '-',
            // 'Edit profil anda disini',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
          onTap: content.onTap,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }

  //* build menu update akun
  Widget _buildMenuAkun(ContainerProfileMenuModel content) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ListTile(
          enabled: (state is GetProfileLoaded),
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
          subtitle: Text(
            content.subtitle ?? '-',
            // 'Edit profil anda disini',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
          onTap: () {
            if (state is GetProfileLoaded) {
              Navigator.pushNamed(
                context,
                AppRoute.updateProfile,
                arguments: UpdateProfileArgs(
                  avatar: state.profile.avatar ?? '-',
                  email: state.profile.email,
                  username: state.profile.username,
                ),
              );
            }
          },
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }
}
