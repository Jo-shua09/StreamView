import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/movie_list_widget.dart';
import 'package:streamview/core/widgets/search_text_field_widget.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';

class ExploreScreen extends GetView<HomeController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RxString selectedCategory = 'All'.obs;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Explore',
          style: AppTextStyles.h6Bold.copyWith(color: AppColors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextFieldWidget(onTap: () => Get.toNamed(AppRoutes.search)),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      final movies = controller.topSearchedMovies
                          .take(5)
                          .toList();
                      if (movies.isEmpty) {
                        return Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: AppColors.gray20,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }
                      return SizedBox(
                        height: 160,
                        child: PageView.builder(
                          onPageChanged: controller.updateHeroCarouselIndex,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 160,
                                      child:
                                          movie.poster != null &&
                                              movie.poster != 'N/A'
                                          ? Image.network(
                                              movie.poster!,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(color: AppColors.gray20),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        width: double.infinity,
                                        height: 160,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            stops: const [0.0, 0.8],
                                            colors: [
                                              AppColors.black.withOpacity(0.8),
                                              Colors.transparent,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              movie.title,
                                              style: AppTextStyles
                                                  .bodyMediumBold
                                                  .copyWith(
                                                    color: AppColors.white,
                                                  ),
                                            ),
                                            Text(
                                              movie.genre ?? movie.year,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles.bodySmallSemi
                                                  .copyWith(
                                                    color: AppColors.white,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                    _buildStepIndicator(controller),
                    const SizedBox(height: 20),
                    const Text(
                      'Categories',
                      style: AppTextStyles.bodyMediumBold,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryCard('All', selectedCategory),
                        _buildCategoryCard('Action', selectedCategory),
                        _buildCategoryCard('Comedy', selectedCategory),
                        _buildCategoryCard('Horror', selectedCategory),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Movies',
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
                      child: MovieListWidget(controller: controller),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(HomeController controller) {
    return Obx(() {
      final moviesCount = controller.topSearchedMovies.take(5).length;
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

  Widget _buildCategoryCard(String title, RxString selectedCategory) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          selectedCategory.value = title;
        },
        child: Obx(() {
          return Container(
            width: 80,
            height: 40,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: selectedCategory.value == title
                  ? AppColors.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.bodySmallSemi.copyWith(
                  color: selectedCategory.value == title
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
