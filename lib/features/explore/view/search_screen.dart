import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/movie_list_widget.dart';
import 'package:streamview/core/widgets/search_text_field_widget.dart';
import 'package:streamview/features/home/controllers/home_controller.dart';
import 'package:streamview/core/widgets/top_search_widget.dart';
import 'package:streamview/features/explore/controllers/explore_search_controller.dart';
import 'package:streamview/core/widgets/vertical_movie_card.dart';

class SearchScreen extends GetView<HomeController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ExploreSearchController exploreController = Get.put(
      ExploreSearchController(),
    );

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
            SearchTextFieldWidget(
              onTap: null,
              onChanged: (value) => exploreController.searchQuery.value = value,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (exploreController.searchQuery.value.isNotEmpty) {
                  if (exploreController.isLoadingSearch.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  if (exploreController.searchResults.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/emoji-sad.jpg',
                            width: 100,
                            height: 100,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.sentiment_dissatisfied,
                                  size: 100,
                                  color: AppColors.gray70,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sorry we can\'t find this movie.',
                            style: AppTextStyles.bodyMediumBold.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Try searching with different keywords.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodySmallSemi.copyWith(
                                color: AppColors.gray70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: exploreController.searchResults.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: VerticalMovieCard(
                          movie: exploreController.searchResults[index],
                        ),
                      );
                    },
                  );
                }
                return SingleChildScrollView(
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
                          children:
                              [
                                'Avatar',
                                'Inception',
                                'Batman',
                                'Avengers',
                                'Interstellar',
                              ].map((movieTitle) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.fromLTRB(
                                    12,
                                    0,
                                    4,
                                    0,
                                  ),
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
                                        movieTitle,
                                        style: AppTextStyles.bodySmallSemi
                                            .copyWith(color: AppColors.gray70),
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
                              }).toList(),
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
                            onPressed: () => Get.toNamed(
                              AppRoutes.seeAll,
                              arguments: {
                                'title': 'Recommended for you',
                                'movies': this.controller.topSearchedMovies
                                    .toList(),
                              },
                            ),
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
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
