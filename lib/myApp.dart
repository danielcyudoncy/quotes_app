import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quotes_app/routes/routes.dart';
import 'package:quotes_app/screens/home_screen.dart';
import 'package:quotes_app/screens/login_screen.dart';
import 'package:quotes_app/screens/onboarding_screen.dart';
import 'package:quotes_app/screens/profile_screen.dart';
import 'package:quotes_app/screens/register_screen.dart';
import 'package:quotes_app/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Quotes',
      getPages: [
        GetPage(
            name: Routes.splashScreenRoute, page: () => const SplashScreen()),
        GetPage(name: Routes.onboardingScreenRoute, page: () => OnboardingScreen()),
        GetPage(name: Routes.logInScreenRoute, page: () =>  LoginScreen()),
        GetPage(name: Routes.registerScreenRoute, page: () =>  RegisterScreen()),
        GetPage(name: Routes.profileScreenRoute, page: () => const ProfileScreen()),
        GetPage(name: Routes.homeScreenRoute, page: () => const HomeScreen()),
      ],
      home: const SplashScreen(),
    );
  }
}
