import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/widgets/vertical_movie_card.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class TopSearchWidget extends StatelessWidget {
  final HomeController controller;
  final int itemCount;

  const TopSearchWidget({
    super.key,
    required this.controller,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.topSearchMovies.isEmpty) {
        return Column(
          children: List.generate(
            itemCount,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.gray20,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          height: 14,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.gray20,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 12,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColors.gray20,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Column(
        children: controller.topSearchMovies
            .take(itemCount)
            .map(
              (movie) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed(AppRoutes.movieDetails, arguments: movie),
                      child: VerticalMovieCard(movie: movie),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            )
            .toList(),
      );
    });
  }
}
