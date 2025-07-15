import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';

class PayslipOverview extends StatefulWidget {
  const PayslipOverview({super.key});

  @override
  State<PayslipOverview> createState() => _PayslipOverviewState();
}

class _PayslipOverviewState extends State<PayslipOverview> {
  // controllers
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController employeeDesignationController =
      TextEditingController();
  final TextEditingController employeeDateOfJoiningController =
      TextEditingController();
  final TextEditingController employeePayPeriodController =
      TextEditingController();
  final TextEditingController employeePayDateController =
      TextEditingController();
  final TextEditingController employeePFACNUmberController =
      TextEditingController();
  final TextEditingController employeeUANController = TextEditingController();
  final TextEditingController employeeESINUmberController =
      TextEditingController();

  @override
  void dispose() {
    employeeNameController.dispose();
    employeeIdController.dispose();
    employeeDesignationController.dispose();
    employeeDateOfJoiningController.dispose();
    employeePayPeriodController.dispose();
    employeePayDateController.dispose();
    employeePFACNUmberController.dispose();
    employeeUANController.dispose();
    employeeESINUmberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final columns = [
      'S.No',
      'Months',
      'Basic',
      'HRA',
      'Medical Allowance',
      'Other Allowance',
    ];

    final data = [
      {
        'S.No': '1',
        'Months': 'July 2025',
        'Basic': '₹25,000',
        'HRA': '₹10,000',
        'Medical Allowance': '₹1,500',
        'Other Allowance': '₹2,000',
      },
      {
        'S.No': '2',
        'Months': 'June 2025',
        'Basic': '₹25,000',
        'HRA': '₹10,000',
        'Medical Allowance': '₹1,500',
        'Other Allowance': '₹1,800',
      },
      {
        'S.No': '3',
        'Months': 'May 2025',
        'Basic': '₹24,500',
        'HRA': '₹9,800',
        'Medical Allowance': '₹1,200',
        'Other Allowance': '₹1,500',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KVerticalSpacer(height: 20),

          // Employee Name
          KAuthTextFormField(
            label: "Employee Name",
            hintText: "Employee Name",
            isReadOnly: true,
            suffixIcon: Icons.person_outline,
          ),

          // Employee ID
          KAuthTextFormField(
            label: "Employee ID",
            hintText: "Employee ID",
            isReadOnly: true,
            suffixIcon: Icons.important_devices,
          ),

          // Designation
          KAuthTextFormField(
            label: "Designation",
            hintText: "Designation",
            isReadOnly: true,
            suffixIcon: Icons.school_outlined,
          ),

          // Date of Joining
          KAuthTextFormField(
            label: "Date of joining",
            hintText: "Date of joining",
            isReadOnly: true,
            suffixIcon: Icons.calendar_month_outlined,
          ),

          // Pay Period
          KAuthTextFormField(
            label: "Pay Period",
            hintText: "Pay Period",
            isReadOnly: true,
            suffixIcon: Icons.calendar_month_outlined,
          ),

          // Pay Date
          KAuthTextFormField(
            label: "Pay Date",
            hintText: "Pay Date",
            isReadOnly: true,
            suffixIcon: Icons.calendar_month_outlined,
          ),

          //  PF A/C Number
          KAuthTextFormField(
            label: "PF A/c NUmber",
            hintText: "PF A/c NUmber",
            isReadOnly: true,
            suffixIcon: Icons.calendar_month_outlined,
          ),

          //  UAN  Number
          KAuthTextFormField(
            label: "UAN NUmber",
            hintText: "UAN NUmber",
            isReadOnly: true,
            suffixIcon: Icons.payment,
          ),

          //  ESI Number
          KAuthTextFormField(
            label: "ESI NUmber",
            hintText: "ESI NUmber",
            isReadOnly: true,
            suffixIcon: Icons.payment,
          ),

          KVerticalSpacer(height: 20.h),

          KText(text: "Earnings", fontWeight: FontWeight.w600, fontSize: 14.sp),

          // Table
          SizedBox(
            height: 200.h,
            child: KDataTable(columnTitles: columns, rowData: data),
          ),

          KText(
            text: "Deduction",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),

          // Table
          SizedBox(
            height: 200.h,
            child: KDataTable(columnTitles: columns, rowData: data),
          ),

          KText(
            text: "Total Payable for May 2025",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),

          // Table
          SizedBox(
            height: 200.h,
            child: KDataTable(columnTitles: columns, rowData: data),
          ),

          KVerticalSpacer(height: 60.h),
        ],
      ),
    );
  }
}
