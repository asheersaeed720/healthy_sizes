import 'package:get/get.dart';
import 'package:healthy_sizes/src/auth/auth_controller.dart';
import 'package:healthy_sizes/src/main/main_screen_controller.dart';
import 'package:healthy_sizes/src/network_manager.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager(), permanent: true);
    Get.put(MainScreenController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
