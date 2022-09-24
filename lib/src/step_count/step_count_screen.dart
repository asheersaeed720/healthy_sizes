import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/arrow_widget.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class StepCountScreen extends StatelessWidget {
  static const String routeName = '/step-count';

  const StepCountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 700,
              child: ScreenBgWidget(isHideHeading: true),
            ),
            Positioned(
              top: 50.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                height: 600,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 3.0, color: Colors.blue),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleViewWithBackArrow(),
                    const SizedBox(height: 20.0),
                    _buildHeaderView('Steps'),
                    const SizedBox(height: 20.0),
                    _buildCaloriesCircleView(),
                    const SizedBox(height: 18.0),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: '3.5\n',
                          style: kTitleStyle.copyWith(color: kPrimaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: '   KM',
                              style: kBodyStyle.copyWith(
                                fontSize: 10.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    _buildHeaderView('Calories'),
                    const SizedBox(height: 20.0),
                    _buildKcalAvailableView(),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/button_bg.png'),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Breakfast\n',
                              style: kTitleStyle.copyWith(
                                color: kPrimaryColor,
                                fontSize: 20.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Recommended 447 Kcal',
                                  style: kBodyStyle.copyWith(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          arrowWidget(
                            icon: const Icon(Icons.add, color: Colors.white, size: 18.0),
                            onTap: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleViewWithBackArrow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        arrowWidget(
          onTap: () {
            Get.back();
          },
        ),
        Text('2 May, Monday', style: kBodyStyle),
        const Icon(Icons.date_range),
      ],
    );
  }

  Widget _buildHeaderView(String title) {
    return Container(
      width: double.infinity,
      height: 44.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/header.png'),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: kBodyStyle.copyWith(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _buildCaloriesCircleView() {
    return Container(
      height: 130.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/circle.png'),
        ),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: '350\n',
            style: kTitleStyle.copyWith(color: kPrimaryColor),
            children: <TextSpan>[
              TextSpan(
                text: '  Steps',
                style: kBodyStyle.copyWith(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKcalAvailableView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: kBodyStyle.copyWith(fontSize: 20.0),
            children: [
              const TextSpan(
                text: "  ",
              ),
              WidgetSpan(
                child: Image.asset('assets/icons/fire.png'),
              ),
              TextSpan(
                text: "\n690",
                style: kTitleStyle.copyWith(color: kPrimaryColor),
              ),
              TextSpan(
                text: "\n   burn",
                style: kBodyStyle.copyWith(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: ' 1645',
            style: kTitleStyle,
            children: <TextSpan>[
              TextSpan(
                text: '\nKcal available',
                style: kBodyStyle.copyWith(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: kBodyStyle.copyWith(fontSize: 20.0),
            children: [
              const TextSpan(
                text: "  ",
              ),
              WidgetSpan(
                child: Image.asset('assets/icons/restaurant.png'),
              ),
              TextSpan(
                text: "\n536",
                style: kTitleStyle.copyWith(color: kPrimaryColor),
              ),
              TextSpan(
                text: "\n  eaten",
                style: kBodyStyle.copyWith(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
