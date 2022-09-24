import 'package:flutter/material.dart';
import 'package:healthy_sizes/utils/constants.dart';

Widget arrowWidget({Icon? icon, required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(
        right: 5.0,
        left: 4.0,
        top: 5.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: icon ??
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 18.0,
          ),
    ),
  );
}
