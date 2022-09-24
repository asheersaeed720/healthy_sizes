import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/arrow_widget.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class AppointmentDetailScreen extends StatefulWidget {
  static const String routeName = '/appointment-detail';

  const AppointmentDetailScreen({super.key});

  @override
  State<AppointmentDetailScreen> createState() => _AppointmentDetailScreenState();
}

class _AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 800,
              child: ScreenBgWidget(isHideHeading: true),
            ),
            Positioned(
              top: 50.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                height: 700,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleViewWithBackArrow(),
                    const SizedBox(height: 20.0),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(kBorderRadius),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TabBar(
                              indicatorWeight: 1.0,
                              indicatorColor: Colors.white,
                              labelColor: Colors.white,
                              labelStyle: kBodyStyle,
                              unselectedLabelColor: Colors.grey.shade800,
                              controller: null,
                              onTap: (selected) {
                                setState(() {
                                  _index = selected;
                                });
                                log('_index $_index');
                              },
                              tabs: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _index == 0 ? kPrimaryColor : Colors.white,
                                    borderRadius: BorderRadius.circular(kBorderRadius),
                                  ),
                                  child: const Tab(text: "Home"),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _index == 1 ? kPrimaryColor : Colors.white,
                                    borderRadius: BorderRadius.circular(kBorderRadius),
                                  ),
                                  child: const Tab(text: "Upcoming"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 500, // MediaQuery.of(context).size.height,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                _buildDoctorInfoView(),
                                _buildDoctorInfoView(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
      children: [
        arrowWidget(
          onTap: () {
            Get.back();
          },
        ),
        const Spacer(),
        Text('Appointments', style: kBodyStyle),
        const Spacer(),
        const Text(''),
      ],
    );
  }

  Widget _buildDoctorInfoView() {
    return Column(
      children: [
        Card(
          elevation: 2.0,
          margin: const EdgeInsets.only(top: 10.0),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/no_img_available.jpg',
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
              ),
            ),
            title: Text('Dr. Jhon Doe', style: kBodyStyle),
            subtitle: Text(
              'Thursday July 20th, 10:00 - 10:30 am',
              style: kBodyStyle.copyWith(
                color: kPrimaryColor,
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: [
              CustomAsyncBtn(
                btnTxt: 'Book Now',
                onPress: () {},
              )
            ],
          ),
        ),
        Card(
          elevation: 2.0,
          margin: const EdgeInsets.only(top: 10.0),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/no_img_available.jpg',
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
              ),
            ),
            title: Text('Dr. Jhon Doe', style: kBodyStyle),
            subtitle: Text(
              'Thursday July 20th, 10:00 - 10:30 am',
              style: kBodyStyle.copyWith(
                color: kPrimaryColor,
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: [
              CustomAsyncBtn(
                btnTxt: 'Book Now',
                onPress: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
