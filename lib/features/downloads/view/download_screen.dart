import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/search_text_field_widget.dart';
import 'package:streamview/core/widgets/vertical_movie_card.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class DownloadScreen extends GetView<HomeController> {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Downloads',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextFieldWidget(
              onTap: null,
              onChanged: (value) => controller.searchQuery.value = value,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'On Downloads',
                      style: AppTextStyles.bodyMediumBold.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.topSearchMovies.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      // Mocking an active download from the list
                      final movie = controller.topSearchMovies.first;
                      return Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  height: 80,
                                  width: 120,
                                  color: AppColors.gray20,
                                  child:
                                      movie.poster != null &&
                                          movie.poster!.isNotEmpty &&
                                          movie.poster != 'N/A'
                                      ? Image.network(
                                          movie.poster!,
                                          fit: BoxFit.cover,
                                          color: AppColors.black.withOpacity(
                                            0.4,
                                          ),
                                          colorBlendMode: BlendMode.darken,
                                        )
                                      : const Icon(
                                          Icons.movie,
                                          color: AppColors.gray70,
                                        ),
                                ),
                              ),
                              const Icon(
                                Icons.play_circle_filled,
                                color: AppColors.white,
                                size: 32,
                              ),
                              const SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  value: 0.7,
                                  strokeWidth: 2,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodyMediumBold,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '70% Downloading...',
                                  style: AppTextStyles.bodySmallSemi.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 30),
                    Text(
                      'Completed Download(s)',
                      style: AppTextStyles.bodyMediumBold.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.topSearchMovies.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      // Showing the rest of the movies as completed downloads
                      return Column(
                        children: controller.topSearchMovies
                            .skip(1)
                            .map(
                              (movie) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: VerticalMovieCard(
                                  movie: movie,
                                  onPlayTap: () {},
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }),
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
