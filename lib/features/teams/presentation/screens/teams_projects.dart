import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/features/teams/presentation/widgets/k_team_project_tile.dart';

class TeamsProjects extends StatelessWidget {
  const TeamsProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return KTeamProjectTile(
            projectName: "Inventory Management System",
            projectDomain: "Furniture Industry",
            projectTeamMembers: ["I", "J", "K"],
            projectStartMonthDate: "September 15",
            projectStatus: true,
            projectReview: "Excellent proposal, Irfan. Proceed with the plan",
          );
        },
        separatorBuilder: (context, index) {
          return KVerticalSpacer(height: 10.h);
        },
        itemCount: 30,
      ),
    );
  }
}
