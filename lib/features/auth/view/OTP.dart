import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

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
          'OTP Verification',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'We’ve just send you 4 digits code to your email',
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.gray50,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'example@example.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: AppTextStyles.h6Bold,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: AppColors.gray20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: AppColors.gray20),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: AppColors.error),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),
            ElevatedButton(onPressed: () {}, child: Text('Continue')),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive a code?',
                  style: AppTextStyles.bodySmallSemi.copyWith(
                    color: AppColors.gray50,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Resend Code',
                    style: AppTextStyles.bodySmallSemi.copyWith(
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
}
