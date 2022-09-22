import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/explore/explore_screen.dart';
import 'package:healthy_sizes/src/main/main_screen_controller.dart';
import 'package:healthy_sizes/src/meal/meal_plan_screen.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

import '../menu/menu_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenController _mainScreenCtrl = Get.find();

  final List<Widget> _widgetOptions = <Widget>[
    const MealPlanScreen(),
    ExploreScreen(),
    const Text(
      'Index 2:',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    log('height $height');
    return GetBuilder<MainScreenController>(
      builder: (_) {
        if (_mainScreenCtrl.selectedIndex == 1) {
          return ExploreScreen();
        } else if (_mainScreenCtrl.selectedIndex == 3) {
          return MenuScreen();
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const SizedBox(
                  height: 1190,
                  child: ScreenBgWidget(),
                ),
                Positioned(
                  top: 170.0,
                  left: 20.0,
                  right: 20.0,
                  child: Container(
                    height: 1010,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: _widgetOptions.elementAt(_mainScreenCtrl.selectedIndex),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
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
        );
      },
    );
  }
}
