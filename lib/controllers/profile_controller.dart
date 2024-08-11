import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController extends GetxController {
  var fullName = ''.obs;
  var email = ''.obs;
  var profileImage = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    
    _initializeProfile();
  }

  Future<void> _initializeProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        fullName.value = data['fullName'] ?? '';
        email.value = data['email'] ?? '';
        profileImage.value = data['profileImage'] ?? '';
      }
    }
  }

  Future<void> updateProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await user.updateProfile(displayName: fullName.value, photoURL: profileImage.value);
        await _firestore.collection('users').doc(user.uid).update({
          'fullName': fullName.value,
          'email': email.value,
          'profileImage': profileImage.value,
        });
        Get.snackbar(
          'Success',
          'Profile updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to update profile: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'No user logged in',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void pickImage(String imagePath) {
    profileImage.value = imagePath;
  }
}
