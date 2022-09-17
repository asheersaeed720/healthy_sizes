import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/main/main_screen_controller.dart';
import 'package:healthy_sizes/src/welcome_screen.dart';
import 'package:healthy_sizes/utils/constants.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/menu';

  MenuScreen({super.key});

  final _mainScreenCtrl = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Menu', style: kTitleStyle),
                const SizedBox(height: 30.0),
                const Text('Home'),
                const Divider(
                  thickness: 2.0,
                  height: 30.0,
                ),
                InkWell(
                  onTap: () {
                    // _mainScreenCtrl.onItemTapped(4);
                  },
                  child: const Text('Fitness Plan'),
                ),
                const Divider(
                  thickness: 2.0,
                  height: 30.0,
                ),
                InkWell(
                  onTap: () {
                    _mainScreenCtrl.onItemTapped(0);
                  },
                  child: const Text('Meal Plan'),
                ),
                const Divider(
                  thickness: 2.0,
                  height: 30.0,
                ),
                const Text('Appointments'),
                // const Divider(thickness: 2.0),
                const Spacer(),
                ListTile(
                  onTap: () {
                    Get.toNamed(WelcomeAuthScreen.routeName);
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
