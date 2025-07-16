import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_upload_picker_tile.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfileOnBoardingScreen extends StatelessWidget {
  const ProfileOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "On Boarding",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            spacing: 14.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Email Date
              KAuthTextFormField(
                hintText: "Enter Welcome Email Date",
                label: "Welcome Email Date",
                suffixIcon: Icons.calendar_month_outlined,
              ),

              // On Boarding Date
              KAuthTextFormField(
                hintText: "Enter OnBoarding Date",
                label: "OnBoarding Date",
                suffixIcon: Icons.calendar_month_outlined,
              ),

              // Photo
              KUploadPickerTile(
                uploadOnTap: () {},
                uploadPickerTitle: "Photo",
                uploadPickerIcon: Icons.upload,
                description: "Choose a file to upload",
              ),

              // PAN
              KUploadPickerTile(
                uploadOnTap: () {},
                uploadPickerTitle: "PAN",
                uploadPickerIcon: Icons.upload,
                description: "Choose a file to upload",
              ),

              // Bank Passbook
              KUploadPickerTile(
                uploadOnTap: () {},
                uploadPickerTitle: "Bank Passbook",
                uploadPickerIcon: Icons.upload,
                description: "Choose a file to upload",
              ),

              // Pay Slip
              KUploadPickerTile(
                uploadOnTap: () {},
                uploadPickerTitle: "Pay Slip",
                uploadPickerIcon: Icons.upload,
                description: "Choose a file to upload",
              ),

              // Offer Letter
              KUploadPickerTile(
                uploadOnTap: () {},
                uploadPickerTitle: "Offer Letter",
                uploadPickerIcon: Icons.upload,
                description: "Choose a file to upload",
              ),

              KVerticalSpacer(height: 20.h),

              // Cancel Btn
              KAuthFilledBtn(
                backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                fontSize: 10.sp,
                text: "Cancel",
                onPressed: () {},
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
    );
  }
}
