import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplashimages/Controllers/DashboardController.dart';
import 'package:unsplashimages/Views/Dashboard.dart';
import 'package:unsplashimages/utils/screen_binding.dart';

import 'RouteManagement/constantRoutes.dart';
import 'RouteManagement/routesManagement.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
DashboardController dashboard=Get.put(DashboardController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ScreenBindings(),
      getPages: RouteManagement.getPages(),
      title: 'Unsplash Images',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: kDashboard,
    );
  }
}

