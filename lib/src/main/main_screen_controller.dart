import 'package:get/get.dart';

class MainScreenController extends GetxController {
  int selectedIndex = 3;

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
