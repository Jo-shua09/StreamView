import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/data/interest.dart' as data;
import 'package:streamview/core/widgets/search_text_field_widget.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<data.Interest> _localInterests = List.from(data.interests);

  void toggleSelection(int index) {
    setState(() {
      _localInterests[index] = _localInterests[index].copyWith(
        isSelected: !_localInterests[index].isSelected,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
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
              const SizedBox(height: 20),
              SearchTextFieldWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(_localInterests.length, (index) {
                      final item = _localInterests[index];
                      return GestureDetector(
                        onTap: () => toggleSelection(index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(
                              color: item.isSelected
                                  ? AppColors.primary
                                  : AppColors.gray20,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check,
                                size: 16,
                                color: item.isSelected
                                    ? AppColors.primary
                                    : Colors.transparent,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                item.name,
                                style: TextStyle(
                                  color: item.isSelected
                                      ? AppColors.primary
                                      : AppColors.gray70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              const Spacer(),
              ElevatedButton(
                onPressed: () => Get.offAllNamed(AppRoutes.mainNav),
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
