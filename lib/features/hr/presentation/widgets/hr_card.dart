import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';

class HRCard extends StatelessWidget {
  final String hrTotalEmployees;
  final IconData attendancePercentageIcon;
  final Color attendancePercentageColor;
  final Color attendanceIconColor;
  final String attendanceCount;
  final IconData attendanceCardIcon;
  final String attendanceDescription;

  const HRCard({
    super.key,
    required this.hrTotalEmployees,
    required this.attendancePercentageIcon,
    required this.attendanceCount,
    required this.attendanceCardIcon,
    required this.attendanceDescription,
    required this.attendanceIconColor,
    required this.attendancePercentageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 0.4.sw,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            border: Border.all(width: 0.1.w, color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(8.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.cardGradientColor,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Attendance count
              KText(
                text: attendanceCount,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.titleColor,
              ),

              KVerticalSpacer(height: 8.h),

              // Attendance Description
              KText(
                text: attendanceDescription,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: AppColors.titleColor,
              ),

              KVerticalSpacer(height: 4.h),

              Row(
                spacing: 4.w,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    attendancePercentageIcon,
                    color: attendanceIconColor,
                    size: 14.w,
                  ),

                  // Percentage Text
                  KText(
                    text: hrTotalEmployees,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: attendancePercentageColor,
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          top: 10,
          right: 20,
          child: CircleAvatar(
            radius: 14.r,
            backgroundColor: AppColors.secondaryColor,
            child: Icon(attendanceCardIcon, color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
