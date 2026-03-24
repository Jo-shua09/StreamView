import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/text_field_widget.dart';
import 'package:streamview/core/widgets/custom_icon.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
          'Sign Up',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              hintText: 'example@example.com',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              hintText: '',
              labelText: 'Birthday',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              hintText: 'Password',
              labelText: 'Password',
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
            const Spacer(),
            RichText(
              text: TextSpan(
                style: AppTextStyles.bodySmallSemi.copyWith(
                  color: AppColors.gray50,
                ),
                children: [
                  const TextSpan(
                    text:
                        'By clicking continue button, you agree to StreamView ',
                  ),
                  TextSpan(
                    text: 'Terms and Service',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const TextSpan(text: ' and acknowledge the '),
                  TextSpan(
                    text: 'Privacy and Policy.',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.home),
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
