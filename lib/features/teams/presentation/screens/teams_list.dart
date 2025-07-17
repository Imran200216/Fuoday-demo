import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_data_table.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      'Employee ID',
      'Name',
      'Location',
      'Email Address',
      'Department',
      'Designation',
    ];

    final data = [
      {
        'Employee ID': 'E001',
        'Name': 'John Doe',
        'Location': 'NY',
        'Email Address': 'john@example.com',
        'Department': 'IT',
        'Designation': 'Developer',
      },
      {
        'Employee ID': 'E002',
        'Name': 'Jane Smith',
        'Location': 'LA',
        'Email Address': 'jane@example.com',
        'Department': 'hr',
        'Designation': 'Manager',
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          KVerticalSpacer(height: 20.h),

          SizedBox(
            height: 400.h,
            child: KDataTable(columnTitles: columns, rowData: data),
          ),
        ],
      ),
    );
  }
}
