import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/welcome_screen.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';

class InitialScreen extends StatefulWidget {
  static const String routeName = '/init';

  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      onSkip: () {
        // debugPrint("On Skip Called....");
        Get.offAndToNamed(WelcomeAuthScreen.routeName);
      },
      showPrevNextButton: true,
      showIndicator: true,
      activeDotColor: kPrimaryColor,
      deactiveDotColor: Colors.grey.shade600,
      iconColor: Colors.grey.shade800,
      leftIcon: Icons.arrow_circle_left_rounded,
      rightIcon: Icons.arrow_circle_right_rounded,
      iconSize: 30,
      pages: [
        OnBoardingModel(
          image: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Image.asset("assets/images/on_boarding_img1.png"),
          ),
          title: "Track Your Health",
          body: "With amazing inbuilt tools you can track your progress.",
        ),
        OnBoardingModel(
          image: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Image.asset("assets/images/on_boarding_img2.png"),
          ),
          title: "Eat Healthy",
          body: "Maintaining good health should be the primary focus of everyone.",
        ),
        OnBoardingModel(
          image: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Image.asset("assets/images/on_boarding_img3.png"),
          ),
          title: "Healthy Recipes",
          body: "Browse thousands of healthy recipes from all over the world.",
        ),
      ],
    );
  }
}
