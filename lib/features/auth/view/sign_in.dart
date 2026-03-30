import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/text_field_widget.dart';
import 'package:streamview/core/widgets/custom_icon.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
          'Sign In',
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
              hintText: 'Password',
              labelText: 'Password',
              keyboardType: TextInputType.text,
              obscureText: true,
              suffixIcon: const Icon(Icons.visibility_off_outlined, size: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(AppRoutes.mainNav),
              child: Text('Continue'),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
              ),
            ),

            const SizedBox(height: 30),
            Row(
              children: [
                const Expanded(child: Divider(color: AppColors.gray20)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'or',
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.gray60,
                    ),
                  ),
                ),
                const Expanded(child: Divider(color: AppColors.gray20)),
              ],
            ),
            const SizedBox(height: 30),
            _socialLogin('Continue with Google', 'google'),
            _socialLogin('Continue with Apple', 'apple'),
            _socialLogin('Continue with Facebook', 'facebook'),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.gray60,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.signUp),
                  child: Text(
                    "Sign Up",
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.primary,
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

  Widget _socialLogin(name, icon) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.gray80),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomIcon(iconName: icon, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        name,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
