import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfileProfessionalExperienceScreen extends StatelessWidget {
  const ProfileProfessionalExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        actionsWidgets: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outlined,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
        title: "Professional Experience",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      bottomSheet: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Center(
          child: Column(
            spacing: 12.h,
            children: [
              KAuthFilledBtn(
                backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                fontSize: 10.sp,
                text: "Cancel",
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                height: 22.h,
                width: double.infinity,
              ),

              // Back to Login Btn
              KAuthFilledBtn(
                backgroundColor: AppColors.primaryColor,
                fontSize: 10.sp,
                text: "Submit",
                onPressed: () {},
                height: 22.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            spacing: 14.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company name
              KAuthTextFormField(
                hintText: "Company Name",
                suffixIcon: Icons.location_city,
                label: "Company Name",
              ),

              // No of years
              KAuthTextFormField(
                hintText: "No of years",
                suffixIcon: Icons.timelapse_outlined,
                label: "No of years",
              ),

              // Role
              KAuthTextFormField(
                hintText: "Role",
                suffixIcon: Icons.person_outline,
                label: "Role",
              ),

              // Duration
              KAuthTextFormField(
                hintText: "Duration",
                suffixIcon: Icons.timelapse_outlined,
                label: "Duration",
              ),

              // Achievements
              KAuthTextFormField(
                hintText: "Achievements",
                suffixIcon: Icons.wine_bar,
                label: "Achievements",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
