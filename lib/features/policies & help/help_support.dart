import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/search_text_field_widget.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  final Map<int, bool> _expandedStates = {};

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
          'Help & Support',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.gray10, height: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const SearchTextFieldWidget(
              onTap: null,
              hintText: 'Search for help...',
              show: false,
            ),
            const SizedBox(height: 24),
            Text(
              'Frequently Asked Questions',
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildFaqTile(
                    0,
                    'How do I cancel my subscription?',
                    'You can cancel your subscription anytime in the Settings > Subscription menu.',
                  ),
                  _buildFaqTile(
                    1,
                    'Can I download movies for offline viewing?',
                    'Yes, look for the download icon next to movie titles to save them for offline viewing.',
                  ),
                  _buildFaqTile(
                    2,
                    'How to change my profile pin?',
                    'Go to Settings > Security > Profile PIN to update your security code.',
                  ),
                  _buildFaqTile(
                    3,
                    'Devices supported by StreamView',
                    'StreamView is available on iOS, Android, and most modern web browsers.',
                  ),
                  _buildFaqTile(
                    4,
                    'Reporting a technical issue',
                    'Use the "Contact Support" button below to send a report to our technical team.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  Text(
                    'Still need help?',
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Our support team is available 24/7 to assist you with any issues.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySmallSemi.copyWith(
                      color: AppColors.gray70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Contact Support'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqTile(int index, String question, String answer) {
    final bool isExpanded = _expandedStates[index] ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gray10),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              question,
              style: AppTextStyles.bodySmallSemi.copyWith(
                color: AppColors.black,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.remove : Icons.add,
              color: AppColors.primary,
              size: 20,
            ),
            onTap: () => setState(() => _expandedStates[index] = !isExpanded),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                answer,
                style: AppTextStyles.bodySmallSemi.copyWith(
                  color: AppColors.gray70,
                  height: 1.4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
