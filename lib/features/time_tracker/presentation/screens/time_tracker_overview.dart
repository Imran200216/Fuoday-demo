import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_horizontal_spacer.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/time_tracker/presentation/widgets/time_tracker_overview_card.dart';

class TimeTrackerOverview extends StatelessWidget {
  const TimeTrackerOverview({super.key});

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
    ];

    final data = [
      {
        'S.No': '1',
        'Date': '2025-07-01',
        'Day': 'Monday',
        'Log on': '09:00 AM',
        'Log off': '06:00 PM',
        'Worked hours': '9h',
      },
      {
        'S.No': '2',
        'Date': '2025-07-02',
        'Day': 'Tuesday',
        'Log on': '09:15 AM',
        'Log off': '06:10 PM',
        'Worked hours': '8h 55m',
      },
      {
        'S.No': '3',
        'Date': '2025-07-03',
        'Day': 'Wednesday',
        'Log on': 'Absent',
        'Log off': '-',
        'Worked hours': '0h',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Card
          SizedBox(
            height: 0.2.sh,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TimeTrackerOverviewCard(
                  iconData: Icons.lock_clock,
                  timeTrackerOverviewCardTitle: "Weekly Working Hours",
                  timeTrackerOverviewCardWorkingHours: "48 Hours",
                );
              },
              separatorBuilder: (context, index) {
                return KHorizontalSpacer(width: 10.w);
              },
              itemCount: 3,
            ),
          ),

          KVerticalSpacer(height: 20.h),

          KText(
            text: "Time Management",
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: AppColors.titleColor,
          ),

          KVerticalSpacer(height: 10.h),

          // Table
          SizedBox(
            height: 200.h,
            child: KDataTable(columnTitles: columns, rowData: data),
          ),
        ],
      ),
    );
  }
}
