import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/models/movie.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/custom_icon.dart';
import 'package:streamview/core/widgets/movie_list_widget.dart';
import 'package:streamview/core/widgets/top_search_widget.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class MovieDetails extends GetView<HomeController> {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = Get.arguments as Movie;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(movie),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Storyline',
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.plot ?? 'No description available for this movie.',
                    style: AppTextStyles.bodySmallSemi.copyWith(
                      color: AppColors.gray70,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildInfoRow('Director', movie.director ?? 'N/A'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Actors', movie.actors ?? 'N/A'),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended for you',
                        style: AppTextStyles.bodyMediumBold,
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
                    child: MovieListWidget(controller: controller),
                  ),
                  const SizedBox(height: 24),
                  Text('More Like This', style: AppTextStyles.bodyMediumBold),
                  const SizedBox(height: 16),
                  TopSearchWidget(controller: controller, itemCount: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(Movie movie) {
    return SizedBox(
      height: 450,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gray20,
              image: movie.poster != null && movie.poster != 'N/A'
                  ? DecorationImage(
                      image: NetworkImage(movie.poster!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  _topBarWidget(),
                  const Spacer(),
                  Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h6Bold.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildMetaItem(Icons.calendar_month, movie.year),
                      const SizedBox(width: 16),
                      _buildMetaItem(Icons.star, movie.imdbRating ?? 'N/A'),
                      if (movie.genreList.isNotEmpty) ...[
                        const SizedBox(width: 16),
                        _buildMetaItem(
                          Icons.movie_filter,
                          movie.genreList.take(1).first,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle_outline_rounded),
                        label: const Text('Play'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _buildCircleAction('download'),
                      const SizedBox(width: 12),
                      _buildCircleAction('mirroring'),
                      const SizedBox(width: 12),
                      _buildCircleAction('share'),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetaItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.white, size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bodyXSmallReg.copyWith(color: AppColors.white),
        ),
      ],
    );
  }

  Widget _buildCircleAction(String iconName) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: CustomIcon(iconName: iconName, size: 20, color: AppColors.white),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: AppTextStyles.bodySmallSemi.copyWith(color: AppColors.gray70),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodySmallSemi.copyWith(color: AppColors.black),
          ),
        ),
      ],
    );
  }

  Widget _topBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border, color: AppColors.white),
        ),
      ],
    );
  }
}
