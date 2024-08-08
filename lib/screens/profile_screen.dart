import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Username: ${controller.username.value}')),
            TextField(
              onChanged: controller.updateUsername,
              decoration: const InputDecoration(labelText: "Update Username"),
            ),
          ],
        ),
      ),
    );
  }
}