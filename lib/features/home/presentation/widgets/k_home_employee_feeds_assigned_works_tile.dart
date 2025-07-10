import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class KHomeEmployeeFeedsAssignedWorksTile extends StatelessWidget {
  final Color leadingVerticalDividerColor;
  final String assignedWorksTitle;
  final String assignedWorkSubTitle;

  const KHomeEmployeeFeedsAssignedWorksTile({
    super.key,
    required this.leadingVerticalDividerColor,
    required this.assignedWorksTitle,
    required this.assignedWorkSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ListTile(
        // Leading
        leading: Container(
          width: 3.w,
          decoration: BoxDecoration(
            color: leadingVerticalDividerColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),

        // Title
        title: Text(assignedWorksTitle),
        titleTextStyle: GoogleFonts.sora(
          fontWeight: FontWeight.w600,
          color: AppColors.titleColor,
          fontSize: 12.sp,
        ),

        // SubTitle
        subtitle: Text(assignedWorkSubTitle),
        subtitleTextStyle: GoogleFonts.sora(
          fontWeight: FontWeight.w500,
          color: AppColors.greyColor,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
