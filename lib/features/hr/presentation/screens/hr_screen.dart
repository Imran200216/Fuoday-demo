import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_tab_bar.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/hr/presentation/screens/hr_overview.dart';
import 'package:fuoday/features/hr/presentation/screens/hr_view_open_positions.dart';
import 'package:fuoday/features/hr/presentation/screens/hr_view_recent_employees.dart';
import 'package:go_router/go_router.dart';

class HRScreen extends StatefulWidget {
  const HRScreen({super.key});

  @override
  State<HRScreen> createState() => _HRScreenState();
}

class _HRScreenState extends State<HRScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: KAppBar(
          title: "HR Dashboard",
          centerTitle: true,
          leadingIcon: Icons.arrow_back,
          onLeadingIconPress: () {
            GoRouter.of(context).pop();
          },
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              KCircularCachedImage(
                size: 90.h,
                imageUrl:
                    "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2566&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),

              KVerticalSpacer(height: 24.h),

              // person Card
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

              KVerticalSpacer(height: 30.h),

              KTabBar(
                tabs: [
                  // OverView
                  Tab(text: "Overview"),

                  // Recent Employees
                  Tab(text: "Recent Employees"),

                  // Open Positions
                  Tab(text: "Open Positions"),
                ],
              ),

              KVerticalSpacer(height: 20.h),

              Expanded(
                child: TabBarView(
                  children: [
                    // Overview
                    HROverview(),

                    // Recent Employees
                    HRViewRecentEmployees(),

                    // Open Positions
                    HRViewOpenPositions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
