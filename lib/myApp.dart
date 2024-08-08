
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quotes_app/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
    );
  }
}