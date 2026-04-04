import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/models/movie.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/vertical_movie_card.dart';

class SeeAllMovies extends StatelessWidget {
  const SeeAllMovies({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract arguments passed from the previous screen
    final args = Get.arguments as Map<String, dynamic>?;
    final String title = args?['title'] ?? 'Movies';
    final List<Movie> movies = args?['movies'] ?? <Movie>[];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: movies.isEmpty
            ? Center(
                child: Text(
                  'No movies found.',
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.gray70,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: VerticalMovieCard(movie: movies[index]),
                  );
                },
              ),
      ),
    );
  }
}
