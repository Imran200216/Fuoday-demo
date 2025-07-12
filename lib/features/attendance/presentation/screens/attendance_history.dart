import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_history_tile.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_line_chart.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
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
          // Chart
          SizedBox(
            height: 340.h,
            child: AttendanceLineChart(
              attendanceValues: attendanceData,
              months: months,
            ),
          ),

          KVerticalSpacer(height: 20.h),

          // Attendance Tiles
          AttendanceHistoryTile(
            attendanceTitle: "Average Attendance",
            attendanceCount: "10.71",
          ),
          AttendanceHistoryTile(
            attendanceTitle: "Best Month",
            attendanceCount: "July",
          ),
          AttendanceHistoryTile(
            attendanceTitle: "Average Check In",
            attendanceCount: "10:00 AM",
          ),
          AttendanceHistoryTile(
            attendanceTitle: "Average Check Out",
            attendanceCount: "06:30 PM",
          ),
          SizedBox(height: 20.h),

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
