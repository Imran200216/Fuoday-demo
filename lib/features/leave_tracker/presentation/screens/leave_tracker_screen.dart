import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_%20bar.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_drawer_list_tile.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      key: _scaffoldKey,
      appBar: KAppBar(
        showUserInfo: true,
        onDrawerPressed: () {
          _openDrawer();
        },
        onNotificationPressed: () {},
      ),
      drawer: Drawer(
        backgroundColor: AppColors.secondaryColor,
        child: Column(
          children: [
            // Profile Header
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColors.primaryColor),
              accountName: KText(
                text: "Irfan",
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),

              accountEmail: KText(
                text: "irfanmohammed@gmail.com",
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),

              currentAccountPicture: KCircularCachedImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                size: 200.h,
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,

                children: [
                  KDrawerListTile(
                    drawerTitle: "My Zone",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.person,
                  ),

                  KDrawerListTile(
                    drawerTitle: "Teams",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.group,
                  ),

                  KDrawerListTile(
                    drawerTitle: "Organization",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.location_city,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Divider(
                      color: AppColors.subTitleColor.withOpacity(0.2),
                    ),
                  ),

                  KDrawerListTile(
                    drawerTitle: "Attendance",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.add_chart,
                  ),

                  KDrawerListTile(
                    drawerTitle: "Leave Tracker",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.account_tree,
                  ),

                  KDrawerListTile(
                    drawerTitle: "Time Tracker",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.timelapse,
                  ),

                  // HR
                  KDrawerListTile(
                    drawerTitle: "HR",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.hail_rounded,
                  ),

                  // Pay Slip
                  KDrawerListTile(
                    drawerTitle: "Pay Slip",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.payment_rounded,
                  ),

                  // Pay Slip
                  KDrawerListTile(
                    drawerTitle: "Performance",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.quick_contacts_dialer,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Divider(
                      color: AppColors.subTitleColor.withOpacity(0.2),
                    ),
                  ),

                  // Pay Slip
                  KDrawerListTile(
                    drawerTitle: "Settings",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.settings,
                  ),

                  // Pay Slip
                  KDrawerListTile(
                    drawerTitle: "Support",
                    drawerListTileOnTap: () {},
                    drawerLeadingIcon: Icons.support_agent,
                  ),

                  // Pay Slip
                  KDrawerListTile(
                    drawerTitle: "Logout",
                    drawerListTileOnTap: () {
                      // Login Page
                      GoRouter.of(
                        context,
                      ).pushReplacementNamed(AppRouteConstants.login);
                    },
                    drawerLeadingIcon: Icons.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Center(child: Text("hi leave tracker")),
    );
  }
}
