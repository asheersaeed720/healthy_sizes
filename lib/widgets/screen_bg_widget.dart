import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthy_sizes/utils/constants.dart';

class ScreenBgWidget extends StatelessWidget {
  const ScreenBgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      color: kSecondaryColor,
      padding: const EdgeInsets.only(top: 72.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Healthy Sizes', style: kTitleStyle.copyWith(fontSize: 26.0)),
          const SizedBox(height: 10.0),
          Text('Helping you to take fitness to the top level.', style: kBodyStyle),
        ],
      ),
    );
  }
}
