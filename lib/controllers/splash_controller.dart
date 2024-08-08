import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToOnboarding();
  }

  void navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed('/onboarding');
  }
}
