import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/controllers/auth_controller.dart';
import 'package:quotes_app/controllers/profile_controller.dart';
import 'package:quotes_app/myApp.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyCAuMomqOGrMQ8WZVwZz_Vtz83ojkfPGzY",
  authDomain: "quotes-app-8e61c.firebaseapp.com",
  projectId: "quotes-app-8e61c",
  storageBucket: "quotes-app-8e61c.appspot.com",
  messagingSenderId: "223388707836",
  appId: "1:223388707836:web:337021959ccc773d046079"));
  Get.put(AuthController());
  Get.put(ProfileController());
  }else{
    await Firebase.initializeApp();
  }
  
  
  runApp(const MyApp());
}