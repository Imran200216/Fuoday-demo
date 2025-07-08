import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_linear_gradient_bg.dart';
import 'package:fuoday/commons/widgets/k_svg.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_assets_constants.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/on_boarding/widgets/on_boarding_btn.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KLinearGradientBg(
        gradientColor: AppColors.employeeGradientColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            KSvg(
              svgPath: AppAssetsConstants.splashLogo,
              height: 100.h,
              width: 100.w,
              boxFit: BoxFit.cover,
            ),

            const Spacer(),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 26.w),
              child: Column(
                spacing: 20.h,
                children: [
                  // SubTitle
                  KText(
                    textAlign: TextAlign.center,
                    text:
                        "Welcome to FUODay! Streamline your day and track everything in one place.",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.secondaryColor,
                  ),

                  // Get Stated Btn
                  OnBoardingBtn(
                    btnText: "Get Started",
                    bgColor: AppColors.onBoardingBgColor,
                    textColor: AppColors.onBoardingTextColor,
                    onTap: () {
                      // Auth Screen
                      GoRouter.of(
                        context,
                      ).pushReplacementNamed(AppRouteConstants.login);
                    },
                    btnHeight: 42.h,
                    btnWidth: 200.w,
                    borderRadius: 12.r,
                  ),

                  KVerticalSpacer(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
