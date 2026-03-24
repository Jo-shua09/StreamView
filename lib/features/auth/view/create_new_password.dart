import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/text_field_widget.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Create New Password',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: AppColors.gray50,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextFieldWidget(
              hintText: 'Password',
              labelText: 'New Password',
              keyboardType: TextInputType.text,
              obscureText: true,
              suffixIcon: const Icon(Icons.visibility_off_outlined),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              hintText: 'Password',
              labelText: 'Confirm Password',
              keyboardType: TextInputType.text,
              obscureText: true,
              suffixIcon: const Icon(Icons.visibility_off_outlined),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text('Continue')),

            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 16,
                  color: AppColors.success,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Password must be at least 8 character, uppercase, lowercase, and unique code like #%!',
                    style: AppTextStyles.bodySmallSemi.copyWith(
                      color: AppColors.gray50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
