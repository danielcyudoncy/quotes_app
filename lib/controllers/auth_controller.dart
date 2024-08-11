import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<File?> _imageFile = Rx<File?>(null);

  File? get imageFile => _imageFile.value;

  void updateImage(File image) {
    _imageFile.value = image;
  }
  
  void logout() async {
    try {
      await auth.signOut();
      
      Get.offAllNamed('/onboarding');
    } catch (e) {
      Get.snackbar('Error', 'Failed to log out. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
