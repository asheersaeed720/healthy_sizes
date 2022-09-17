import 'package:flutter/material.dart';
import 'package:healthy_sizes/utils/app_theme.dart';

const Color kPrimaryColor = Color(0xFFDF01A5);
const Color kSecondaryColor = Color(0xFFD8F6CE);

TextStyle kTitleStyle = TextStyle(
  fontFamily: fontName,
  color: Colors.grey.shade800,
  fontWeight: FontWeight.bold,
  fontSize: 24.0,
);

TextStyle kBodyStyle = TextStyle(
  fontFamily: fontName,
  color: Colors.grey.shade800,
  fontWeight: FontWeight.bold,
  fontSize: 14.0,
);

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 5,
  blurRadius: 7,
  offset: const Offset(0, 3),
);
const double kBorderRadius = 6.0;
