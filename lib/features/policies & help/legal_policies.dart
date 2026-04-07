import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class LegalPolicies extends StatelessWidget {
  const LegalPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Legal and Policies',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.gray10, height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPolicySection(
              'Terms of Service',
              'By using StreamView, you agree to our terms. We provide a platform for streaming movies and TV shows. You are responsible for maintaining the confidentiality of your account and password.',
            ),
            const SizedBox(height: 24),
            _buildPolicySection(
              'Privacy Policy',
              'Your privacy is important to us. We collect minimal data to improve your streaming experience. We do not sell your personal information to third parties. Data collected includes watch history and device preferences.',
            ),
            const SizedBox(height: 24),
            _buildPolicySection(
              'Content Licensing',
              'All content available on StreamView is licensed from respective copyright holders. Unauthorized reproduction or distribution of content is strictly prohibited and may lead to account termination.',
            ),
            const SizedBox(height: 24),
            _buildPolicySection(
              'Subscription & Billing',
              'Subscriptions are billed at the beginning of each cycle. You can cancel at any time through your account settings. Refunds are handled according to our refund policy guidelines.',
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Last Updated: October 2023',
                style: AppTextStyles.bodySmallSemi.copyWith(
                  color: AppColors.gray50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('I Understand'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicySection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMediumBold.copyWith(
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.gray10.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.gray10),
          ),
          child: Text(
            content,
            style: AppTextStyles.bodySmallSemi.copyWith(
              color: AppColors.gray80,
              height: 1.5,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
