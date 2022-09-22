import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthy_sizes/utils/constants.dart';

class ScreenBgWidget extends StatelessWidget {
  const ScreenBgWidget({this.paddingTop = 72.0, this.isHideHeading = false, super.key});

  final double paddingTop;
  final bool isHideHeading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          color: kSecondaryColor,
          padding: EdgeInsets.only(top: paddingTop),
          child: isHideHeading
              ? const SizedBox.shrink()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Healthy Sizes', style: kTitleStyle.copyWith(fontSize: 26.0)),
                    const SizedBox(height: 10.0),
                    Text('Helping you to take fitness to the top level.', style: kBodyStyle),
                  ],
                ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.white,
        ),
      ],
    );
  }
}
