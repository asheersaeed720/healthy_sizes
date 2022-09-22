import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/utils/constants.dart';

class ExerciseScreen extends StatelessWidget {
  static const String routeName = '/exercise';

  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 42.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                const Spacer(),
                Text('Exercise', style: kTitleStyle),
                const Spacer(),
                const Text(''),
              ],
            ),
            const SizedBox(height: 20.0),
            Text('Exercise #01', style: kBodyStyle),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Image.asset('assets/images/exercise.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10.0),
            Text('Exercise #02', style: kBodyStyle),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Image.asset('assets/images/exercise.png', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
