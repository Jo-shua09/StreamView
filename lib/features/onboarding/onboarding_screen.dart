import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/routes/app_pages.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 1;

  void nextStep() {
    if (currentStep < 3) {
      setState(() => currentStep++);
    } else {
      Get.offNamed(AppRoutes.signUp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Rounded Image
          Expanded(
            flex: 6, // Takes up more space for the image
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    key: ValueKey<int>(currentStep),
                    currentStep == 1
                        ? 'assets/images/onboarding_one.jpg'
                        : currentStep == 2
                        ? 'assets/images/onboarding_two.jpg'
                        : 'assets/images/onboarding_three.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Text Content Section
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      key: ValueKey<int>(currentStep),
                      currentStep == 1
                          ? 'Watching can be from anywhere'
                          : currentStep == 2
                          ? "Complete list of movies"
                          : "Spent Time with Loved Ones!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h6Bold.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMediumBold.copyWith(
                      color: AppColors.gray60,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: nextStep,
                      child: Text(
                        currentStep == 3 ? 'Get Started' : "Continue",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Progress Bar
                  const SizedBox(height: 24),
                  if (currentStep < 3)
                    _buildStepIndicator()
                  else
                    GestureDetector(
                      onTap: () => Get.offNamed(AppRoutes.signIn),
                      child: Text(
                        "Sign In",
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: AppColors.gray60,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Custom Dot Indicator to match the UI
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
}
