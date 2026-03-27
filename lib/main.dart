import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamview/core/widgets/family_sharing.dart';
import 'package:streamview/features/auth/view/otp.dart';
import 'package:streamview/features/auth/view/create_new_password.dart';
import 'package:streamview/features/auth/view/forgot_password.dart';
import 'package:streamview/features/auth/view/profile_pin.dart';
import 'package:streamview/features/auth/view/sign_in.dart';
import 'package:streamview/features/auth/view/sign_up.dart';
import 'package:streamview/features/profile/view/create_profile.dart';
import 'core/routes/app_pages.dart';
import 'core/themes/app_theme.dart';
import 'core/widgets/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/home/view/home_screen.dart';

void main() {
  runApp(const StreamViewApp());
}

class StreamViewApp extends StatelessWidget {
  const StreamViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'StreamView',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
        GetPage(
          name: AppRoutes.onboarding,
          page: () => const OnboardingScreen(),
          transition: Transition.fadeIn, // Professional fade-in transition
          transitionDuration: const Duration(milliseconds: 600),
        ),
        GetPage(name: AppRoutes.signIn, page: () => const SignIn()),
        GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
        GetPage(name: AppRoutes.otp, page: () => const Otp()),
        GetPage(
          name: AppRoutes.forgotPassword,
          page: () => const ForgotPassword(),
        ),
        GetPage(
          name: AppRoutes.createNewPassword,
          page: () => const CreateNewPassword(),
        ),
        GetPage(
          name: AppRoutes.createProfile,
          page: () => const CreateProfile(),
        ),
        GetPage(name: AppRoutes.profilePin, page: () => const ProfilePin()),
        GetPage(name: AppRoutes.sharing, page: () => const FamilySharing()),
        GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
      ],
    );
  }
}
