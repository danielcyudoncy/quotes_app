import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quotes_app/routes/routes.dart';

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
        GetPage(name: Routes.HomeScreen, page: () => const HomeScreen()),
      ],
      home: const SplashScreen(),
    );
  }
}
