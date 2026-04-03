import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/widgets/horizontal_movie_card.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class MovieListWidget extends StatelessWidget {
  final HomeController controller;
  final int placeholderCount;

  const MovieListWidget({
    super.key,
    required this.controller,
    this.placeholderCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.topSearchedMovies.isEmpty) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: placeholderCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.gray20,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        );
      }
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.topSearchedMovies.length,
        itemBuilder: (context, index) {
          final movie = controller.topSearchedMovies[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () =>
                  Get.toNamed(AppRoutes.movieDetails, arguments: movie),
              child: HorizontalMovieCard(movie: movie),
            ),
          );
        },
      );
    });
  }
}
