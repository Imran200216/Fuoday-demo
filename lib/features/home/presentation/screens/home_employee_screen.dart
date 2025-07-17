import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_%20bar_with_drawer.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_drawer.dart';
import 'package:fuoday/commons/widgets/k_linear_gradient_bg.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/home/presentation/screens/home_employee_activities.dart';
import 'package:fuoday/features/home/presentation/screens/home_employee_feeds.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeEmployeeScreen extends StatefulWidget {
  const HomeEmployeeScreen({super.key});

  @override
  State<HomeEmployeeScreen> createState() => _HomeEmployeeScreenState();
}

class _HomeEmployeeScreenState extends State<HomeEmployeeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: KAppBarWithDrawer(
          showUserInfo: false,
          onDrawerPressed: () {
            _openDrawer();
          },
          onNotificationPressed: () {},
        ),
        drawer: KDrawer(),
        body: KLinearGradientBg(
          gradientColor: AppColors.employeeGradientColor,
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  spacing: 20.w,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KCircularCachedImage(
                      imageUrl:
                          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      size: 80.h,
                    ),
                    Column(
                      spacing: 2.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Username
                        KText(
                          text: "John",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppColors.secondaryColor,
                        ),

                        // Employee Id
                        KText(
                          text: "Employee Id: 12345",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: AppColors.secondaryColor,
                        ),

                        // Employee Phone Number
                        KText(
                          text: "+91-6369476256",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: AppColors.secondaryColor,
                        ),
                      ],
                    ),
                  ],
                ),

                KVerticalSpacer(height: 20.h),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      color: AppColors.secondaryColor,
                    ),
                    child: Column(
                      children: [
                        // TabBar
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            left: 20.w,
                            right: 20.w,
                          ),
                          child: TabBar(
                            dividerColor: AppColors.transparentColor,
                            indicator: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            indicatorColor: AppColors.transparentColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: AppColors.primaryColor,
                            labelColor: AppColors.secondaryColor,
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            tabs: const [
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.local_activity),
                                    SizedBox(width: 8),
                                    Text("Activity"),
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.feed),
                                    SizedBox(width: 8),
                                    Text("Feeds"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Tab View
                        Expanded(
                          child: TabBarView(
                            children: [
                              HomeEmployeeActivities(),

                              HomeEmployeeFeeds(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
