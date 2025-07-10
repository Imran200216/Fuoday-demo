import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';

class TeamsTree extends StatelessWidget {
  const TeamsTree({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          KVerticalSpacer(height: 20.h),

          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.subTitleColor, width: 1.w),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Person Avatar
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fHww",
                    ),
                    radius: 25.r, // Smaller for flow chart
                  ),

                  SizedBox(height: 6.h),

                  // Person Name
                  KText(
                    text: "Irfan",
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                    color: AppColors.titleColor,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 3.h),

                  // Person Role
                  KText(
                    text: "FOUNDER & CEO",
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp,
                    color: AppColors.greyColor,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
