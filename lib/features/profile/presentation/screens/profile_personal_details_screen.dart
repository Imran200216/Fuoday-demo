import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_circular_cache_image.dart';
import 'package:fuoday/commons/widgets/k_image_picker_options_bottom_sheet.dart';
import 'package:fuoday/commons/widgets/k_snack_bar.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/extensions/provider_extension.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/core/utils/date_picker.dart';
import 'package:fuoday/core/utils/image_picker.dart';
import 'package:fuoday/core/utils/image_viewer.dart';
import 'package:fuoday/core/validators/app_validators.dart';
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
  // form key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
        child: Form(
          key: formKey,
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
                        onTap: () {
                          // Image Viewer
                          AppImageViewer.show(
                            context: context,
                            imageUrl:
                                "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2566&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          );
                        },
                        size: 90.h,
                        imageUrl:
                            "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=2566&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),

                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: GestureDetector(
                          onTap: () async {
                            // Image Picker
                            final appImagePicker = AppImagePicker();

                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.r),
                                ),
                              ),
                              builder: (context) {
                                return KImagePickerOptionsBottomSheet(
                                  onCameraTap: () async {
                                    // Image Pick From Camera
                                    await appImagePicker.pickImageFromCamera();
                                  },
                                  onGalleryTap: () async {
                                    // Image Pick From Gallery
                                    await appImagePicker.pickImageFromGallery();
                                  },
                                );
                              },
                            );
                          },
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
                  controller: firstNameController,
                  validator: (value) => AppValidators.validateName(
                    value,
                    emptyMessage: "Enter your first name",
                    minLengthMessage:
                        "Pls Enter a valid name atleast 3 characters",
                  ),
                  hintText: "First Name",
                  suffixIcon: context.profileEditProviderWatch.isEditMode
                      ? Icons.edit
                      : Icons.person_outline,
                ),

                KVerticalSpacer(height: 12.h),

                // Last name text form field
                KAuthTextFormField(
                  controller: lastNameController,
                  validator: (value) => AppValidators.validateName(
                    value,
                    emptyMessage: "Enter your last name",
                    minLengthMessage:
                        "Pls Enter a valid name atleast 2 characters",
                  ),
                  hintText: "Last Name",
                  suffixIcon: context.profileEditProviderWatch.isEditMode
                      ? Icons.edit
                      : Icons.person_outline,
                ),

                KVerticalSpacer(height: 12.h),

                // About text form field
                KAuthTextFormField(
                  controller: aboutController,
                  validator: (value) => AppValidators.validateText(
                    value,
                    emptyMessage: "Enter about which is required",
                  ),
                  hintText: "About",
                  suffixIcon: context.profileEditProviderWatch.isEditMode
                      ? Icons.edit
                      : Icons.description_outlined,
                  maxLines: 4,
                ),

                KVerticalSpacer(height: 12.h),

                // Date of Birth
                KAuthTextFormField(
                  controller: dobController,
                  isReadOnly: true,
                  validator: (value) => AppValidators.validateFullDOB(
                    value,
                    invalidMessage: "Please select your date of birth",
                  ),
                  onTap: () {
                    selectDatePicker(context, dobController);
                  },
                  hintText: "Date of Birth",
                  suffixIcon: context.profileEditProviderWatch.isEditMode
                      ? Icons.edit
                      : Icons.calendar_month_outlined,
                ),

                KVerticalSpacer(height: 12.h),

                // Contact Information
                KAuthTextFormField(
                  controller: contactController,
                  validator: (value) => AppValidators.validateEmail(
                    value,
                    emptyMessage: "Enter your email, It is required",
                    invalidMessage: "Enter a valid email",
                  ),
                  hintText: "Contact Information",
                  suffixIcon: Icons.mail_outline,
                ),

                KVerticalSpacer(height: 12.h),

                // Address
                KAuthTextFormField(
                  controller: addressController,
                  validator: (value) => AppValidators.validateText(
                    value,
                    emptyMessage: "Enter your address, It is required",
                  ),
                  hintText: "Address",
                  suffixIcon: context.profileEditProviderWatch.isEditMode
                      ? Icons.edit
                      : Icons.location_on_outlined,
                ),

                KVerticalSpacer(height: 30.h),

                // Cancel Btn
                context.profileEditProviderWatch.isEditMode
                    ? KAuthFilledBtn(
                        backgroundColor: AppColors.primaryColor.withOpacity(
                          0.4,
                        ),
                        fontSize: 10.sp,
                        text: "Cancel",
                        onPressed: () {
                          context.profileEditProviderRead.cancelEdit();
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
                  text: context.profileEditProviderWatch.isEditMode
                      ? "Submit"
                      : "Edit",
                  onPressed: () {
                    if (context.profileEditProviderRead.isEditMode) {
                      if (formKey.currentState!.validate()) {
                        AppLoggerHelper.logInfo("Form is Valid");

                        KSnackBar.success(context, "Form is Valid");
                      } else {
                        AppLoggerHelper.logError("Form is InValid");

                        KSnackBar.failure(context, "Form is Invalid");
                      }
                    } else {
                      context.profileEditProviderRead.toggleEditMode();
                    }
                  },
                  height: 22.h,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
