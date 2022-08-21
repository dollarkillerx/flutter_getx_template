import 'package:get/get.dart';
import '../about/controller.dart';
import '../about/provider.dart';
import '../home/controller.dart';
import '../home/provider.dart';
import 'controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AboutController>(() => AboutController());

    Get.put(HomeProvider());
    Get.put(AboutProvider());
  }
}
