import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/commons/widgets/k_drop_down_text_form_field.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:provider/provider.dart';

import '../widgets/performance_checkbox.dart';

class PerformanceAuditForm extends StatefulWidget {
  const PerformanceAuditForm({super.key});

  @override
  State<PerformanceAuditForm> createState() => _PerformanceAuditFormState();
}

class _PerformanceAuditFormState extends State<PerformanceAuditForm> {

  bool isTechSupportChecked = false;
  bool isBDSupportChecked = false;

  bool isProcessSuggestionChecked = false;
  bool isDocumentationsChecked = false;

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
          Consumer<DropdownProvider>(
            builder: (context, dropDownProvider, child) {
              return KDropdownTextFormField<String>(
                hintText: "Select Review Period",
                value: dropDownProvider.getValue('reviewPeriod'),
                items: ['Q1', 'Q2', 'H1', 'Annual'],
                onChanged: (value) =>
                    dropDownProvider.setValue('reviewPeriod', value),
              );
            },
          ),

          KText(
            text: "Audit Cycle Type",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Audit Cycle Type
          Consumer<DropdownProvider>(
            builder: (context, dropDownProvider, child) {
              return KDropdownTextFormField<String>(
                hintText: "Select Audit Cycle Type",
                value: dropDownProvider.getValue('auditCycleType'),
                items: ['Quarterly', '6 Months', 'One Year'],
                onChanged: (value) =>
                    dropDownProvider.setValue('auditCycleType', value),
              );
            },
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
          Consumer<DropdownProvider>(
            builder: (context, dropDownProvider, child) {
              return KDropdownTextFormField<String>(
                hintText: "Select Daily Standup Status",
                value: dropDownProvider.getValue('dailyStandUpStatus'),
                items: ['Good', 'Poor', 'Excellent'],
                onChanged: (value) =>
                    dropDownProvider.setValue('dailyStandupStatus', value),
              );
            },
          ),

          KText(
            text: "Client Meetings",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Client Meetings
          Consumer<DropdownProvider>(
            builder: (context, dropDownProvider, child) {
              return KDropdownTextFormField<String>(
                hintText: "Select Client Meetings",
                value: dropDownProvider.getValue('clientMeetingsStatus'),
                items: ['Good', 'Poor', 'Excellent'],
                onChanged: (value) =>
                    dropDownProvider.setValue('clientMeetingsStatus', value),
              );
            },
          ),

          KText(
            text: "Cross-Functional Involvement",
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),

          // Tech Support Checkbox
          KCheckbox(
            text: "Tech Support",
            value: isTechSupportChecked,
            onChanged: (bool? value) {
              setState(() {
                isTechSupportChecked = value ?? false;
              });
            },
          ),

          // BD Support Checkbox
          KCheckbox(
            text: "BD Support",
            value: isBDSupportChecked,
            onChanged: (bool? value) {
              setState(() {
                isBDSupportChecked = value ?? false;
              });
            },
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
            value: isBDSupportChecked,
            onChanged: (bool? value) {
              setState(() {
                isBDSupportChecked = value ?? false;
              });
            },
          ),

          // Documentations checkbox
          KCheckbox(
            text: "Documentations",
            value: isBDSupportChecked,
            onChanged: (bool? value) {
              setState(() {
                isBDSupportChecked = value ?? false;
              });
            },
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

          //Learning/Certifications Done
          KAuthTextFormField(
            hintText: "e.g HR Chatbot, ATS Analyzer",
            suffixIcon: Icons.task_outlined,
            maxLines: 4,
            label: "Projects Worked On",
          ),
        ],
      ),
    );
  }
}
