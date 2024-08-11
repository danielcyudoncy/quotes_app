import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<File?> _imageFile = Rx<File?>(null);

  File? get imageFile => _imageFile.value;

  void updateImage(File image) {
    _imageFile.value = image;
  }
  
  void logout() {}
}
