import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _newReleases = true;
  bool _appUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Notifications',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.gray10, height: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildNotificationTile(
              'Push Notifications',
              'Receive alerts on your device.',
              _pushNotifications,
              (val) => setState(() => _pushNotifications = val),
            ),
            const SizedBox(height: 16),
            _buildNotificationTile(
              'Email Notifications',
              'Receive updates via your email.',
              _emailNotifications,
              (val) => setState(() => _emailNotifications = val),
            ),
            const SizedBox(height: 16),
            _buildNotificationTile(
              'New Releases',
              'Get notified when new movies are added.',
              _newReleases,
              (val) => setState(() => _newReleases = val),
            ),
            const SizedBox(height: 16),
            _buildNotificationTile(
              'App Updates',
              'Stay informed about new features.',
              _appUpdates,
              (val) => setState(() => _appUpdates = val),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gray10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmallSemi.copyWith(
                    color: AppColors.gray60,
                  ),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.white,
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: AppColors.black,
              inactiveThumbColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
