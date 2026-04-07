import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Profile',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.gray10, height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.gray20,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 16),
            Text(
              'Joshua Onyeka',
              style: AppTextStyles.h4Bold.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 4),
            Text(
              'email@example.com',
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: AppColors.gray70,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(color: AppColors.gray10),
            const SizedBox(height: 16),
            _buildProfileOption(
              'Edit Profile',
              Icons.person_outline,
              () => Get.toNamed(AppRoutes.editProfile),
            ),
            const SizedBox(height: 10),
            _buildProfileOption(
              'Settings',
              Icons.settings_outlined,
              () => Get.toNamed(AppRoutes.settings),
            ),
            const SizedBox(height: 10),
            _buildProfileOption(
              'Help & Support',
              Icons.help_outline,
              () => Get.toNamed(AppRoutes.helpSupport),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(
              'Logout',
              Icons.logout,
              () => _showLogoutDialog(context),
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDestructive
              ? AppColors.error.withOpacity(0.1)
              : AppColors.gray10,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isDestructive ? AppColors.error : AppColors.black,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.bodyMediumBold.copyWith(
          color: isDestructive ? AppColors.error : AppColors.black,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.gray70,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Logout',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.error),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: AppTextStyles.bodyMediumBold.copyWith(color: AppColors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: AppColors.gray70,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Get.offAllNamed(AppRoutes.signIn),
            child: Text(
              'Logout',
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
