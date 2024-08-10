import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screens/home_screen.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final fullName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final phoneNumber = ''.obs;
  final agreePersonalData = false.obs;
  final toggled = true.obs;

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  void register() {
    if (formKey.currentState!.validate() && agreePersonalData.value) {
      fullName.value = fullNameController.text; 
      Get.to(() => HomeScreen()); 
    } else if (!agreePersonalData.value) {
      Get.snackbar(
        'Error',
        'Please agree to the processing of personal data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  bool isEmail(String value) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(value);
  }
}
