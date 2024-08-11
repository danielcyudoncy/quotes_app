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
      Get.to(() => HomeScreen());
    }
  }
}
