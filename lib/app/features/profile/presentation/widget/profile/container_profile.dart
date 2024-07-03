import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/strings/asset_strings.dart';
import '../../bloc/profile_bloc.dart';

class ContainerProfile extends StatefulWidget {
  const ContainerProfile({super.key});

  @override
  State<ContainerProfile> createState() => _ContainerProfileState();
}

class _ContainerProfileState extends State<ContainerProfile> {
  bool isErrorProfile = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(8),
          child: _buildProfileState(state),
        );
      },
    );
  }

  Widget _buildProfileState(ProfileState state) {
    const style = TextStyle(color: Colors.white);

    if (state is GetProfileLoading) {
      return _buildLoadingProfile(style);
    }

    if (state is GetProfileLoaded) {
      return _buildLoadedProfile(state);
    }

    if (state is GetProfileFailure) {
      return _buildFailureProfile(state, style);
    }

    return ListTile(
      title: const Text('STATE TIDAK VALID', style: style),
      contentPadding: const EdgeInsets.all(16),
      tileColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildLoadingProfile(TextStyle style) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white,
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
      title: Text('MEMUAT PROFILE', style: style),
      subtitle: Text('memuat profile', style: style),
      contentPadding: const EdgeInsets.all(16),
      tileColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildLoadedProfile(GetProfileLoaded state) {
    return ListTile(
      //* foto user
      leading: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          maxRadius: 30,
          minRadius: 20,
          onBackgroundImageError: (e, _) => setState(() {
            isErrorProfile = true;
          }),
          backgroundColor: Colors.white,
          backgroundImage: (isErrorProfile)
              ? const AssetImage(AssetStrings.defaultProfil)
              : NetworkImage(state.profile.avatar ?? '-'),
        ),
      ),

      //* username user
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          state.profile.username,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      //* email user
      subtitle: Text(
        state.profile.email,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),

      //* icon notification
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.notification,
          color: Colors.white,
        ),
      ),

      contentPadding: const EdgeInsets.all(16),
      tileColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildFailureProfile(GetProfileFailure state, TextStyle style) {
    return ListTile(
      title: Text(
        state.message,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
      contentPadding: const EdgeInsets.all(16),
      titleTextStyle: const TextStyle(color: Colors.white),
      tileColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
