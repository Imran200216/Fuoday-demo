import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/commons/widgets/k_drop_down_text_form_field.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:provider/provider.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({super.key});

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  // Controllers
  final TextEditingController empIdController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  void dispose() {
    empIdController.dispose();
    departmentController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Select Date
    Future<void> selectDate(
      BuildContext context,
      TextEditingController controller,
    ) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        initialDatePickerMode: DatePickerMode.day,
        helpText: 'Select Date',
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.primaryColor,
                onPrimary: AppColors.secondaryColor,
                onSurface: AppColors.titleColor,
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Emp Id text form field
          KAuthTextFormField(
            hintText: "Enter Employee ID",
            controller: empIdController,
            suffixIcon: Icons.important_devices,
            keyboardType: TextInputType.text,
          ),

          // Department text form field
          KAuthTextFormField(
            hintText: "Enter Department",
            suffixIcon: Icons.location_city,
            controller: departmentController,
            keyboardType: TextInputType.text,
          ),

          // Type Drop Down TextForm Field
          Consumer<DropdownProvider>(
            builder: (context, dropDownProvider, child) {
              return KDropdownTextFormField<String>(
                hintText: "Select Type",
                value: dropDownProvider.getValue('leaveType'),
                items: ['Sick Leave', 'Periods Leave', 'Casual Leave'],
                onChanged: (value) =>
                    dropDownProvider.setValue('leaveType', value),
              );
            },
          ),

          // Start Date TextFormField
          KAuthTextFormField(
            onTap: () {
              selectDate(context, startDateController);
            },
            hintText: "Enter start date",
            suffixIcon: Icons.calendar_month_outlined,
            controller: startDateController,
            keyboardType: TextInputType.datetime,
          ),

          // End Date TextFormField
          KAuthTextFormField(
            hintText: "Enter end date",
            onTap: () {
              selectDate(context, endDateController);
            },
            suffixIcon: Icons.calendar_month_outlined,
            controller: endDateController,
            keyboardType: TextInputType.datetime,
          ),

          // Reason TextFormField
          KAuthTextFormField(
            hintText: "Enter reason",
            suffixIcon: Icons.description,
            controller: reasonController,
            keyboardType: TextInputType.text,
            maxLines: 4,
          ),

          KVerticalSpacer(height: 20.h),

          // Request Btn
          KAuthFilledBtn(
            height: 26.h,
            fontSize: 10.sp,
            width: double.infinity,
            text: "Request",
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
