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
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_btn.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class AuthOtpScreen extends StatelessWidget {
  const AuthOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KLinearGradientBg(
        gradientColor: AppColors.employeeGradientColor,
        child: Container(
          margin: EdgeInsets.only(top: 40.h),
          child: SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                            text: "Start Your Experience",
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),

                        KVerticalSpacer(height: 10.h),

                        // Login Now
                        KText(
                          text: "Login Now",
                          fontWeight: FontWeight.w500,
                          color: AppColors.subTitleColor,
                          fontSize: 14.sp,
                        ),

                        KVerticalSpacer(height: 20.h),

                        // Otp path
                        KSvg(
                          svgPath: AppAssetsConstants.otpImg,
                          height: 0.2.sh,
                          boxFit: BoxFit.contain,
                        ),

                        KVerticalSpacer(height: 30.h),

                        // Verification Code Text
                        KText(
                          text: "Enter Verification Code",
                          fontWeight: FontWeight.w600,
                          color: AppColors.titleColor,
                          fontSize: 16.sp,
                        ),

                        KVerticalSpacer(height: 20.h),

                        // Verification Code Description
                        KText(
                          text: "We Sent a code to yoga******@gmail.com",
                          fontWeight: FontWeight.w400,
                          color: AppColors.titleColor,
                          fontSize: 12.sp,
                        ),

                        KVerticalSpacer(height: 20.h),

                        // Otp
                        Pinput(
                          length: 6,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          obscureText: true,
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: GoogleFonts.sora(
                              fontSize: 20,
                              color: Colors.black, // Text color
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              // Background color
                              border: Border.all(color: Colors.grey[300]!),
                              // Border color
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        KVerticalSpacer(height: 20.h),

                        // Verify Btn
                        KAuthFilledBtn(
                          backgroundColor: AppColors.authBtnColor,
                          fontSize: 10.sp,
                          text: "Verify",
                          onPressed: () {
                            // Login
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouteConstants.login);
                          },
                          height: 22.h,
                          width: double.infinity,
                        ),

                        KVerticalSpacer(height: 20.h),

                        // Text
                        KText(
                          text: "Don’t receive OTP code ?",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: AppColors.textBtnColor,
                        ),

                        // Text Btn
                        KAuthTextBtn(
                          onTap: () {},
                          text: "Resend code now",
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          textAlign: TextAlign.center,
                          textColor: AppColors.textBtnColor,
                          showUnderline: true,
                        ),
                      ],
                    ),
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
