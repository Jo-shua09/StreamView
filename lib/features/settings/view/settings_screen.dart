import 'package:flutter/material.dart';
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
        automaticallyImplyLeading: false,
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
                  'Edit Profile',
                  'Update your personal information.',
                  Icons.person_outline,
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Change Password',
                  'Update your security credentials.',
                  Icons.lock_outline,
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Notifications',
                  'Customize your notification preferences.',
                  Icons.notifications_outlined,
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Security',
                  'Manage your account security settings.',
                  Icons.security_outlined,
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Language',
                  'Select your preferred language.',
                  Icons.language_outlined,
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
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Help & Support',
                  'Get help or contact our support team.',
                  Icons.help_outline,
                ),
                const SizedBox(height: 16),
                _buildNavigationTitle(
                  context,
                  'Logout',
                  'Sign out of your account safely.',
                  Icons.logout_outlined,
                  isDestructive: true,
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
        onTap: () {},
      ),
    );
  }
}
