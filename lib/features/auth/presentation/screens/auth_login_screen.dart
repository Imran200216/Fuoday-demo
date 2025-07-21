import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_linear_gradient_bg.dart';
import 'package:fuoday/commons/widgets/k_svg.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_assets_constants.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/extensions/provider_extension.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
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
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController recruiterController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    employeeIdController.dispose();
    recruiterController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: KLinearGradientBg(
        gradientColor: AppColors.employeeGradientColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KVerticalSpacer(height: 40.h),

              KSvg(
                svgPath: AppAssetsConstants.splashLogo,
                height: 100.h,
                width: 100.w,
                boxFit: BoxFit.cover,
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.authBgColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
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
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  width: double.infinity,
                                  height: 100.h,
                                  child: CupertinoSlidingSegmentedControl<int>(
                                    children: {
                                      0: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color:
                                                  context
                                                      .slidingSegmentProviderWatch
                                                      .isRecruiter
                                                  ? AppColors.primaryColor
                                                  : AppColors.secondaryColor,
                                            ),
                                            SizedBox(width: 10.w),
                                            KText(
                                              text: "Employee",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color:
                                                  context
                                                      .slidingSegmentProviderWatch
                                                      .isRecruiter
                                                  ? AppColors.primaryColor
                                                  : AppColors.secondaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      1: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6.h,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color:
                                                  context
                                                      .slidingSegmentProviderWatch
                                                      .isEmployee
                                                  ? AppColors.primaryColor
                                                  : AppColors.secondaryColor,
                                            ),
                                            SizedBox(width: 10.w),
                                            KText(
                                              text: "Recruiter",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color:
                                                  context
                                                      .slidingSegmentProviderWatch
                                                      .isEmployee
                                                  ? AppColors.primaryColor
                                                  : AppColors.secondaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    },
                                    backgroundColor: AppColors.secondaryColor,
                                    thumbColor: AppColors.primaryColor,
                                    groupValue: context
                                        .slidingSegmentProviderRead
                                        .selectedIndex,
                                    onValueChanged: (value) {
                                      if (value != null) {
                                        context.slidingSegmentProviderRead
                                            .setSelectedIndex(value);
                                      }
                                    },
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        textAlign: TextAlign.start,
                                        text: "Hi,\nWelcome back",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                      ),

                                      KVerticalSpacer(height: 20.h),

                                      if (context
                                          .slidingSegmentProviderWatch
                                          .isEmployee)
                                        KAuthTextFormField(
                                          controller: employeeIdController,
                                          suffixIcon: Icons.mail_outline,
                                          keyboardType: TextInputType.text,
                                          hintText: "EMPLOYEE ID",
                                        ),

                                      // Recruiter TextField
                                      if (context
                                          .slidingSegmentProviderWatch
                                          .isRecruiter)
                                        KAuthTextFormField(
                                          controller: recruiterController,
                                          suffixIcon: Icons.mail_outline,
                                          keyboardType: TextInputType.text,
                                          hintText: "RECRUITER ID",
                                        ),

                                      KVerticalSpacer(height: 20.h),

                                      // Password Text Field
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
                                            // Forget Password
                                            GoRouter.of(context).pushNamed(
                                              AppRouteConstants.forgetPassword,
                                            );
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
                                        backgroundColor: AppColors.primaryColor,
                                        onPressed:
                                            context
                                                .slidingSegmentProviderWatch
                                                .isEmployee
                                            ? () async {
                                                // Set Auth Logged In Status
                                                await HiveStorageService()
                                                    .setIsAuthLogged(true);

                                                // Log onboarding status
                                                final status =
                                                    HiveStorageService()
                                                        .isAuthLoggedStatus;
                                                AppLoggerHelper.logInfo(
                                                  'Auth Logged In status: $status',
                                                );

                                                // Employee Bottom Nav screen
                                                GoRouter.of(
                                                  context,
                                                ).pushReplacementNamed(
                                                  AppRouteConstants
                                                      .employeeBottomNav,
                                                );
                                              }
                                            : () {
                                                GoRouter.of(
                                                  context,
                                                ).pushReplacementNamed(
                                                  AppRouteConstants
                                                      .recruiterBottomNav,
                                                );
                                              },
                                        height: 22.h,
                                        width: double.infinity,
                                      ),

                                      KVerticalSpacer(height: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
