import 'package:flutter/material.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';
import 'package:streamview/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:streamview/core/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStep = 1;

  void nextStep() {
    if (currentStep < 3) {
      setState(() => currentStep++);
    }
  }

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
              _topBarWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 160,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.gray20,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/onboarding_one.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
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
                                height: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: AppTextStyles.bodyMediumBold
                                          .copyWith(color: AppColors.white),
                                    ),
                                    Text(
                                      'Description',
                                      style: AppTextStyles.bodySmallSemi
                                          .copyWith(color: AppColors.gray20),
                                    ),
                                    const SizedBox(height: 6),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.white,
                                        minimumSize: Size.zero,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 16,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Watch Now',
                                        style: AppTextStyles.bodySmallSemi
                                            .copyWith(color: AppColors.primary),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (currentStep < 3) _buildStepIndicator(),

                      //! Recommended Movies Section
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top Searched',
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
                      SizedBox(height: 220, child: _movieListWidget()),

                      //! Top Searched Movies Section
                      const SizedBox(height: 16),
                      Row(
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
                      _topSearchWidget(),
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

  Widget _topBarWidget() {
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
        CustomIcon(iconName: 'search'),
        const SizedBox(width: 10),
        CustomIcon(iconName: 'notification-dot'),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isSelected = (index + 1) == currentStep;
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
  }

  Widget _movieListWidget() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppColors.gray20,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/sharing.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Movie Title',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    //Maximum of 2 genres
                    Text(
                      'Genre, Genre',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.bodySmallSemi.copyWith(
                        color: AppColors.gray70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _topSearchWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 120,
                decoration: BoxDecoration(
                  color: AppColors.gray20,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/sharing.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Movie Title',
                      style: AppTextStyles.bodyMediumBold.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Genre, Genre',
                      style: AppTextStyles.bodySmallSemi.copyWith(
                        color: AppColors.gray70,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_outline_outlined,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
