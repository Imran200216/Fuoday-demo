import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_linear_gradient_bg.dart';
import 'package:fuoday/commons/widgets/k_svg.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_assets_constants.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_password_text_field.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  int? _sliding = 0;

  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController recruiterController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    employeeIdController.dispose();
    passwordController.dispose();
    recruiterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KLinearGradientBg(
        gradientColor: AppColors.employeeGradientColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Logo
                KSvg(
                  svgPath: AppAssetsConstants.splashLogo,
                  height: 80.h,
                  width: 80.w,
                  boxFit: BoxFit.cover,
                ),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.authBgColor,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: KText(
                          text: "Start Your Experience",
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),

                      KVerticalSpacer(height: 10.h),

                      KText(
                        text: "Login Now",
                        fontWeight: FontWeight.w500,
                        color: AppColors.subTitleColor,
                        fontSize: 14.sp,
                      ),

                      KVerticalSpacer(height: 20.h),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: double.infinity,
                        height: 100.h,
                        child: CupertinoSlidingSegmentedControl<int>(
                          children: {
                            0: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: _sliding == 1
                                        ? AppColors.primaryColor
                                        : AppColors.secondaryColor,
                                  ),
                                  SizedBox(width: 10.w),
                                  KText(
                                    text: "Employee",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: _sliding == 1
                                        ? AppColors.primaryColor
                                        : AppColors.secondaryColor,
                                  ),
                                ],
                              ),
                            ),
                            1: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: _sliding == 0
                                        ? AppColors.primaryColor
                                        : AppColors.secondaryColor,
                                  ),
                                  SizedBox(width: 10.w),
                                  KText(
                                    text: "Recruiter",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: _sliding == 0
                                        ? AppColors.primaryColor
                                        : AppColors.secondaryColor,
                                  ),
                                ],
                              ),
                            ),
                          },
                          backgroundColor: AppColors.secondaryColor,
                          thumbColor: AppColors.primaryColor,
                          groupValue: _sliding,
                          onValueChanged: (value) {
                            setState(() {
                              _sliding = value;
                            });
                          },
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              textAlign: TextAlign.start,
                              text: "Hi,\nWelcome back",
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),

                            KVerticalSpacer(height: 20.h),

                            if (_sliding == 0)
                              KAuthTextFormField(
                                controller: employeeIdController,
                                suffixIcon: Icons.mail_outline,
                                keyboardType: TextInputType.text,
                                hintText: "EMPLOYEE ID",
                              ),
                            if (_sliding == 1)
                              KAuthTextFormField(
                                controller: recruiterController,
                                suffixIcon: Icons.mail_outline,
                                keyboardType: TextInputType.text,
                                hintText: "RECRUITER ID",
                              ),

                            KVerticalSpacer(height: 20.h),

                            KAuthPasswordTextField(
                              controller: passwordController,
                              hintText: "PASSWORD",
                            ),

                            KVerticalSpacer(height: 12.h),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: KAuthTextBtn(
                                showUnderline: true,
                                onTap: () {
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouteConstants.forgetPassword);
                                },
                                text: "Forget Password?",
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                textAlign: TextAlign.end,
                                textColor: AppColors.textBtnColor,
                              ),
                            ),

                            KVerticalSpacer(height: 20),

                            KAuthFilledBtn(
                              fontSize: 10.sp,
                              text: "Login",
                              onPressed: _sliding == 0
                                  ? () {
                                      // Home Employee
                                      GoRouter.of(context).pushReplacementNamed(
                                        AppRouteConstants.employeeBottomNav,
                                      );
                                    }
                                  : () {
                                      // Home Employee
                                      GoRouter.of(context).pushReplacementNamed(
                                        AppRouteConstants.recruiterBottomNav,
                                      );
                                    },
                              height: 22.h,
                              width: double.infinity,
                            ),
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
      ),
    );
  }
}
