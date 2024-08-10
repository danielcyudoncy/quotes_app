import 'package:get/get.dart';
import 'package:quotes_app/controllers/profile_controller.dart';
import 'package:quotes_app/controllers/auth_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(AuthController()); 
  }
}
