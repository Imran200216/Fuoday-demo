import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_checkbox.dart';
import 'package:fuoday/commons/widgets/k_drop_down_text_form_field.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_upload_picker_tile.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/di/injection.dart';
import 'package:fuoday/core/extensions/provider_extension.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/core/utils/file_picker.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';

class PerformanceAuditForm extends StatefulWidget {
  const PerformanceAuditForm({super.key});

  @override
  State<PerformanceAuditForm> createState() => _PerformanceAuditFormState();
}

class _PerformanceAuditFormState extends State<PerformanceAuditForm> {
  // File Picker Service
  final filePickerService = getIt<AppFilePicker>();

  // Controllers
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController employeeDesignationController =
      TextEditingController();
  final TextEditingController employeeDepartmentController =
      TextEditingController();
  final TextEditingController employeeReportingManagerController =
      TextEditingController();
  final TextEditingController employeeDateOfJoinController =
      TextEditingController();
  final TextEditingController employeeAttendanceController =
      TextEditingController();
  final TextEditingController employeeWorkModeController =
      TextEditingController();
  final TextEditingController employeeTechnicalSkillsController =
      TextEditingController();
  final TextEditingController employeeMonthlyTaskHighlightsController =
      TextEditingController();
  final TextEditingController employeePersonalHighlightsController =
      TextEditingController();
  final TextEditingController employeeAreasToImproveController =
      TextEditingController();
  final TextEditingController employeeLearningAndCertificateDoneController =
      TextEditingController();
  final TextEditingController employeeSuggestionsToCompanyController =
      TextEditingController();
  final TextEditingController employeePreviousCycleGoalsController =
      TextEditingController();
  final TextEditingController employeeGoalAchievementsController =
      TextEditingController();
  final TextEditingController employeeProjectWorkedOnController =
      TextEditingController();
  final TextEditingController employeeTaskModuleCompletedController =
      TextEditingController();
  final TextEditingController employeeFinalRemarksController =
      TextEditingController();

  @override
  void dispose() {
    employeeNameController.dispose();
    employeeIdController.dispose();
    employeeDesignationController.dispose();
    employeeDepartmentController.dispose();
    employeeReportingManagerController.dispose();
    employeeDateOfJoinController.dispose();
    employeeAttendanceController.dispose();
    employeeWorkModeController.dispose();
    employeeTechnicalSkillsController.dispose();
    employeeMonthlyTaskHighlightsController.dispose();
    employeePersonalHighlightsController.dispose();
    employeeAreasToImproveController.dispose();
    employeeLearningAndCertificateDoneController.dispose();
    employeeSuggestionsToCompanyController.dispose();
    employeePreviousCycleGoalsController.dispose();
    employeeGoalAchievementsController.dispose();
    employeeProjectWorkedOnController.dispose();
    employeeTaskModuleCompletedController.dispose();
    employeeFinalRemarksController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          KText(
            text: "Individual Overview & Performance Identity",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.primaryColor,
          ),

          KVerticalSpacer(height: 6.h),

          // Employee Name
          KAuthTextFormField(
            hintText: "Employee Name",
            suffixIcon: Icons.person_outline,
            isReadOnly: true,
            label: "Employee Name",
          ),

          // Employee Id
          KAuthTextFormField(
            hintText: "Employee ID",
            suffixIcon: Icons.important_devices,
            isReadOnly: true,
            label: "Employee ID",
          ),

          // Designation
          KAuthTextFormField(
            hintText: "Designation",
            suffixIcon: Icons.important_devices,
            isReadOnly: true,
            label: "Designation",
          ),

          // Department
          KAuthTextFormField(
            hintText: "Department",
            suffixIcon: Icons.location_city,
            isReadOnly: true,
            label: "Department",
          ),

          // Reporting Manger
          KAuthTextFormField(
            hintText: "Reporting Manager",
            suffixIcon: Icons.person_outline,
            isReadOnly: true,
            label: "Reporting Manager",
          ),

          // Date Of Join
          KAuthTextFormField(
            hintText: "Date of Joining",
            suffixIcon: Icons.calendar_month_outlined,
            isReadOnly: true,
            label: "Date of Joining",
          ),

          // Attendance
          KAuthTextFormField(
            hintText: "Attendance",
            suffixIcon: Icons.percent,
            isReadOnly: true,
            label: "Attendance",
          ),

          // Work Mode
          KAuthTextFormField(
            hintText: "Work Mode",
            suffixIcon: Icons.work_history_outlined,
            isReadOnly: true,
            label: "Work Mode",
          ),

          KText(
            text: "Review Period",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Select Category
          KDropdownTextFormField<String>(
            hintText: "Select Review Period",
            value: context.dropDownProviderWatch.getValue('reviewPeriod'),
            items: ['Q1', 'Q2', 'H1', 'Annual'],
            onChanged: (value) {
              context.dropDownProviderRead.setValue('reviewPeriod', value);
            },
          ),

          KText(
            text: "Audit Cycle Type",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Audit Cycle Type
          KDropdownTextFormField<String>(
            hintText: "Select Audit Cycle Type",
            value: context.dropDownProviderWatch.getValue('auditCycleType'),
            items: ['Quarterly', '6 Months', 'One Year'],
            onChanged: (value) =>
                context.dropDownProviderRead.setValue('auditCycleType', value),
          ),

          KVerticalSpacer(height: 20.h),

          // Title
          KText(
            text: "Self Evaluation & Professional Insights",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.primaryColor,
          ),

          KVerticalSpacer(height: 6.h),

          // Rating Bar
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),

          // Work Mode
          KAuthTextFormField(
            hintText: "Technical Skills",
            suffixIcon: Icons.work_history_outlined,
            isReadOnly: true,
            label: "Technical Skills",
          ),

          KVerticalSpacer(height: 20.h),

          // Title
          KText(
            text: "Communication & Collaboration",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.primaryColor,
          ),

          KVerticalSpacer(height: 6.h),

          KText(
            text: "Daily Standup Status",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Daily Standups
          KDropdownTextFormField<String>(
            hintText: "Select Daily Standup Status",
            value: context.dropDownProviderWatch.getValue('dailyStandUpStatus'),
            items: ['Good', 'Poor', 'Excellent'],
            onChanged: (value) => context.dropDownProviderRead.setValue(
              'dailyStandupStatus',
              value,
            ),
          ),

          KText(
            text: "Client Meetings",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Client Meetings
          KDropdownTextFormField<String>(
            hintText: "Select Client Meetings",
            value: context.dropDownProviderWatch.getValue(
              'clientMeetingsStatus',
            ),
            items: ['Good', 'Poor', 'Excellent'],
            onChanged: (value) => context.dropDownProviderRead.setValue(
              'clientMeetingsStatus',
              value,
            ),
          ),

          KText(
            text: "Cross-Functional Involvement",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Tech Support Checkbox
          KCheckbox(
            text: "Tech Support",
            checkboxKey: "isTechSupport",
            onChanged: (value) {},
          ),

          // BD Support Checkbox
          KCheckbox(
            text: "BD Support",
            checkboxKey: "isDBSupport",
            onChanged: (value) {},
          ),

          //monthly task highlights
          KAuthTextFormField(
            hintText: "eg: Closed 3 sprints",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "monthly task highlights",
          ),

          //Personal Highlights
          KAuthTextFormField(
            hintText: "eg: Deployed CI/CD pipeline",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Personal Highlights",
          ),

          //Areas to Improve
          KAuthTextFormField(
            hintText: "eg: Time estimation, spring velocity",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Areas to Improve",
          ),

          KText(
            text: "Initiative Taken",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Process checkbox
          KCheckbox(
            text: "Process Suggestion",
            checkboxKey: "isProcessSuggestion",
            onChanged: (value) {},
          ),

          // Documentations checkbox
          KCheckbox(
            text: "Documentations",
            checkboxKey: "isDocumentations",
            onChanged: (value) {},
          ),

          //Learning/Certifications Done
          KAuthTextFormField(
            hintText: "e.g: AWS DevOps Bootcamp(Udemy)",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Learning/Certifications Done",
          ),

          //Learning/Certifications Done
          KAuthTextFormField(
            hintText: "e.g Need Shared test/stage environment",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Suggestions to Company",
          ),

          // Title
          KText(
            text: "Key Result Areas & Goal Evaluation",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.primaryColor,
          ),

          //Learning/Certifications Done
          KAuthTextFormField(
            hintText: "e.g ResumeHub deployment by 25th May",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Previous Cycle Goals",
          ),

          //monthly task highlights
          KAuthTextFormField(
            hintText: "eg: 80",
            suffixIcon: Icons.task_outlined,
            label: "Goal Achievement %",
          ),

          // Suggestion to company
          KAuthTextFormField(
            hintText: "e.g Need Shared test/stage environment",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Projects Worked On",
          ),

          // Tasks/Module Completed
          KAuthTextFormField(
            hintText: "e.g Resume Hub, API Refactor",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Tasks/Module Completed",
          ),

          // KPI Metrics
          KUploadPickerTile(
            uploadOnTap: () {},
            uploadPickerTitle: "KPI Metrics",
            uploadPickerIcon: Icons.upload,
            description: "Upload your KPI Metrics",
          ),

          // Performance Evidence
          KUploadPickerTile(
            uploadOnTap: () {},
            uploadPickerTitle: "Performance Evidence",
            uploadPickerIcon: Icons.upload,
            description: "Upload your Performance Evidence",
          ),

          KVerticalSpacer(height: 20.h),

          // Title
          KText(
            text: "Final Submission & Records",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.primaryColor,
          ),

          KVerticalSpacer(height: 6.h),

          // Additional Attachments
          KUploadPickerTile(
            uploadOnTap: () async {
              final file = await filePickerService.pickFile();
              if (file != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Picked: ${file.name}')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No file selected')),
                );
              }
            },
            uploadPickerTitle: "Additional Attachments",
            uploadPickerIcon: Icons.upload,
            description: "Upload your Additional Attachments",
          ),

          // Final Remarks (Optional)
          KAuthTextFormField(
            hintText: "Add any other remarks...",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Final Remarks (Optional)",
          ),

          // I confirm the details shared are accurate
          KCheckbox(
            text: "I confirm the details shared are accurate",
            checkboxKey: "isConfirmationDetails",
            onChanged: (value) {},
          ),

          KVerticalSpacer(height: 20.h),

          // Submit
          KAuthFilledBtn(
            backgroundColor: AppColors.primaryColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            height: 24.h,
            width: double.infinity,
            text: "Submit",
            onPressed: () async {},
          ),

          KVerticalSpacer(height: 20.h),
        ],
      ),
    );
  }
}
