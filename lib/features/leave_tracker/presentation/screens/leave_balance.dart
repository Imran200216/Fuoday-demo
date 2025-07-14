import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/features/leave_tracker/presentation/widgets/leave_balance_card.dart';

class LeaveBalance extends StatelessWidget {
  const LeaveBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return LeaveBalanceCard(
          usedAmount: 8,
          totalAmount: 12,
          title: "Sick Leave",
          usedLabel: "Taken",
          unusedLabel: "Remaining",
          chartSize: 140.w,
        );
      },
      separatorBuilder: (context, index) {
        return KVerticalSpacer(height: 10.h);
      },
      itemCount: 20,
    );
  }
}
