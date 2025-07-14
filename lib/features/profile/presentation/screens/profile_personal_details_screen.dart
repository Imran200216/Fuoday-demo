import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfilePersonalDetailsScreen extends StatefulWidget {
  const ProfilePersonalDetailsScreen({super.key});

  @override
  State<ProfilePersonalDetailsScreen> createState() =>
      _ProfilePersonalDetailsScreenState();
}

class _ProfilePersonalDetailsScreenState
    extends State<ProfilePersonalDetailsScreen> {
  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isEditMode = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    aboutController.dispose();
    dobController.dispose();
    contactController.dispose();
    addressController.dispose();
    super.dispose();
  }

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
        title: "Personal Details",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // profile image
              Align(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Profile Image
                    KCircularCachedImage(
                      size: 90.h,
                      imageUrl:
                          "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2566&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    ),

                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryColor,
                            border: Border.all(
                              color: AppColors.greyColor,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              KVerticalSpacer(height: 20.h),

              // First name TextFormField
              KAuthTextFormField(
                hintText: "First Name",
                suffixIcon: isEditMode ? Icons.edit : Icons.person_outline,
              ),

              KVerticalSpacer(height: 12.h),

              // Last name text form field
              KAuthTextFormField(
                hintText: "Last Name",
                suffixIcon: isEditMode ? Icons.edit : Icons.person_outline,
              ),

              KVerticalSpacer(height: 12.h),

              // About text form field
              KAuthTextFormField(
                hintText: "About",
                suffixIcon: isEditMode
                    ? Icons.edit
                    : Icons.description_outlined,
                maxLines: 4,
              ),

              KVerticalSpacer(height: 12.h),

              // Date of Birth
              KAuthTextFormField(
                hintText: "Date of Birth",
                suffixIcon: isEditMode
                    ? Icons.edit
                    : Icons.calendar_month_outlined,
              ),

              KVerticalSpacer(height: 12.h),

              // Contact Information
              KAuthTextFormField(
                hintText: "Contact Information",
                suffixIcon: Icons.mail_outline,
              ),

              KVerticalSpacer(height: 12.h),

              // Address
              KAuthTextFormField(
                hintText: "Address",
                suffixIcon: isEditMode
                    ? Icons.edit
                    : Icons.location_on_outlined,
              ),

              KVerticalSpacer(height: 30.h),

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

              KVerticalSpacer(height: 12.h),

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
