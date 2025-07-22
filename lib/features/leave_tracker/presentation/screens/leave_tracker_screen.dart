import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_%20bar_with_drawer.dart';
import 'package:fuoday/commons/widgets/k_drawer.dart';
import 'package:fuoday/commons/widgets/k_tab_bar.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/extensions/provider_extension.dart';
import 'package:fuoday/features/leave_tracker/presentation/screens/leave_balance.dart';
import 'package:fuoday/features/leave_tracker/presentation/screens/leave_reports.dart';
import 'package:fuoday/features/leave_tracker/presentation/screens/leave_request.dart';

class LeaveTrackerScreen extends StatefulWidget {
  const LeaveTrackerScreen({super.key});

  @override
  State<LeaveTrackerScreen> createState() => _LeaveTrackerScreenState();
}

class _LeaveTrackerScreenState extends State<LeaveTrackerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final authEntity = context.employeeAuthLoginProviderWatch.authEntity;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: authEntity != null
            ? KAppBarWithDrawer(
                userName: authEntity.data.name,
                cachedNetworkImageUrl:
                    authEntity.data.employeeDetails.profilePhoto,
                userDesignation: authEntity.data.employeeDetails.designation,
                showUserInfo: false,
                onDrawerPressed: _openDrawer,
                onNotificationPressed: () {},
              )
            : null,
        drawer: KDrawer(),

        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Tab bar
              KTabBar(
                tabs: [
                  // Leave Balanced
                  Tab(text: "Leave Balance"),
                  // Leave Reports
                  Tab(text: "Leave Reports"),
                  // Request Leave
                  Tab(text: "Leave Requests"),
                ],
              ),

              KVerticalSpacer(height: 20.h),

              Expanded(
                child: TabBarView(
                  children: [
                    // Leave Balance
                    LeaveBalance(),

                    // Leave Reports
                    LeaveReports(),

                    // Leave Request
                    LeaveRequest(),
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
