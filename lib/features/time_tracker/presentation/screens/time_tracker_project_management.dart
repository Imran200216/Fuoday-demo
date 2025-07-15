import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';

class TimeTrackerProjectManagement extends StatelessWidget {
  const TimeTrackerProjectManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KText(
            text: "Project Management",
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: AppColors.titleColor,
          ),

          KVerticalSpacer(height: 10.h),
        ],
      ),
    );
  }
}
