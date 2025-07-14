import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfileEducationalBackgroundScreen extends StatefulWidget {
  const ProfileEducationalBackgroundScreen({super.key});

  @override
  State<ProfileEducationalBackgroundScreen> createState() =>
      _ProfileEducationalBackgroundScreenState();
}

class _ProfileEducationalBackgroundScreenState
    extends State<ProfileEducationalBackgroundScreen> {
  bool isEditMode = false;

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  void cancelEdit() {
    // Reset form fields to original values if needed
    setState(() {
      isEditMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Educational Background",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            spacing: 14.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First name TextFormField
              KAuthTextFormField(
                label: "Highest Qualification",
                hintText: "Highest Qualification",
                suffixIcon: isEditMode ? Icons.edit : Icons.school_outlined,
              ),

              // University Clg
              KAuthTextFormField(
                label: "University / Clg",
                hintText: "University / Clg",
                suffixIcon: isEditMode ? Icons.edit : Icons.school_outlined,
              ),

              // Year of Pass
              KAuthTextFormField(
                label: "Year of Pass",
                hintText: "Year of Pass",
                suffixIcon: isEditMode
                    ? Icons.edit
                    : Icons.calendar_month_outlined,
              ),

              // Year of Pass
              KAuthTextFormField(
                label: "Skill set",
                hintText: "Skill set",
                suffixIcon: isEditMode
                    ? Icons.edit
                    : Icons.description_outlined,
              ),

              KVerticalSpacer(height: 16.h),

              // Cancel Btn
              isEditMode
                  ? KAuthFilledBtn(
                      backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                      fontSize: 10.sp,
                      text: "Cancel",
                      onPressed: () {
                        cancelEdit();
                      },
                      height: 22.h,
                      width: double.infinity,
                    )
                  : SizedBox(),

              // Back to Login Btn
              KAuthFilledBtn(
                backgroundColor: AppColors.primaryColor,
                fontSize: 10.sp,
                text: isEditMode ? "Submit" : "Edit",
                onPressed: () {
                  toggleEditMode();
                },
                height: 22.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
