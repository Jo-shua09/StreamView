import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/models/movie.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/custom_icon.dart';
import 'package:streamview/core/widgets/top_search_widget.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class MoviePlay extends GetView<HomeController> {
  const MoviePlay({super.key});

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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: AppTextStyles.h6Bold.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${movie.year} • ${movie.genre ?? "N/A"} • ${movie.imdbRating ?? "N/A"} ⭐',
                    style: AppTextStyles.bodySmallSemi.copyWith(
                      color: AppColors.gray70,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionItem(Icons.add, 'My List'),
                      _buildActionItem(Icons.thumb_up_alt_outlined, 'Rate'),
                      _buildActionItem(Icons.share, 'Share'),
                      _buildActionItem(Icons.download_rounded, 'Download'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    movie.plot ?? 'No description available for this movie.',
                    style: AppTextStyles.bodySmallSemi.copyWith(
                      color: AppColors.black,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildInfoRow('Director', movie.director),
                  const SizedBox(height: 12),
                  _buildInfoRow('Actors', movie.actors),
                  const SizedBox(height: 30),
                  Text('More Like This', style: AppTextStyles.bodyMediumBold),
                  const SizedBox(height: 16),
                  TopSearchWidget(controller: controller, itemCount: 5),
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
      height: 250,
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
              child: Column(children: [_topBarWidget(movie), const Spacer()]),
            ),
          ),
          // Video Player Interface
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(16),
              child: const Icon(
                Icons.play_arrow,
                color: AppColors.white,
                size: 40,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Text(
                  '00:00',
                  style: AppTextStyles.bodyXSmallReg.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.3,
                    backgroundColor: AppColors.gray70.withOpacity(0.5),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '02:15',
                  style: AppTextStyles.bodyXSmallReg.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.fullscreen, color: AppColors.white, size: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget(Movie movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.white,
          ),
        ),
        Expanded(
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyMediumBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: CustomIcon(iconName: 'mirroring-white', size: 20),
        ),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.black, size: 24),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.bodyXSmallReg.copyWith(color: AppColors.gray70),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: AppTextStyles.bodySmallSemi.copyWith(color: AppColors.gray70),
        ),
        Expanded(
          child: Text(
            value ?? 'N/A',
            style: AppTextStyles.bodySmallSemi.copyWith(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
