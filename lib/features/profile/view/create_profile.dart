import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/text_field_widget.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  bool _isFamilyWatchEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Profile',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? Avatar Image
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.gray10,
                    child: Icon(Icons.person_outlined, size: 50),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            TextFieldWidget(hintText: "", labelText: "Profile Name"),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: AppColors.gray60,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Watch with family and personal friends who are in different places',
                        style: AppTextStyles.bodySmallSemi.copyWith(
                          color: AppColors.gray50,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Transform.scale(
                  scale: 0.8,
                  child: Switch.adaptive(
                    value: _isFamilyWatchEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isFamilyWatchEnabled = value;
                      });
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.black,
                    inactiveThumbColor: AppColors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kids Profile',
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: AppColors.gray60,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'A profile with currated content and features with a simplified user interface',
                        style: AppTextStyles.bodySmallSemi.copyWith(
                          color: AppColors.gray50,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Transform.scale(
                  scale: 0.8,
                  child: Switch.adaptive(
                    value: _isFamilyWatchEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isFamilyWatchEnabled = value;
                      });
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.black,
                    inactiveThumbColor: AppColors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.profilePin),
              child: const Text('Continue'),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () => Get.offAllNamed(AppRoutes.sharing),
                child: Text(
                  'Without Pin',
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
