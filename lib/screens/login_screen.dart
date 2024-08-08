import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/controllers/auth_controller.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final AuthController controller = Get.put(AuthController());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(labelText: "Username"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              controller.login('username', 'password');
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
