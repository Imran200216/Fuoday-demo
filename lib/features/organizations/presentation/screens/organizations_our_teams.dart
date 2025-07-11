import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/organizations/presentation/widgets/organizations_team_designation_member_count_heading.dart';
import 'package:fuoday/features/organizations/presentation/widgets/organizations_team_member_tile.dart';

class OrganizationsOurTeams extends StatelessWidget {
  const OrganizationsOurTeams({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // About us
            KText(
              text: "Our Teams",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              color: AppColors.primaryColor,
              isUnderline: true,
              underlineColor: AppColors.primaryColor,
            ),

            KVerticalSpacer(height: 14.h),

            // Administrative
            OrganizationsTeamDesignationMemberCountHeading(
              teamDesignation: "Administrative",
              teamTotalMemberCount: "1",
            ),

            KVerticalSpacer(height: 10.h),

            OrganizationsTeamMemberTile(
              leadingAvatarBgColor: AppColors.primaryColor,
              teamMemberNameFirstLetter: "I",
              teamMemberName: "Mohammed Irfan",
              teamMemberDesignation: "Project Manager",
            ),

            KVerticalSpacer(height: 14.h),

            // Management
            OrganizationsTeamDesignationMemberCountHeading(
              teamDesignation: "Management",
              teamTotalMemberCount: "1",
            ),

            KVerticalSpacer(height: 10.h),

            OrganizationsTeamMemberTile(
              leadingAvatarBgColor: AppColors.primaryColor,
              teamMemberNameFirstLetter: "E",
              teamMemberName: "Eswar",
              teamMemberDesignation: "Project Manager",
            ),
          ],
        ),
      ),
    );
  }
}
