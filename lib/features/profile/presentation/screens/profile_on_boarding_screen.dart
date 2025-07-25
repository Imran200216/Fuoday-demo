import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_alert_dialog_box.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_snack_bar.dart';
import 'package:fuoday/commons/widgets/k_upload_picker_tile.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/constants/app_route_constants.dart';
import 'package:fuoday/core/extensions/provider_extension.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/core/models/file_preview_data.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/core/utils/date_picker.dart';
import 'package:fuoday/core/validators/app_validators.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfileOnBoardingScreen extends StatefulWidget {
  const ProfileOnBoardingScreen({super.key});

  @override
  State<ProfileOnBoardingScreen> createState() =>
      _ProfileOnBoardingScreenState();
}

class _ProfileOnBoardingScreenState extends State<ProfileOnBoardingScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController welcomeEmailDateController =
      TextEditingController();
  final TextEditingController onBoardingDateController =
      TextEditingController();

  @override
  void dispose() {
    welcomeEmailDateController.dispose();
    onBoardingDateController.dispose();
    super.dispose();
  }

  // Are All File Picked Functionality
  bool _areAllFilesPicked() {
    final filePicker = context.filePickerProviderRead;

    final requiredKeys = [
      "Photo",
      "PAN",
      "bankPassBook",
      "paySlip",
      "offerLetter",
    ];

    for (final key in requiredKeys) {
      if (!filePicker.isPicked(key)) return false;
    }

    return true;
  }

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
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              spacing: 14.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Email Date
                KAuthTextFormField(
                  controller: welcomeEmailDateController,
                  isReadOnly: true,
                  validator: (value) => AppValidators.validateFullDOB(value),
                  onTap: () =>
                      selectDatePicker(context, welcomeEmailDateController),
                  hintText: "Enter Welcome Email Date",
                  label: "Welcome Email Date",
                  suffixIcon: Icons.calendar_month_outlined,
                ),

                // On Boarding Date
                KAuthTextFormField(
                  controller: onBoardingDateController,
                  isReadOnly: true,
                  onTap: () =>
                      selectDatePicker(context, onBoardingDateController),
                  validator: (value) => AppValidators.validateFullDOB(value),
                  hintText: "Enter OnBoarding Date",
                  label: "OnBoarding Date",
                  suffixIcon: Icons.calendar_month_outlined,
                ),

                // Photo
                KUploadPickerTile(
                  showOnlyView: context.filePickerProviderWatch.isPicked(
                    'photo',
                  ),
                  onViewTap: () {
                    final pickedFile = context.filePickerProviderRead.getFile(
                      "photo",
                    );
                    if (pickedFile == null) return;

                    final filePath = pickedFile.path;
                    final fileName = pickedFile.name.toLowerCase();

                    if (fileName.endsWith('.pdf')) {
                      // Pdf Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.pdfPreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else if (fileName.endsWith('.png') ||
                        fileName.endsWith('.jpg') ||
                        fileName.endsWith('.jpeg') ||
                        fileName.endsWith('.webp')) {
                      // Image Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.imagePreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else {
                      KSnackBar.failure(context, "Unsupported file type");
                    }
                  },
                  showCancel: context.filePickerProviderWatch.isPicked("photo"),
                  onCancelTap: () {
                    context.filePickerProviderRead.removeFile("photo");
                    KSnackBar.success(context, "File removed successfully");
                  },
                  uploadOnTap: () async {
                    final key = "photo";
                    final filePicker = context.filePickerProviderRead;
                    await filePicker.pickFile(key);

                    final pickedFile = filePicker.getFile(key);
                    if (filePicker.isPicked(key)) {
                      AppLoggerHelper.logInfo(
                        'Picked file: ${pickedFile!.name}',
                      );
                      KSnackBar.success(
                        context,
                        'Picked file: ${pickedFile.name}',
                      );
                    } else {
                      AppLoggerHelper.logError('No file selected.');
                      KSnackBar.failure(context, 'No file selected.');
                    }
                  },
                  uploadPickerTitle: "photo",
                  uploadPickerIcon:
                      context.filePickerProviderWatch.isPicked("photo")
                      ? Icons.check_circle
                      : Icons.upload,
                  description:
                      context.filePickerProviderWatch.getFile("photo") != null
                      ? "Selected File: ${context.filePickerProviderWatch.getFile("photo")!.name}"
                      : "Choose a file to upload",
                ),

                // PAN
                KUploadPickerTile(
                  showOnlyView: context.filePickerProviderWatch.isPicked('PAN'),
                  onViewTap: () {
                    final pickedFile = context.filePickerProviderRead.getFile(
                      "PAN",
                    );
                    if (pickedFile == null) return;

                    final filePath = pickedFile.path;
                    final fileName = pickedFile.name.toLowerCase();

                    if (fileName.endsWith('.pdf')) {
                      // Pdf Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.pdfPreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else if (fileName.endsWith('.png') ||
                        fileName.endsWith('.jpg') ||
                        fileName.endsWith('.jpeg') ||
                        fileName.endsWith('.webp')) {
                      // Image Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.imagePreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else {
                      KSnackBar.failure(context, "Unsupported file type");
                    }
                  },
                  showCancel: context.filePickerProviderWatch.isPicked("PAN"),
                  onCancelTap: () {
                    context.filePickerProviderRead.removeFile("PAN");
                    KSnackBar.success(context, "File removed successfully");
                  },
                  uploadOnTap: () async {
                    final key = "PAN";
                    final filePicker = context.filePickerProviderRead;
                    await filePicker.pickFile(key);

                    final pickedFile = filePicker.getFile(key);
                    if (filePicker.isPicked(key)) {
                      AppLoggerHelper.logInfo(
                        'Picked file: ${pickedFile!.name}',
                      );
                      KSnackBar.success(
                        context,
                        'Picked file: ${pickedFile.name}',
                      );
                    } else {
                      AppLoggerHelper.logError('No file selected.');
                      KSnackBar.failure(context, 'No file selected.');
                    }
                  },
                  uploadPickerTitle: "PAN",
                  uploadPickerIcon:
                      context.filePickerProviderWatch.isPicked("PAN")
                      ? Icons.check_circle
                      : Icons.upload,
                  description:
                      context.filePickerProviderWatch.getFile("PAN") != null
                      ? "Selected File: ${context.filePickerProviderWatch.getFile("PAN")!.name}"
                      : "Choose a file to upload",
                ),

                // Bank Passbook
                KUploadPickerTile(
                  showOnlyView: context.filePickerProviderWatch.isPicked(
                    "bankPassBook",
                  ),
                  onViewTap: () {
                    final pickedFile = context.filePickerProviderRead.getFile(
                      "bankPassBook",
                    );
                    if (pickedFile == null) return;

                    final filePath = pickedFile.path;
                    final fileName = pickedFile.name.toLowerCase();

                    if (fileName.endsWith('.pdf')) {
                      // Pdf Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.pdfPreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else if (fileName.endsWith('.png') ||
                        fileName.endsWith('.jpg') ||
                        fileName.endsWith('.jpeg') ||
                        fileName.endsWith('.webp')) {
                      // Image Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.imagePreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else {
                      KSnackBar.failure(context, "Unsupported file type");
                    }
                  },

                  showCancel: context.filePickerProviderWatch.isPicked(
                    "bankPassBook",
                  ),
                  onCancelTap: () {
                    context.filePickerProviderRead.removeFile("bankPassBook");
                    KSnackBar.success(context, "File removed successfully");
                  },
                  uploadOnTap: () async {
                    final key = "bankPassBook";
                    final filePicker = context.filePickerProviderRead;
                    await filePicker.pickFile(key);

                    final pickedFile = filePicker.getFile(key);
                    if (filePicker.isPicked(key)) {
                      AppLoggerHelper.logInfo(
                        'Picked file: ${pickedFile!.name}',
                      );
                      KSnackBar.success(
                        context,
                        'Picked file: ${pickedFile.name}',
                      );
                    } else {
                      AppLoggerHelper.logError('No file selected.');
                      KSnackBar.failure(context, 'No file selected.');
                    }
                  },
                  uploadPickerTitle: "bankPassBook",
                  uploadPickerIcon:
                      context.filePickerProviderWatch.isPicked("bankPassBook")
                      ? Icons.check_circle
                      : Icons.upload,
                  description:
                      context.filePickerProviderWatch.getFile("bankPassBook") !=
                          null
                      ? "Selected File: ${context.filePickerProviderWatch.getFile("bankPassBook")!.name}"
                      : "Choose a file to upload",
                ),

                // Pay Slip
                KUploadPickerTile(
                  showOnlyView: context.filePickerProviderWatch.isPicked(
                    "paySlip",
                  ),
                  onViewTap: () {
                    final pickedFile = context.filePickerProviderRead.getFile(
                      "paySlip",
                    );
                    if (pickedFile == null) return;

                    final filePath = pickedFile.path;
                    final fileName = pickedFile.name.toLowerCase();

                    if (fileName.endsWith('.pdf')) {
                      // Pdf Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.pdfPreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else if (fileName.endsWith('.png') ||
                        fileName.endsWith('.jpg') ||
                        fileName.endsWith('.jpeg') ||
                        fileName.endsWith('.webp')) {
                      // Image Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.imagePreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else {
                      KSnackBar.failure(context, "Unsupported file type");
                    }
                  },

                  showCancel: context.filePickerProviderWatch.isPicked(
                    "paySlip",
                  ),
                  onCancelTap: () {
                    context.filePickerProviderRead.removeFile("paySlip");
                    KSnackBar.success(context, "File removed successfully");
                  },
                  uploadOnTap: () async {
                    final key = "paySlip";
                    final filePicker = context.filePickerProviderRead;
                    await filePicker.pickFile(key);

                    final pickedFile = filePicker.getFile(key);
                    if (filePicker.isPicked(key)) {
                      AppLoggerHelper.logInfo(
                        'Picked file: ${pickedFile!.name}',
                      );
                      KSnackBar.success(
                        context,
                        'Picked file: ${pickedFile.name}',
                      );
                    } else {
                      AppLoggerHelper.logError('No file selected.');
                      KSnackBar.failure(context, 'No file selected.');
                    }
                  },
                  uploadPickerTitle: "Pay Slip",
                  uploadPickerIcon:
                      context.filePickerProviderWatch.isPicked("paySlip")
                      ? Icons.check_circle
                      : Icons.upload,
                  description:
                      context.filePickerProviderWatch.getFile("paySlip") != null
                      ? "Selected File: ${context.filePickerProviderWatch.getFile("paySlip")!.name}"
                      : "Choose a file to upload",
                ),

                // Offer Letter
                KUploadPickerTile(
                  showOnlyView: context.filePickerProviderWatch.isPicked(
                    "offerLetter",
                  ),
                  onViewTap: () {
                    final pickedFile = context.filePickerProviderRead.getFile(
                      "offerLetter",
                    );
                    if (pickedFile == null) return;

                    final filePath = pickedFile.path;
                    final fileName = pickedFile.name.toLowerCase();

                    if (fileName.endsWith('.pdf')) {
                      // Pdf Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.pdfPreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else if (fileName.endsWith('.png') ||
                        fileName.endsWith('.jpg') ||
                        fileName.endsWith('.jpeg') ||
                        fileName.endsWith('.webp')) {
                      // Image Preview Screen
                      GoRouter.of(context).pushNamed(
                        AppRouteConstants.imagePreview,
                        extra: FilePreviewData(
                          filePath: filePath!,
                          fileName: fileName,
                        ),
                      );
                    } else {
                      KSnackBar.failure(context, "Unsupported file type");
                    }
                  },

                  showCancel: context.filePickerProviderWatch.isPicked(
                    "offerLetter",
                  ),
                  onCancelTap: () {
                    context.filePickerProviderRead.removeFile("offerLetter");
                    KSnackBar.success(context, "File removed successfully");
                  },
                  uploadOnTap: () async {
                    final key = "offerLetter";
                    final filePicker = context.filePickerProviderRead;
                    await filePicker.pickFile(key);

                    final pickedFile = filePicker.getFile(key);
                    if (filePicker.isPicked(key)) {
                      AppLoggerHelper.logInfo(
                        'Picked file: ${pickedFile!.name}',
                      );
                      KSnackBar.success(
                        context,
                        'Picked file: ${pickedFile.name}',
                      );
                    } else {
                      AppLoggerHelper.logError('No file selected.');
                      KSnackBar.failure(context, 'No file selected.');
                    }
                  },
                  uploadPickerTitle: "Offer Letter",
                  uploadPickerIcon:
                      context.filePickerProviderWatch.isPicked("offerLetter")
                      ? Icons.check_circle
                      : Icons.upload,
                  description:
                      context.filePickerProviderWatch.getFile("offerLetter") !=
                          null
                      ? "Selected File: ${context.filePickerProviderWatch.getFile("offerLetter")!.name}"
                      : "Choose a file to upload",
                ),

                KVerticalSpacer(height: 20.h),

                // Cancel Btn
                KAuthFilledBtn(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                  fontSize: 10.sp,
                  text: "Cancel",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => KAlertDialogBox(
                        title: "Cancel Files",
                        subtitle: "Would you like to clear files and text?",
                        closeButtonText: "Clear",
                        onClose: () {
                          // Controllers
                          welcomeEmailDateController.clear();
                          onBoardingDateController.clear();

                          // Cancel All Files
                          context.filePickerProviderRead.removeFile("photo");
                          context.filePickerProviderRead.removeFile("PAN");
                          context.filePickerProviderRead.removeFile(
                            "bankPassBook",
                          );
                          context.filePickerProviderRead.removeFile("paySlip");
                          context.filePickerProviderRead.removeFile(
                            "offerLetter",
                          );

                          // Pop
                          GoRouter.of(context).pop();
                        },
                      ),
                    );
                  },
                  height: 22.h,
                  width: double.infinity,
                ),

                // Submit Btn
                KAuthFilledBtn(
                  backgroundColor: AppColors.primaryColor,
                  fontSize: 10.sp,
                  text: "Submit",
                  onPressed: () {
                    final isFormValid =
                        _formKey.currentState?.validate() ?? false;
                    final areFilesPicked = _areAllFilesPicked();

                    if (isFormValid && areFilesPicked) {
                      AppLoggerHelper.logInfo(
                        "All validations passed! Submitting...",
                      );

                      // Proceed with submission
                      KSnackBar.success(
                        context,
                        "All validations passed! Submitting...",
                      );
                      // Submit your data to Firestore or backend
                    } else {
                      if (!isFormValid) {
                        AppLoggerHelper.logError('Form fields are invalid.');
                        KSnackBar.failure(
                          context,
                          "Please fill all valid form fields.",
                        );
                      }
                      if (!areFilesPicked) {
                        AppLoggerHelper.logError(
                          'One or more required files are missing.',
                        );
                        KSnackBar.failure(
                          context,
                          "Please upload all required documents.",
                        );
                      }
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
