import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_%20bar_with_drawer.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_drawer.dart';
import 'package:fuoday/commons/widgets/k_linear_gradient_bg.dart';
import 'package:fuoday/commons/widgets/k_tab_bar.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/di/injection.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/home/presentation/screens/home_employee_activities.dart';
import 'package:fuoday/features/home/presentation/screens/home_employee_feeds.dart';

class HomeEmployeeScreen extends StatefulWidget {
  const HomeEmployeeScreen({super.key});

  @override
  State<HomeEmployeeScreen> createState() => _HomeEmployeeScreenState();
}

class _HomeEmployeeScreenState extends State<HomeEmployeeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String name;
  late String role;
  late String empId;
  late String email;
  late String designation;
  late String profilePhoto;

  Future<void> _loadEmployeeDetails() async {
    final details = getIt<HiveStorageService>().employeeDetails;

    AppLoggerHelper.logInfo("Employee Details (Async): ${details.toString()}");

    name = details?['name'] ?? "No Name";
    role = details?['role'] ?? "No Role";
    empId = details?['empId'] ?? "No Employee ID";
    email = details?['email'] ?? "No Email";
    designation = details?['designation'] ?? "No Designation";
    profilePhoto = details?['profilePhoto'] ?? "No Profile Photo";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadEmployeeDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            key: _scaffoldKey,
            appBar: KAppBarWithDrawer(
              userName: name,
              cachedNetworkImageUrl: profilePhoto,
              userDesignation: designation,
              showUserInfo: false,
              onDrawerPressed: () => _scaffoldKey.currentState?.openDrawer(),
              onNotificationPressed: () {},
            ),
            drawer: KDrawer(),
            body: KLinearGradientBg(
              gradientColor: AppColors.employeeGradientColor,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    Row(
                      spacing: 20.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KCircularCachedImage(
                          imageUrl: profilePhoto,
                          size: 80.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: name,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: AppColors.secondaryColor,
                            ),
                            KText(
                              text: "Employee Id: $empId",
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: AppColors.secondaryColor,
                            ),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          color: AppColors.secondaryColor,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.h,
                              ),
                              child: KTabBar(
                                tabs: [
                                  Tab(text: "Activity"),
                                  Tab(text: "Feeds"),
                                ],
                              ),
                            ),
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
      },
    );
  }
}
