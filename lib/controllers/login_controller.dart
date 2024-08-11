import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/screens/home_screen.dart';


class LogInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var toggled = true.obs;
  var agreePersonalData = false.obs;

  

  void submit() {
    if (formKey.currentState!.validate()) {
      bool loginSuccess = true;
      if (loginSuccess) {Get.to(() => HomeScreen());
      }  
    }else {
      Get.snackbar('Login Failed',
      'Invalid email or password',
      snackPosition: SnackPosition.BOTTOM);
    }
  }
@override
void onClose() {
  emailController.dispose();
  passwordController.dispose();
  super.onClose();
}

}
