import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/auth/views/login_screen.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

import 'auth/views/signup_screen.dart';

class WelcomeAuthScreen extends StatelessWidget {
  static const String routeName = '/welcome-auth';

  const WelcomeAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          const ScreenBgWidget(),
          Positioned(
            top: 170.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 42.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius),
                boxShadow: [kBoxShadow],
              ),
              child: Column(
                children: [
                  Text(
                    "Log In And Sign Up For the Better Health.",
                    style: kBodyStyle,
                  ),
                  const SizedBox(height: 18.0),
                  CustomAsyncBtn(
                    width: MediaQuery.of(context).size.width * 0.8,
                    btnTxt: 'Log In',
                    onPress: () {
                      Get.toNamed(LogInScreen.routeName);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 44.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(SignUpScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.purple,
                        ),
                      ),
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  _buildCustomDividerView(),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/facebook.png', width: 38.0),
                      const SizedBox(width: 24.0),
                      Image.asset('assets/icons/twitter.png', width: 38.0),
                      const SizedBox(width: 24.0),
                      Image.asset('assets/icons/google.png', width: 38.0),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCustomDividerView() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            width: 100.0,
            height: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              'or',
              style: kBodyStyle,
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            width: 100.0,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
