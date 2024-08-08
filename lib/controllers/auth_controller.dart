import 'package:get/get.dart';

class AuthController extends GetxController {
  void login(String username, String password) {
    
    Get.offAllNamed('/home');
  }

  void register(String username, String password) {
    
    Get.offAllNamed('/home');
  }
}
