import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/movie_list_widget.dart';
import 'package:streamview/core/widgets/search_text_field_widget.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';
import 'package:streamview/core/widgets/top_search_widget.dart';

class SearchScreen extends GetView<HomeController> {
  const SearchScreen({super.key});

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
          'Search',
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
            const SearchTextFieldWidget(onTap: null),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last Search',
                          style: AppTextStyles.bodyMediumBold.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Clear All',
                            style: AppTextStyles.bodySmallSemi.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    //!! Last Searches shows here
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(5, (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.gray70,
                                width: .6,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Avatar',
                                  style: AppTextStyles.bodySmallSemi.copyWith(
                                    color: AppColors.gray70,
                                  ),
                                ),
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: const EdgeInsets.all(8),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.gray70,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended for you',
                          style: AppTextStyles.bodyMediumBold.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: AppTextStyles.bodySmallSemi.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: MovieListWidget(controller: this.controller),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Recently Viewed',
                      style: AppTextStyles.bodyMediumBold.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TopSearchWidget(controller: this.controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
