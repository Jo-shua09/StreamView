import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class FamilySharing extends StatelessWidget {
  const FamilySharing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 600,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sharing.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.35, 1],
                  colors: [Colors.white, Colors.transparent],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    'Are you ready to watch movies?',
                    style: AppTextStyles.h4Bold.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Share your subscription with up to 5 family members and enjoy watching together.',
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.gray70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.interest),
                    child: const Text('Continue'),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () => Get.offAllNamed(AppRoutes.home),
                      child: Text(
                        'Skip for Now',
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
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
