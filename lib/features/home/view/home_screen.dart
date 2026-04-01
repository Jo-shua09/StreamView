import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/custom_icon.dart';
import 'package:streamview/core/widgets/horizontal_movie_card.dart';
import 'package:streamview/core/widgets/vertical_movie_card.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBarWidget(this.controller),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _heroMovieCard(this.controller),
                      const SizedBox(height: 16),
                      _topSearchedSection(this.controller),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 220,
                        child: _movieListWidget(this.controller),
                      ),
                      const SizedBox(height: 16),
                      _topSearchesSection(this.controller),
                      const SizedBox(height: 10),
                      _topSearchWidget(this.controller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBarWidget(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Handle menu icon tap
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.gray20,
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Joshua',
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Let\'s watch a movie',
              style: AppTextStyles.bodySmallSemi.copyWith(
                color: AppColors.gray70,
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => controller.searchMovies('action'),
          child: CustomIcon(iconName: 'search'),
        ),
        const SizedBox(width: 10),
        CustomIcon(iconName: 'notification-dot'),
      ],
    );
  }

  Widget _heroMovieCard(HomeController controller) {
    return Obx(() {
      final movies = controller.topSearchedMovies.take(3).toList();
      if (movies.isEmpty) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity,
            height: 160,
            color: AppColors.gray20,
          ),
        );
      }
      return Column(
        children: [
          SizedBox(
            height: 160,
            child: PageView.builder(
              onPageChanged: controller.updateHeroCarouselIndex,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 160,
                        child:
                            movie.poster != null &&
                                movie.poster!.isNotEmpty &&
                                movie.poster != 'N/A'
                            ? Image.network(
                                movie.poster!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(color: AppColors.gray20),
                              )
                            : Container(color: AppColors.gray20),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              stops: const [0.35, 1],
                              colors: [
                                AppColors.primary.withOpacity(0.8),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: AppTextStyles.bodyMediumBold.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                movie.year,
                                style: AppTextStyles.bodySmallSemi.copyWith(
                                  color: AppColors.gray20,
                                ),
                              ),
                              const SizedBox(height: 6),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.white,
                                  minimumSize: Size.zero,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Watch Now',
                                  style: AppTextStyles.bodySmallSemi.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildStepIndicator(controller),
        ],
      );
    });
  }

  Widget _buildStepIndicator(HomeController controller) {
    return Obx(() {
      final moviesCount = controller.topSearchedMovies.take(3).length;
      if (moviesCount <= 1) {
        return const SizedBox.shrink();
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(moviesCount, (index) {
          bool isSelected = index == controller.heroCarouselIndex.value;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 6,
            width: isSelected ? 24 : 6,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.gray20,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }),
      );
    });
  }

  Widget _topSearchedSection(HomeController controller) {
    return Row(
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
    );
  }

  Widget _movieListWidget(HomeController controller) {
    return Obx(() {
      if (controller.topSearchedMovies.isEmpty) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4, // Show 4 empty placeholders
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
            child: HorizontalMovieCard(movie: movie),
          );
        },
      );
    });
  }

  Widget _topSearchesSection(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Searches',
          style: AppTextStyles.bodyMediumBold.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.topSearches),
          child: Text(
            'See All',
            style: AppTextStyles.bodySmallSemi.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _topSearchWidget(HomeController controller) {
    return Obx(() {
      if (controller.topSearchMovies.isEmpty) {
        return Column(
          children: List.generate(
            5,
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
            .take(5)
            .map(
              (movie) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VerticalMovieCard(movie: movie),
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
