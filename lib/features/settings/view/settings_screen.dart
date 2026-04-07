import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(context, 'General', [
                const SizedBox(height: 6),
                _buildNavigationTitle(
                  context,
                  'Change Password',
                  'Update your security credentials.',
                  Icons.lock_outline,
                  onTap: () => Get.toNamed(AppRoutes.changePassword),
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Notifications',
                  'Customize your notification preferences.',
                  Icons.notifications_outlined,
                  onTap: () => Get.toNamed(AppRoutes.notificationSettings),
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Security',
                  'Manage your account security settings.',
                  Icons.security_outlined,
                  onTap: () => Get.toNamed(AppRoutes.securitySettings),
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Language',
                  'Select your preferred language.',
                  Icons.language_outlined,
                  onTap: () => Get.toNamed(AppRoutes.languageSettings),
                ),
              ]),
              const SizedBox(height: 20),
              _buildSection(context, 'Preferences', [
                const SizedBox(height: 6),
                _buildNavigationTitle(
                  context,
                  'Legal and Policies',
                  'Read our terms and privacy policy.',
                  Icons.gavel_outlined,
                  onTap: () => Get.toNamed(AppRoutes.legalPolicies),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: AppTextStyles.h6Bold.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildNavigationTitle(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray10,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? AppColors.error : AppColors.gray80,
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyMediumBold.copyWith(
            color: isDestructive ? AppColors.error : AppColors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          color: isDestructive ? AppColors.error : AppColors.black,
          size: 20,
        ),
        onTap: onTap,
      ),
    );
  }
}
