import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_%20bar_with_drawer.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: KAppBarWithDrawer(
        showUserInfo: true,
        onDrawerPressed: () {
          _openDrawer();
        },
        onNotificationPressed: () {},
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // profile image
              KCircularCachedImage(
                size: 90.h,
                imageUrl:
                    "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2566&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),

              SizedBox(height: 24.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.greyColor.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.cardGradientColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // name
                    KText(
                      text: "Mohammed Irfan",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.titleColor,
                    ),

                    KVerticalSpacer(height: 6.h),

                    // emp Id
                    KText(
                      text: "Employee ID: 1043",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),

                    KVerticalSpacer(height: 3.h),

                    // Phone No
                    KText(
                      text: "Phone No: 636909876",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Personal Details
              ProfileListTile(
                onTap: () {
                  // Personal Details Screen
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouteConstants.profilePersonalDetails);
                },
                leadingIcon: Icons.person,
                title: "Personal Details",
              ),

              // Employment Details
              ProfileListTile(
                onTap: () {
                  // Employment Details Screen
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouteConstants.profileEmploymentDetails);
                },
                leadingIcon: Icons.person,
                title: "Employment Details",
              ),

              // Educational Details
              ProfileListTile(
                onTap: () {
                  // Educational Details
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouteConstants.profileEducationalBackground);
                },
                leadingIcon: Icons.school,
                title: "Educational Background",
              ),

              // On boarding
              ProfileListTile(
                onTap: () {
                  // On Boarding
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouteConstants.profileOnBoarding);
                },
                leadingIcon: Icons.departure_board,
                title: "On boarding",
              ),

              // Professional Experience
              ProfileListTile(
                onTap: () {
                  // Professional Experience
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouteConstants.profileProfessionalExperience);
                },
                leadingIcon: Icons.scale,
                title: "Professional Experience",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
