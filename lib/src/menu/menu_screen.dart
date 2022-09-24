import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/appointment/appointment_screen.dart';
import 'package:healthy_sizes/src/auth/views/login_screen.dart';
import 'package:healthy_sizes/src/diet/diet_plan_screen.dart';
import 'package:healthy_sizes/src/exercise/exercise_screen.dart';
import 'package:healthy_sizes/src/fitness/fitness_plan_screen.dart';
import 'package:healthy_sizes/src/main/main_screen_controller.dart';
import 'package:healthy_sizes/src/meal/meal_plan_screen.dart';
import 'package:healthy_sizes/src/meditation/meditation_plan_screen.dart';
import 'package:healthy_sizes/src/step_count/step_count_screen.dart';
import 'package:healthy_sizes/utils/constants.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/menu';

  MenuScreen({super.key});

  final _mainScreenCtrl = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
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
                  InkWell(
                    onTap: () {
                      Get.toNamed(MealPlanScreen.routeName);
                    },
                    child: const Text('Home'),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(DietPlanScreen.routeName);
                    },
                    child: Container(
                      color: kPrimaryColor,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Purchase diet and fitness plan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(FitnessPlanScreen.routeName);
                    },
                    child: const Text('Fitness Plan'),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      _mainScreenCtrl.onItemTapped(0);
                    },
                    child: const Text('Meal Plan'),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppointmentScreen.routeName);
                    },
                    child: const Text('Appointments'),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      _mainScreenCtrl.onItemTapped(1);
                    },
                    child: const Text('Nutrition and Fitness Exercise'),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MeditationPlanScreen.routeName);
                    },
                    child: const Text('Meditation Plan'),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(StepCountScreen.routeName);
                    },
                    child: const Text('Calories and Step Counting'),
                  ),
                  const Divider(
                    thickness: 2.0,
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(ExerciseScreen.routeName);
                    },
                    child: const Text('Exercise to Relieve Stress'),
                  ),
                  const Spacer(),
                  ListTile(
                    onTap: () {
                      Get.offAllNamed(LogInScreen.routeName);
                    },
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Logout'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
