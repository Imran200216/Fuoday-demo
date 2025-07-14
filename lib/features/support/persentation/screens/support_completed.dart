import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/features/support/persentation/widgets/support_info_card.dart';

class SupportCompleted extends StatelessWidget {
  const SupportCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SupportInfoCard(
          priority: "High Priority",
          issue: "Laptop Issue",
          avatarText: "I",
          userName: "Mohammed Irfan",
          ticketIssuedDate: "July 01",
          ticketIssue: "Laptop Issue",
          domain: "Networking",
        );
      },
      separatorBuilder: (context, index) {
        return KVerticalSpacer(height: 10.h);
      },
      itemCount: 10,
    );
  }
}
