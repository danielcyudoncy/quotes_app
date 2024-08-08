import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/controllers/onboarding_controller.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final OnboardingController controller = Get.put(OnboardingController());

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: controller.navigateToLogin,
          child: const Text("Get Started"),
        ),
      ),
    );
  }
}
