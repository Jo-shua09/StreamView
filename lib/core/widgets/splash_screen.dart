import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/custom_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //! Wait for 3 seconds
    Timer(const Duration(seconds: 3), () {
      //! Navigate and remove Splash screen from the back-stack
      Get.offNamed('/onboarding');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(color: AppColors.primary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomIcon(
                iconName: 'logo',
                color: AppColors.gray10,
                size: 80,
              ),
              const SizedBox(height: 16),
              Text(
                'StreamView',
                style: AppTextStyles.h4Bold.copyWith(color: AppColors.gray10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
