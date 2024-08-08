import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizztale_app/bindings/bindings.dart';
import 'package:quizztale_app/routes/routes.dart';
import 'package:quizztale_app/screens/game_screen.dart';
import 'package:quizztale_app/screens/game_status.dart';
import 'package:quizztale_app/screens/splash_screen.dart';
import 'package:quizztale_app/screens/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Quotes',
      getPages: [
        GetPage(
            name: Routes.splashScreen, page: () => const SpalshScreen()),
        GetPage(name: Routes.onboardingScreen, page: () => const OnboardingScreen()),
        GetPage(name: Routes.signInScreen, page: () => const SignInScreen()),
        GetPage(name: Routes.RegisterScreen, page: () => const RegisterScreen()),
        GetPage(name: Routes.ProfileScreen, page: () => const ProfileScreen()),
      ],
      home: const SplashScreen(),
    );
  }
}
