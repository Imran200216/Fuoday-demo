import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/features/performance/presentation/widgets/performance_card.dart';

class PerformanceSummary extends StatelessWidget {
  const PerformanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // Columns
    final columns = [
      'S.No',
      'Date',
      'Task',
      'Deadline',
      'Status',
      'Progress Note',
      'Next Step',
    ];

    // Updated Data matching the columns
    final data = [
      {
        'S.No': '1',
        'Date': '2025-07-01',
        'Task': 'UI Design Review',
        'Deadline': '2025-07-05',
        'Status': 'In Progress',
        'Progress Note': 'Completed wireframes, working on mockups',
        'Next Step': 'Finalize color scheme and typography',
      },
      {
        'S.No': '2',
        'Date': '2025-07-02',
        'Task': 'API Integration',
        'Deadline': '2025-07-08',
        'Status': 'Not Started',
        'Progress Note': 'Waiting for backend team to complete endpoints',
        'Next Step': 'Start authentication module integration',
      },
      {
        'S.No': '3',
        'Date': '2025-07-03',
        'Task': 'Database Migration',
        'Deadline': '2025-07-10',
        'Status': 'Completed',
        'Progress Note': 'Successfully migrated all user data',
        'Next Step': 'Performance testing and optimization',
      },
      {
        'S.No': '4',
        'Date': '2025-07-04',
        'Task': 'Testing & QA',
        'Deadline': '2025-07-12',
        'Status': 'In Progress',
        'Progress Note': 'Unit tests completed, integration tests ongoing',
        'Next Step': 'Complete user acceptance testing',
      },
      {
        'S.No': '5',
        'Date': '2025-07-05',
        'Task': 'Code Review',
        'Deadline': '2025-07-07',
        'Status': 'Pending',
        'Progress Note': 'Submitted for peer review',
        'Next Step': 'Address review comments and refactor',
      },
      {
        'S.No': '6',
        'Date': '2025-07-06',
        'Task': 'Documentation',
        'Deadline': '2025-07-15',
        'Status': 'Not Started',
        'Progress Note': 'Gathering requirements and specifications',
        'Next Step': 'Create technical documentation outline',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KText(
            text: "Good Afternoon, Mohammed Irfan",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),

          KVerticalSpacer(height: 20.h),

          GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 10, // Horizontal spacing between items
              mainAxisSpacing: 10, // Vertical spacing between items
              childAspectRatio: 1.0, // Aspect ratio of each item (width/height)
            ),
            itemCount: 4,
            // Total number of items
            itemBuilder: (context, index) {
              return PerformanceCard(
                iconData: Icons.speed,
                cardTitle: "Performance Score",
                cardSubTitle: "0",
              );
            },
          ),

          KVerticalSpacer(height: 12.h),

          KText(
            text: "Current Goals",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),

          KVerticalSpacer(height: 20.h),

          GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 10, // Horizontal spacing between items
              mainAxisSpacing: 10, // Vertical spacing between items
              childAspectRatio: 1.0, // Aspect ratio of each item (width/height)
            ),
            itemCount: 4,
            // Total number of items
            itemBuilder: (context, index) {
              return PerformanceCard(
                iconData: Icons.speed,
                cardTitle: "Performance Score",
                cardSubTitle: "0",
              );
            },
          ),

          KVerticalSpacer(height: 12.h),

          KText(
            text: "Goals Processing Tracking",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),

          KVerticalSpacer(height: 20.h),

          // Table
          SizedBox(
            height: 600.h,
            child: KDataTable(columnTitles: columns, rowData: data),
          ),

          KVerticalSpacer(height: 60.h),
        ],
      ),
    );
  }
}
