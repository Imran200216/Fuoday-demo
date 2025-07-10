import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/home/presentation/widgets/k_home_employee_feeds_assigned_works_tile.dart';
import 'package:fuoday/features/home/presentation/widgets/k_home_employee_feeds_pending_works_tile.dart';

class HomeEmployeeFeeds extends StatelessWidget {
  const HomeEmployeeFeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Assigned Works
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD1D7E8), Color(0xFFEFF1F7), Colors.white],
              ),

              border: Border.all(color: AppColors.titleColor, width: 0.2.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Fixed Title - stays at the top
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                  child: KText(
                    text: 'Assigned Works',
                    fontWeight: FontWeight.w600,
                    color: AppColors.subTitleColor,
                    fontSize: 12.sp,
                  ),
                ),

                // Scrollable List
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 14,
                    separatorBuilder: (context, index) {
                      return KVerticalSpacer(height: 8.h);
                    },
                    itemBuilder: (context, index) {
                      return // Assigned Work List Tile
                      KHomeEmployeeFeedsAssignedWorksTile(
                        leadingVerticalDividerColor: AppColors.primaryColor,
                        assignedWorksTitle: "New Product Development",
                        assignedWorkSubTitle: "New Product Development",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          KVerticalSpacer(height: 14.h),

          // Pending Works
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD1D7E8), Color(0xFFEFF1F7), Colors.white],
              ),

              border: Border.all(color: AppColors.titleColor, width: 0.2.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Fixed Title - stays at the top
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                  child: KText(
                    text: 'Pending Works',
                    fontWeight: FontWeight.w600,
                    color: AppColors.subTitleColor,
                    fontSize: 12.sp,
                  ),
                ),

                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 14,
                    separatorBuilder: (context, index) {
                      return KVerticalSpacer(height: 8.h);
                    },
                    itemBuilder: (context, index) {
                      return KHomeEmployeeFeedsPendingWorksTile(
                        pendingVerticalDividerColor: AppColors.primaryColor,
                        pendingProjectTitle: "New Product management",
                        pendingDeadline: "20/07/2025",
                        pendingWorkStatus: "Completed",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          KVerticalSpacer(height: 14.h),
        ],
      ),
    );
  }
}
