import 'package:flutter/material.dart';
import 'package:fuoday/commons/widgets/k_app_%20bar_with_drawer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: KAppBarWithDrawer(
        showUserInfo: false,
        onDrawerPressed: _openDrawer,
        onNotificationPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SfCalendar(
          view: CalendarView.month,
          showNavigationArrow: true,
          showWeekNumber: true,
          showTodayButton: true,
          showCurrentTimeIndicator: true,
          showDatePickerButton: true,
          todayHighlightColor: AppColors.primaryColor,
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
        ),
      ),
    );
  }
}
