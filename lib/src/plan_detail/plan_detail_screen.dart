import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/main/main_screen_controller.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class PlanDetailScreen extends StatelessWidget {
  static const String routeName = '/plan-detail';

  PlanDetailScreen({this.isBottomBar = false, Key? key}) : super(key: key);

  final bool isBottomBar;

  final _mainScreenCtrl = Get.put(MainScreenController());

  final Map<String, dynamic>? args =
      Get.arguments == null ? null : Get.arguments as Map<String, dynamic>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: !isBottomBar
          ? null
          : BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/plan.png'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/explore.png'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/shop.png'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/menu.png'),
                  label: '',
                ),
              ],
              currentIndex: _mainScreenCtrl.selectedIndex,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.grey.shade700,
              selectedIconTheme: const IconThemeData(color: kPrimaryColor),
              unselectedIconTheme: IconThemeData(color: Colors.grey.shade700),
              onTap: _mainScreenCtrl.onItemTapped,
            ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 930,
              child: ScreenBgWidget(),
            ),
            Positioned(
              top: 170.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                height: 760,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  border: Border.all(width: 3.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: Text(args?['title'] ?? 'Break', style: kTitleStyle),
                      subtitle: Text('Tropical Chicken Breast', style: kBodyStyle),
                      trailing: ClipRRect(
                        child: Image.asset('assets/images/lunch.png'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      child: Text(
                        'Ingredients',
                        style: kBodyStyle.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text('* 1/4 pound chicken breasts, diced'),
                    const SizedBox(height: 10.0),
                    Text('* 1 tbsp Almonds'),
                    const SizedBox(height: 10.0),
                    Text('* 2 tbsp Soy Saunce'),
                    const SizedBox(height: 10.0),
                    Text('* 2 tbsp Coconut Oil'),
                    const SizedBox(height: 10.0),
                    Text('* 1/2 tbsp Vineager'),
                    const SizedBox(height: 10.0),
                    Text('* 2 tsp Garlic, Gratinated'),
                    const SizedBox(height: 10.0),
                    Text('* 1/2 Cup Diced Red And Green Bell Pepper'),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      child: Text(
                        'Prepration',
                        style: kBodyStyle.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      '* Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '* Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '* Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(thickness: 5.0),
                    const SizedBox(height: 10.0),
                    ListTile(
                      title: Text('Full Plan Price', style: kTitleStyle),
                      trailing: const Text('50\$'),
                    ),
                    const SizedBox(height: 16.0),
                    CustomAsyncBtn(
                      btnTxt: 'Purchase',
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
