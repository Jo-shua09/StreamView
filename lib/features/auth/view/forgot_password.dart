import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/text_field_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
          'Forgot Password',
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
                'Input your linked email to your StreamView account below, we\'ll send you a link',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: AppColors.gray50,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextFieldWidget(
              hintText: 'example@example.com',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.createNewPassword),
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
