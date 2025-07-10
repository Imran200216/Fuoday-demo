import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/teams/presentation/widgets/k_team_direct_report_tile.dart';

class TeamsReportees extends StatelessWidget {
  const TeamsReportees({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KVerticalSpacer(height: 20.h),

          // Direct Report
          KText(
            text: "Direct Report",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.titleColor,
          ),

          KVerticalSpacer(height: 12.h),

          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return KTeamDirectReportTile(
                  personName: "Irfan Mohammed",
                  personRole: "CEO of Thikse",
                  personContact: "irfanmohammed@gmail.com",
                  avatarPersonFirstLetter: "I",
                  avatarBgColor: AppColors.primaryColor,
                );
              },
              separatorBuilder: (context, index) {
                return KVerticalSpacer(height: 10.h);
              },
              itemCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
