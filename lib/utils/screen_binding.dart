import 'package:get/get.dart';
import 'package:unsplashimages/Controllers/DashboardController.dart';


class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
