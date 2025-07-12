import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_card.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_welcoming_card.dart';
import 'package:go_router/go_router.dart';

class AttendanceOverview extends StatelessWidget {
  const AttendanceOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // Attendance Welcoming Card
          AttendanceWelcomingCard(
            attendanceCardTime: "09:02:04 AM",
            attendanceCardTimeMessage: "Good Morning",
            attendanceDay: "Today",
            attendanceDate: "26 July 2025",
            onViewAttendance: () {
              // Total Attendance View Screen
              GoRouter.of(
                context,
              ).pushNamed(AppRouteConstants.totalAttendanceView);
            },
          ),

          KVerticalSpacer(height: 20.h),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1.3,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return AttendanceCard(
                attendancePercentage: "Employee",
                attendancePercentageIcon: Icons.add_circle_outlined,
                attendanceCount: "345",
                attendanceCardIcon: Icons.person,
                attendanceDescription: "Total Attendance",
                attendanceIconColor: AppColors.primaryColor,
                attendancePercentageColor: AppColors.checkInColor,
              );
            },
          ),
        ],
      ),
    );
  }
}
