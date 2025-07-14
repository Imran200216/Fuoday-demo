import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_line_chart.dart';

class LeaveReports extends StatelessWidget {
  const LeaveReports({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final columns = ['S.No', 'Date', 'Leave Type', 'Reason', 'Status'];

    final data = [
      {
        'S.No': '1',
        'Date': '2025-07-01',
        'Leave Type': 'Casual Leave',
        'Reason': 'Personal work',
        'Status': 'Approved',
      },
      {
        'S.No': '2',
        'Date': '2025-07-02',
        'Leave Type': 'Sick Leave',
        'Reason': 'Fever and cold',
        'Status': 'Approved',
      },
      {
        'S.No': '3',
        'Date': '2025-07-03',
        'Leave Type': 'Annual Leave',
        'Reason': 'Family vacation',
        'Status': 'Pending',
      },
      {
        'S.No': '4',
        'Date': '2025-07-04',
        'Leave Type': 'Casual Leave',
        'Reason': 'Medical appointment',
        'Status': 'Approved',
      },
      {
        'S.No': '5',
        'Date': '2025-07-07',
        'Leave Type': 'Sick Leave',
        'Reason': 'Migraine',
        'Status': 'Rejected',
      },
      {
        'S.No': '6',
        'Date': '2025-07-08',
        'Leave Type': 'Casual Leave',
        'Reason': 'House shifting',
        'Status': 'Approved',
      },
      {
        'S.No': '7',
        'Date': '2025-07-09',
        'Leave Type': 'Annual Leave',
        'Reason': 'Wedding ceremony',
        'Status': 'Pending',
      },
      {
        'S.No': '8',
        'Date': '2025-07-10',
        'Leave Type': 'Sick Leave',
        'Reason': 'Back pain',
        'Status': 'Approved',
      },
      {
        'S.No': '9',
        'Date': '2025-07-11',
        'Leave Type': 'Casual Leave',
        'Reason': 'Emergency at home',
        'Status': 'Approved',
      },
      {
        'S.No': '10',
        'Date': '2025-07-14',
        'Leave Type': 'Annual Leave',
        'Reason': 'Long weekend trip',
        'Status': 'Pending',
      },
    ];

    final attendanceData = [
      20.0,
      22.0,
      18.0,
      24.0,
      21.0,
      25.0,
      19.0,
      22.5,
      20.0,
      23.0,
      21.0,
      24.0,
    ];
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KText(
            text: "Monthly Leave",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),

          KVerticalSpacer(height: 14.h),

          // Chart
          SizedBox(
            height: 340.h,
            child: AttendanceLineChart(
              attendanceValues: attendanceData,
              months: months,
            ),
          ),

          KVerticalSpacer(height: 20.h),

          // Data Table
          SizedBox(
            height: 400.h,
            child: KDataTable(columnTitles: columns, rowData: data),
          ),
        ],
      ),
    );
  }
}
