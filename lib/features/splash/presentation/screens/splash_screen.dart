import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_linear_gradient_bg.dart';
import 'package:fuoday/commons/widgets/k_svg.dart';
import 'package:fuoday/core/constants/app_assets_constants.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // On Boarding Screen
      GoRouter.of(context).pushReplacementNamed(AppRouteConstants.onBoarding);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KLinearGradientBg(
        gradientColor: AppColors.employeeGradientColor,
        child: Center(
          child: KSvg(
            height: 100.h,
            svgPath: AppAssetsConstants.splashLogo,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
