import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_download_options_bottom_sheet.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_filled_btn.dart';
import 'package:fuoday/features/auth/presentation/widgets/k_auth_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class TotalAttendanceViewScreen extends StatefulWidget {
  const TotalAttendanceViewScreen({super.key});

  @override
  State<TotalAttendanceViewScreen> createState() =>
      _TotalAttendanceViewScreenState();
}

class _TotalAttendanceViewScreenState extends State<TotalAttendanceViewScreen> {
  // Controller
  final TextEditingController monthYearController = TextEditingController();

  @override
  void dispose() {
    monthYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Select Month Year
    Future<void> selectMonthYear(
      BuildContext context,
      TextEditingController controller,
    ) async {
      final DateTime? picked = await showMonthPicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        monthPickerDialogSettings: MonthPickerDialogSettings(),
      );

      if (picked != null) {
        controller.text = "${picked.month}/${picked.year}";
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
        'Day': 'Tuesday',
        'Log on': '09:43 AM',
        'Log off': '06:12 PM',
        'Worked hours': '9h 47m',
        'Status': 'Present',
      },
      {
        'S.No': '2',
        'Date': '2025-07-02',
        'Day': 'Wednesday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '3',
        'Date': '2025-07-03',
        'Day': 'Thursday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '4',
        'Date': '2025-07-04',
        'Day': 'Friday',
        'Log on': '09:19 AM',
        'Log off': '06:54 PM',
        'Worked hours': '8h 44m',
        'Status': 'Present',
      },
      {
        'S.No': '5',
        'Date': '2025-07-05',
        'Day': 'Saturday',
        'Log on': '09:16 AM',
        'Log off': '06:27 PM',
        'Worked hours': '9h 33m',
        'Status': 'Present',
      },
      {
        'S.No': '6',
        'Date': '2025-07-06',
        'Day': 'Sunday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '7',
        'Date': '2025-07-07',
        'Day': 'Monday',
        'Log on': '09:01 AM',
        'Log off': '06:10 PM',
        'Worked hours': '9h 9m',
        'Status': 'Present',
      },
      {
        'S.No': '8',
        'Date': '2025-07-08',
        'Day': 'Tuesday',
        'Log on': '09:10 AM',
        'Log off': '06:45 PM',
        'Worked hours': '9h 35m',
        'Status': 'Present',
      },
      {
        'S.No': '9',
        'Date': '2025-07-09',
        'Day': 'Wednesday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '10',
        'Date': '2025-07-10',
        'Day': 'Thursday',
        'Log on': '09:30 AM',
        'Log off': '06:30 PM',
        'Worked hours': '9h 0m',
        'Status': 'Present',
      },
      {
        'S.No': '11',
        'Date': '2025-07-11',
        'Day': 'Friday',
        'Log on': '09:12 AM',
        'Log off': '06:20 PM',
        'Worked hours': '9h 8m',
        'Status': 'Present',
      },
      {
        'S.No': '12',
        'Date': '2025-07-12',
        'Day': 'Saturday',
        'Log on': '09:15 AM',
        'Log off': '06:45 PM',
        'Worked hours': '9h 30m',
        'Status': 'Present',
      },
      {
        'S.No': '13',
        'Date': '2025-07-13',
        'Day': 'Sunday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '14',
        'Date': '2025-07-14',
        'Day': 'Monday',
        'Log on': '09:20 AM',
        'Log off': '06:10 PM',
        'Worked hours': '8h 50m',
        'Status': 'Present',
      },
      {
        'S.No': '15',
        'Date': '2025-07-15',
        'Day': 'Tuesday',
        'Log on': '09:11 AM',
        'Log off': '06:40 PM',
        'Worked hours': '9h 29m',
        'Status': 'Present',
      },
      {
        'S.No': '16',
        'Date': '2025-07-16',
        'Day': 'Wednesday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '17',
        'Date': '2025-07-17',
        'Day': 'Thursday',
        'Log on': '09:02 AM',
        'Log off': '06:00 PM',
        'Worked hours': '8h 58m',
        'Status': 'Present',
      },
      {
        'S.No': '18',
        'Date': '2025-07-18',
        'Day': 'Friday',
        'Log on': '09:40 AM',
        'Log off': '06:20 PM',
        'Worked hours': '8h 40m',
        'Status': 'Present',
      },
      {
        'S.No': '19',
        'Date': '2025-07-19',
        'Day': 'Saturday',
        'Log on': '09:05 AM',
        'Log off': '06:50 PM',
        'Worked hours': '9h 45m',
        'Status': 'Present',
      },
      {
        'S.No': '20',
        'Date': '2025-07-20',
        'Day': 'Sunday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '21',
        'Date': '2025-07-21',
        'Day': 'Monday',
        'Log on': '09:08 AM',
        'Log off': '06:25 PM',
        'Worked hours': '9h 17m',
        'Status': 'Present',
      },
      {
        'S.No': '22',
        'Date': '2025-07-22',
        'Day': 'Tuesday',
        'Log on': '09:00 AM',
        'Log off': '06:10 PM',
        'Worked hours': '9h 10m',
        'Status': 'Present',
      },
      {
        'S.No': '23',
        'Date': '2025-07-23',
        'Day': 'Wednesday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '24',
        'Date': '2025-07-24',
        'Day': 'Thursday',
        'Log on': '09:13 AM',
        'Log off': '06:33 PM',
        'Worked hours': '9h 20m',
        'Status': 'Present',
      },
      {
        'S.No': '25',
        'Date': '2025-07-25',
        'Day': 'Friday',
        'Log on': '09:10 AM',
        'Log off': '06:00 PM',
        'Worked hours': '8h 50m',
        'Status': 'Present',
      },
      {
        'S.No': '26',
        'Date': '2025-07-26',
        'Day': 'Saturday',
        'Log on': '09:05 AM',
        'Log off': '06:30 PM',
        'Worked hours': '9h 25m',
        'Status': 'Present',
      },
      {
        'S.No': '27',
        'Date': '2025-07-27',
        'Day': 'Sunday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
        'Status': 'Absent',
      },
      {
        'S.No': '28',
        'Date': '2025-07-28',
        'Day': 'Monday',
        'Log on': '09:45 AM',
        'Log off': '06:20 PM',
        'Worked hours': '8h 35m',
        'Status': 'Present',
      },
      {
        'S.No': '29',
        'Date': '2025-07-29',
        'Day': 'Tuesday',
        'Log on': '09:25 AM',
        'Log off': '06:30 PM',
        'Worked hours': '9h 5m',
        'Status': 'Present',
      },
      {
        'S.No': '30',
        'Date': '2025-07-30',
        'Day': 'Wednesday',
        'Log on': '09:30 AM',
        'Log off': '06:10 PM',
        'Worked hours': '8h 40m',
        'Status': 'Present',
      },
    ];

    return Scaffold(
      appBar: KAppBar(
        title: "Total Attendance Details",
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
              // Month & Year TextFormField
              KAuthTextFormField(
                onTap: () {
                  selectMonthYear(context, monthYearController);
                },
                hintText: "Select Month & Year",
                suffixIcon: Icons.calendar_month_outlined,
                keyboardType: TextInputType.text,
                controller: monthYearController,
              ),

              KVerticalSpacer(height: 30.h),

              // Data Table
              SizedBox(
                height: 600.h,
                child: KDataTable(columnTitles: columns, rowData: data),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
