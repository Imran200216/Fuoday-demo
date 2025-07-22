import 'package:flutter/material.dart';

class AppColors {
  // Employee gradient Colors
  static const List<Color> employeeGradientColor = [
    Color(0xFF000000), // Black
    Color(0xFF0F84F5), // Bright Blue
    Color(0xFF000000), // Black
  ];

  static const List<Color> cardGradientColor = [
    Color(0xFFD1D7E8),
    Color(0xFFEFF1F7),
    Colors.white,
  ];

  static const List<Color> recruiterGradientColor = [
    Color(0xFF2B57F1), // rgba(43, 87, 241, 1.0)
    Color(0xFF4756A5), // rgba(71, 86, 165, 1.0)
  ];

  static const Color transparentColor = Colors.transparent;

  // Primary Color
  static const Color primaryColor = Color(0xFF003366);

  //Primary GradientColor
  static const List<Color> primaryGradientColors = [
    Color(0xFF000000), // Black
    Color(0xFF0F84F5), // Bright Blue
    Color(0xFF000000), // Black
  ];

  static const Alignment primaryGradientBegin = Alignment.topLeft;
  static const Alignment primaryGradientEnd = Alignment.bottomRight;
  static const List<double> primaryGradientStops = [0.02, 0.38, 1.0];


  // Secondary Color
  static const Color secondaryColor = Colors.white;

  // Title Color
  static const Color titleColor = Color(0xFF000000);

  // subTitle Color
  static const Color subTitleColor = Color(0xFF5584FF);

  // auth Bg Color
  static const Color authBgColor = Color(0xFFE8EEFE);

  // onboarding btn
  static const Color onBoardingBgColor = Color(0xFFFFFFFF);
  static const Color onBoardingTextColor = Color(0xFF2B57F1);

  // auth TextField Colors
  static const Color authTextFieldSuffixIconColor = Color(0xFFC1B1B1);
  static const Color authUnderlineBorderColor = Color(0xFFC1B1B1);

  // Text Btn Color
  static const Color textBtnColor = Color(0xFF3342FD);

  // authBtnColor
  static const Color authBtnColor = Color(0xFF5584FF);
  static const Color authBackToLoginColor = Color(0xFFAACBED);

  // Card hint color
  static const Color cardBorderColor = Color(0xFFD9D9D9);
  static const Color organizationalColor = Color(0xFFDFC148);
  static const Color announcementColor = Color(0xFF6DC57A);

  // check in color
  static const Color checkInColor = Color(0xFF009F00);
  static const Color checkOutColor = Colors.red;
  static const Color locationOnSiteColor = Color(0xFF0043FF);

  static const Color greyColor = Color(0xFF636364);
  static const Color chipColor = Color(0xFFD1D7E8);
  static const Color approvedColor = Color(0xFF009F00);
  static const Color pendingColor = Color(0xFFFFCF28);

  // attendance card light color
  static const Color attendanceCardTextLightColor = Color(0xFFC6CEE4);
}
