import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/controllers/auth_controller.dart';
import 'package:quotes_app/controllers/profile_controller.dart';
import 'package:quotes_app/myApp.dart';


void main() {
  Get.put(AuthController());
  Get.put(ProfileController());
  
  runApp(const MyApp());
}