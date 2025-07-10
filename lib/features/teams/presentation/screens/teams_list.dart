import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Employees
    final employees = [
      {
        'id': 'E101',
        'name': 'Imran Babuji',
        'location': 'Bangalore',
        'email': 'imran@example.com',
        'department': 'Engineering',
        'designation': 'Flutter Developer',
      },
      {
        'id': 'E102',
        'name': 'Sara Ali',
        'location': 'Hyderabad',
        'email': 'sara@example.com',
        'department': 'Marketing',
        'designation': 'Marketing Lead',
      },
      {
        'id': 'E103',
        'name': 'John Wick',
        'location': 'Mumbai',
        'email': 'john@example.com',
        'department': 'HR',
        'designation': 'HR Manager',
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          KVerticalSpacer(height: 20.h),

          SizedBox(
            height: 400.h,
            child: DataTable2(
              columnSpacing: 16,
              horizontalMargin: 12,
              minWidth: 1000,
              headingRowColor: MaterialStateProperty.all(
                Colors.blueGrey.shade50,
              ),
              columns: const [
                DataColumn(label: Text('Employee ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Email Address')),
                DataColumn(label: Text('Department')),
                DataColumn(label: Text('Designation')),
              ],
              rows: employees.map((employee) {
                return DataRow(
                  cells: [
                    DataCell(Text(employee['id']!)),
                    DataCell(Text(employee['name']!)),
                    DataCell(Text(employee['location']!)),
                    DataCell(Text(employee['email']!)),
                    DataCell(Text(employee['department']!)),
                    DataCell(Text(employee['designation']!)),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
