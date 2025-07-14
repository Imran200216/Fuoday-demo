import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_linear_gradient_bg.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/teams/presentation/screens/teams_list.dart';
import 'package:fuoday/features/teams/presentation/screens/teams_projects.dart';
import 'package:fuoday/features/teams/presentation/screens/teams_reportees.dart';
import 'package:fuoday/features/teams/presentation/screens/teams_tree.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text("Teams"),
          titleTextStyle: GoogleFonts.sora(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryColor,
          ),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: AppColors.secondaryColor),
          ),
        ),
        body: KLinearGradientBg(
          gradientColor: AppColors.employeeGradientColor,
          child: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
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
                            tabAlignment: TabAlignment.center,
                            isScrollable: true,
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
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelStyle: GoogleFonts.sora(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                            tabs: const [
                              // Team Reportees
                              Tab(text: "Reportees"),

                              // Projects
                              Tab(text: "Projects"),

                              // Department
                              Tab(text: "Team Tree"),

                              // Department
                              Tab(text: "Team List"),
                            ],
                          ),
                        ),

                        // Tab View
                        Expanded(
                          child: TabBarView(
                            children: [
                              // Teams Reportee
                              TeamsReportees(),

                              // Projects
                              TeamsProjects(),

                              // Team List
                              TeamsList(),

                              // Teams Tree
                              TeamsTree(),
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
