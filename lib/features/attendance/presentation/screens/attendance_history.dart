import 'package:flutter/material.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_history_tile.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Attendance Statistics
          AttendanceHistoryTile(
            attendanceTitle: "Average Attendance",
            attendanceCount: "10.71",
          ),

          // Best Month
          AttendanceHistoryTile(
            attendanceTitle: "Best Month",
            attendanceCount: "July",
          ),

          AttendanceHistoryTile(
            attendanceTitle: "Average Check In",
            attendanceCount: "10.00.00",
          ),

          AttendanceHistoryTile(
            attendanceTitle: "Average CheckOut",
            attendanceCount: "10.30.00",
          ),
        ],
      ),
    );
  }
}
