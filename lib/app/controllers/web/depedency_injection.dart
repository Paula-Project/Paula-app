import 'package:get/get.dart';
import 'package:paula/app/controllers/web/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
