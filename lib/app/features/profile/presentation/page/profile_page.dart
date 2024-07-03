import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/utils/components/app_bbar.dart';
import '../../../../core/utils/helper/gap.dart';
import '../bloc/profile_bloc.dart';
import '../widget/profile/container_app_information.dart';
import '../widget/profile/container_profile.dart';
import '../widget/profile/container_user_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final refController = RefreshController();

  @override
  void dispose() {
    refController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBBar(
        title: 'Profil',
        showBackArrow: false,
        appBBarTitleType: AppBBarTitleType.text,
      ),
      body: SmartRefresher(
        controller: refController,
        onRefresh: () {
          context.read<ProfileBloc>().add(GetProfileEvent());
          refController.refreshCompleted();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h(24),

              //* container profil
              // foto, username, email, tombol notifikasi
              const ContainerProfile(),
              Gap.h(24),

              //* informasi pengguna
              // update akun, update metode pembayaran, logout
              const ContainerUserInformation(),
              Gap.h(24),

              //* informasi aplikasi
              // bantuan, informasi aplikasi
              ContainerAppInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
