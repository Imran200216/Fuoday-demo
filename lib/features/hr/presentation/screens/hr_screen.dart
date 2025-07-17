import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../commons/widgets/k_app_bar.dart';
import '../../../../commons/widgets/k_circular_cache_image.dart';
import '../../../../commons/widgets/k_text.dart';
import '../../../../commons/widgets/k_vertical_spacer.dart';
import '../../../../core/themes/app_colors.dart';

class HRScreen extends StatefulWidget {
  const HRScreen({super.key});

  @override
  State<HRScreen> createState() => _HRScreenState();
}

class _HRScreenState extends State<HRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "HR Dashboard",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KCircularCachedImage(
                size: 90.h,
                imageUrl:
                "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2566&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),

              SizedBox(height: 24.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.greyColor.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.cardGradientColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // name
                    KText(
                      text: "Mohammed Irfan",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.titleColor,
                    ),

                    KVerticalSpacer(height: 6.h),

                    // emp Id
                    KText(
                      text: "Employee ID: 1043",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),

                    KVerticalSpacer(height: 3.h),

                    // Phone No
                    KText(
                      text: "Flutter Developer",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
      )
    );
  }
}
