import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/custom_icon.dart';

class Interest extends StatelessWidget {
  const Interest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Choose Interests',
                      style: AppTextStyles.h6Bold.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Choose your favorite interest to get new shows all in one place related to it',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMediumBold.copyWith(
                        color: AppColors.gray70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: CustomIcon(iconName: 'search', size: 20.0),
                hintStyle: TextStyle(fontSize: 14, color: AppColors.gray70),
                suffixIcon: CustomIcon(iconName: 'filter', size: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
