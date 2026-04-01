import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/search_text_field_widget.dart';
import 'package:streamview/core/widgets/top_search_widget.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class TopSearches extends GetView<HomeController> {
  const TopSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        centerTitle: true,
        title: Text(
          'Top Searches',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SearchTextFieldWidget(),
            const SizedBox(height: 20),
            Text(
              'Top Searches',
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: TopSearchWidget(controller: controller, itemCount: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
