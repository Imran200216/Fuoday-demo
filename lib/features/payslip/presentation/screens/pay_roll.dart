import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:fuoday/features/attendance/presentation/widgets/attendance_line_chart.dart';
import 'package:fuoday/features/payslip/presentation/widgets/pay_slip_card.dart';

class PayRoll extends StatelessWidget {
  const PayRoll({super.key});

  @override
  Widget build(BuildContext context) {
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
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KVerticalSpacer(height: 20.h),

          Row(
            spacing: 8.w,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Pay Roll Cost
              PaySlipCard(
                iconData: Icons.credit_card,
                cardTitle: "Pay Roll Cost",
                amount: "1,00,000",
              ),

              // Total Pay per year
              PaySlipCard(
                iconData: Icons.person,
                cardTitle: "Total pay per year",
                amount: "1,00,000",
              ),
            ],
          ),

          // Chart
          SizedBox(
            height: 340.h,
            child: AttendanceLineChart(
              attendanceValues: attendanceData,
              months: months,
            ),
          ),

          KVerticalSpacer(height: 20.h),

          // Bonus and Incentives
          KText(
            text: "Deduction",
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),

          KVerticalSpacer(height: 20.h),

          // Bonus and Incentives
          Align(
            alignment: Alignment.center,
            child: KText(
              text: "Coming soon",
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor,
              fontSize: 14.sp,
            ),
          ),

          KVerticalSpacer(height: 60.h),
        ],
      ),
    );
  }
}
