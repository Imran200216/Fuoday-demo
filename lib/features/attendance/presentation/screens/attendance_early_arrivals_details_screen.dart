import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_download_options_bottom_sheet.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_message_content.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_punctual_arrival_card.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

class AttendanceEarlyArrivalsDetailsScreen extends StatefulWidget {
  const AttendanceEarlyArrivalsDetailsScreen({super.key});

  @override
  State<AttendanceEarlyArrivalsDetailsScreen> createState() =>
      _AttendanceEarlyArrivalsDetailsScreenState();
}

class _AttendanceEarlyArrivalsDetailsScreenState
    extends State<AttendanceEarlyArrivalsDetailsScreen> {
  // Controllers
  final TextEditingController searchController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Your card data list
    final List<Map<String, String>> punctualData = [
      {'count': '22', 'label': 'Total Early Days'},
      {'count': '20', 'label': 'Total Early Time'},
      {'count': '100', 'label': 'Average Early Time'},
      {'count': '100%', 'label': 'Early Percentage'},
    ];

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

    // Dummy Data
    final columns = [
      'S.No',
      'Date',
      'Day',
      'Log on',
      'Log off',
      'Worked hours',
      'Status',
    ];

    final data = [
      {
        'S.No': '1',
        'Date': '2025-07-01',
        'Day': 'Monday',
        'Log on': '09:00 AM',
        'Log off': '06:00 PM',
        'Worked hours': '9h',
        'Status': 'Present',
      },
      {
        'S.No': '2',
        'Date': '2025-07-02',
        'Day': 'Tuesday',
        'Log on': '09:15 AM',
        'Log off': '06:10 PM',
        'Worked hours': '8h 55m',
        'Status': 'Present',
      },
      {
        'S.No': '3',
        'Date': '2025-07-03',
        'Day': 'Wednesday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
    ];

    return Scaffold(
      appBar: KAppBar(
        title: "Early Arrival Details",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      bottomSheet: Container(
        height: 60.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Center(
          child: KAuthFilledBtn(
            backgroundColor: AppColors.primaryColor,
            height: 24.h,
            width: double.infinity,
            text: "Download",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                builder: (context) {
                  return KDownloadOptionsBottomSheet(
                    onPdfTap: () {
                      Navigator.pop(context);
                      // Implement PDF download logic here
                    },
                    onExcelTap: () {
                      Navigator.pop(context);
                      // Implement Excel download logic here
                    },
                  );
                },
              );
            },
            fontSize: 11.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // use parent scroll
                itemCount: punctualData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards per row
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 1.2, // adjust for card height/width
                ),
                itemBuilder: (context, index) {
                  final item = punctualData[index];
                  return AttendancePunctualArrivalCard(
                    punctualCountOrPercentageText: item['count']!,
                    punctualCountOrPercentageDescriptionText: item['label']!,
                  );
                },
              ),

              KVerticalSpacer(height: 10.h),

              // Filter & Search Options
              KText(
                text: "Filter & Search Options",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),

              KVerticalSpacer(height: 12.h),

              // Search Text Form Field
              KAuthTextFormField(
                hintText: "Search by data",
                keyboardType: TextInputType.text,
                suffixIcon: Icons.search,
              ),

              KVerticalSpacer(height: 12.h),

              // Start End Date TextFormField
              Row(
                spacing: 20.w,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Start Date
                  Expanded(
                    child: KAuthTextFormField(
                      onTap: () {
                        selectDate(context, startDateController);
                      },
                      controller: startDateController,
                      hintText: "Start Date",
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icons.date_range,
                    ),
                  ),

                  // End Date
                  Expanded(
                    child: KAuthTextFormField(
                      onTap: () async {
                        selectDate(context, endDateController);
                      },
                      controller: endDateController,
                      hintText: "End Date",
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icons.date_range,
                    ),
                  ),
                ],
              ),

              KVerticalSpacer(height: 40.h),

              // Table
              SizedBox(
                height: 200.h,
                child: KDataTable(columnTitles: columns, rowData: data),
              ),

              // Message Content
              AttendanceMessageContent(
                messageContentTitle: "Performance: High",
                messageContentSubTitle:
                    "You arrive mostly on time, consider arriving a few minutes early to be better prepared",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
