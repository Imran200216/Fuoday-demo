import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/attendance/presentation/screens/attendance_history.dart';
import 'package:fuoday/features/attendance/presentation/screens/attendance_overview.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: KAppBar(
          title: "Attendance",
          centerTitle: true,
          leadingIcon: Icons.arrow_back,
          onLeadingIconPress: () {
            GoRouter.of(context).pop();
          },
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          openButtonBuilder: DefaultFloatingActionButtonBuilder(
            child: Icon(Icons.menu, color: AppColors.secondaryColor),
            fabSize: ExpandableFabSize.regular,
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),

          distance: 120.0,
          children: [
            // Punctual Arrivals Details
            FloatingActionButton.small(
              heroTag: "punctual_arrivals",
              onPressed: () {
                // Punctual Arrivals Details screen
                GoRouter.of(context).pushNamed(
                  AppRouteConstants.attendancePunctualArrivalsDetails,
                );
              },
              child: Icon(Icons.access_time_filled),
            ),

            // Absent Days Details
            FloatingActionButton.small(
              heroTag: "absent_days",
              onPressed: () {
                // Absent Days Details Screen
                GoRouter.of(
                  context,
                ).pushNamed(AppRouteConstants.attendanceAbsentDetails);
              },
              child: Icon(Icons.person_off),
            ),

            // Late Arrival Details
            FloatingActionButton.small(
              heroTag: "late_arrivals",
              onPressed: () {
                //  Late Arrival Details
                GoRouter.of(
                  context,
                ).pushNamed(AppRouteConstants.attendanceLateArrivalDetails);
              },
              child: Icon(Icons.schedule),
            ),

            // Early  Arrival Details
            FloatingActionButton.small(
              heroTag: "early_arrivals",
              onPressed: () {
                //  Early  Arrival Details
                GoRouter.of(
                  context,
                ).pushNamed(AppRouteConstants.attendanceEarlyArrivalDetails);
              },
              child: Icon(Icons.drive_eta),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TabBar
              TabBar(
                dividerColor: AppColors.transparentColor,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                indicatorColor: AppColors.transparentColor,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: AppColors.primaryColor,
                labelColor: AppColors.secondaryColor,
                labelStyle: GoogleFonts.sora(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: GoogleFonts.sora(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  // About
                  Tab(text: "Attendance Overview"),

                  // Service and Industries
                  Tab(text: "History"),
                ],
              ),

              KVerticalSpacer(height: 20.h),

              Expanded(
                child: TabBarView(
                  children: [
                    // Attendance Overview
                    AttendanceOverview(),

                    // Attendance History
                    AttendanceHistory(),
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
