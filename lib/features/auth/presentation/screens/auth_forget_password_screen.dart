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
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class AuthForgetPasswordScreen extends StatefulWidget {
  const AuthForgetPasswordScreen({super.key});

  @override
  State<AuthForgetPasswordScreen> createState() =>
      _AuthForgetPasswordScreenState();
}

class _AuthForgetPasswordScreenState extends State<AuthForgetPasswordScreen> {
  // email controller
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KLinearGradientBg(
        gradientColor: AppColors.employeeGradientColor,
        child: Container(
          margin: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // App Logo
              KSvg(
                svgPath: AppAssetsConstants.splashLogo,
                height: 80.h,
                width: 80.w,
                boxFit: BoxFit.cover,
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.authBgColor,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Start your experience
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: KText(
                          text: "Recover | Reset your password",
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),

                      KVerticalSpacer(height: 20.h),

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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Forget Password Text
                            KText(
                              textAlign: TextAlign.center,
                              text: "Forgot Password",
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),

                            KVerticalSpacer(height: 10.h),

                            // Forget Password Text
                            KText(
                              textAlign: TextAlign.center,
                              text:
                                  "Enter the email you used to create your account so we can send you a link for reseting your password",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),

                            KVerticalSpacer(height: 20.h),

                            // Employee Id
                            KAuthTextFormField(
                              controller: emailController,
                              suffixIcon: Icons.mail_outline,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "EMAIL ADDRESS",
                            ),

                            KVerticalSpacer(height: 20.h),

                            // Send Btn
                            KAuthFilledBtn(
                              backgroundColor: AppColors.authBtnColor,
                              fontSize: 10.sp,
                              text: "Send",
                              onPressed: () {
                                // OTP
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRouteConstants.otp);
                              },
                              height: 22.h,
                              width: double.infinity,
                            ),

                            KVerticalSpacer(height: 12.h),

                            // back to Login Btn
                            KAuthFilledBtn(
                              backgroundColor: AppColors.authBackToLoginColor,
                              fontSize: 10.sp,
                              text: "Back to Login",
                              onPressed: () {
                                // Back
                                GoRouter.of(context).pop();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
