
import 'package:get/get.dart';
import 'package:unsplashimages/Views/Dashboard.dart';

import '../utils/screen_binding.dart';
import 'constantRoutes.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: kDashboard,
          page: () =>  Dashboard(),
          binding: ScreenBindings(),
      ),
    ];
  }
}