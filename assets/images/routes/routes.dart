import 'package:get/get.dart';
import 'package:quotes_app/screens/home_screen.dart';
import 'package:quotes_app/screens/login_screen.dart';
import 'package:quotes_app/screens/onboarding_screen.dart';
import 'package:quotes_app/screens/profile_screen.dart';
import 'package:quotes_app/screens/register_screen.dart';
import 'package:quotes_app/screens/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/onboarding', page: () => OnboardingScreen()),
    GetPage(name: '/login', page: () => const LoginScreen()),
    GetPage(name: '/register', page: () => RegisterScreen()),
    GetPage(name: '/home', page: () => HomeScreen()), 
    GetPage(name: '/profile', page: () => ProfileScreen()),
  ];
}
