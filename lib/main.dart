import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:streamview/features/explore/view/top_searches.dart';
import 'core/bindings/home_binding.dart';
import 'package:streamview/core/widgets/family_sharing.dart';
import 'package:streamview/core/widgets/interest_screen.dart';
import 'package:streamview/features/auth/view/otp.dart';
import 'package:streamview/features/auth/view/create_new_password.dart';
import 'package:streamview/features/auth/view/forgot_password.dart';
import 'package:streamview/features/auth/view/profile_pin.dart';
import 'package:streamview/features/auth/view/sign_in.dart';
import 'package:streamview/features/auth/view/sign_up.dart';
import 'package:streamview/features/downloads/view/download_screen.dart';
import 'package:streamview/features/navigation/main_navigation.dart';
import 'package:streamview/features/profile/view/create_profile.dart';
import 'package:streamview/features/profile/view/profile_screen.dart';
import 'package:streamview/features/explore/view/explore_screen.dart';
import 'core/routes/app_pages.dart';
import 'core/themes/app_theme.dart';
import 'core/widgets/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';

@pragma('vm:entry-point')
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
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
        GetPage(
          name: AppRoutes.mainNav,
          page: () => const MainNavigation(),
          binding: HomeBinding(),
        ),
        GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
        GetPage(
          name: AppRoutes.onboarding,
          page: () => const OnboardingScreen(),
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 1000),
        ),

        //!! App Authentication Routes
        GetPage(
          name: AppRoutes.signIn,
          page: () => const SignIn(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
        GetPage(
          name: AppRoutes.signUp,
          page: () => const SignUp(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
        GetPage(
          name: AppRoutes.otp,
          page: () => const Otp(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
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

        //!! App Feature Routes
        GetPage(name: AppRoutes.sharing, page: () => const FamilySharing()),
        GetPage(name: AppRoutes.interest, page: () => const InterestScreen()),
        GetPage(name: AppRoutes.topSearches, page: () => const TopSearches()),

        //!! App Core Routes
        GetPage(name: AppRoutes.explore, page: () => const ExploreScreen()),
        GetPage(name: AppRoutes.downloads, page: () => const DownloadScreen()),
        GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
      ],
    );
  }
}
