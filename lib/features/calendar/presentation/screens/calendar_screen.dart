import 'package:flutter/material.dart';
import 'package:fuoday/commons/widgets/k_app_ bar_with_drawer.dart';
import 'package:fuoday/commons/widgets/k_drawer.dart';
import 'package:fuoday/core/di/injection.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'package:fuoday/features/calendar/domain/usecases/get_monthly_shift_usecase.dart';
import 'package:fuoday/features/calendar/domain/entities/shift_schedule_entity.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late GetMonthlyShiftUseCase getMonthlyShiftUseCase;
  ShiftAppointmentDataSource? _shiftDataSource;
  late String selectedMonth;

  void _onViewChanged(ViewChangedDetails details) {
    final DateTime firstVisibleDate = details.visibleDates.first;
    final String newMonth = DateFormat('yyyy-MM').format(firstVisibleDate);

    // Only update if month actually changes
    if (newMonth != selectedMonth) {
      print("🗓 Month changed: $selectedMonth ➡️ $newMonth");
      selectedMonth = newMonth;
      _loadShifts();
    }
  }


  @override
  void initState() {
    super.initState();
    print("CalendarScreen: initState called");


    final now = DateTime.now();
    selectedMonth = DateFormat('yyyy-MM').format(now);

    getMonthlyShiftUseCase = getIt<GetMonthlyShiftUseCase>();
    _loadShifts();
  }

  Future<void> _loadShifts() async {
    try {
      print("Inside _loadShifts");

      final hiveService = getIt<HiveStorageService>();
      final employeeDetails = hiveService.employeeDetails;
      final webUserId = employeeDetails?['web_user_id']?.toString();

      print("webUserId: $webUserId");

      if (webUserId == null) {
        print("webUserId is null");
        return;
      }

      print("selectedMonth: $selectedMonth");

      final List<ShiftScheduleEntity> shifts =
      await getMonthlyShiftUseCase(webUserId, selectedMonth);

      print("✅ Shifts: $shifts");

      final appointments = shifts.map((shift) {
        final start = DateTime.parse('${shift.date} ${shift.shiftStart}');
        final end = DateTime.parse('${shift.date} ${shift.shiftEnd}');
        return Appointment(
          startTime: start,
          endTime: end,
          subject: 'Shift',
          color: AppColors.primaryColor,
        );
      }).toList();

      setState(() {
        _shiftDataSource = ShiftAppointmentDataSource(appointments);
      });
    } catch (e, st) {
      print("❌ Error in _loadShifts: $e");
      print("Stack trace: $st");
    }
  }




  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final hiveService = getIt<HiveStorageService>();
    final employeeDetails = hiveService.employeeDetails;

    final name = employeeDetails?['name'] ?? "No Name";
    final profilePhoto = employeeDetails?['profilePhoto'] ?? "";
    final designation = employeeDetails?['designation'] ?? "No Designation";
    final email = employeeDetails?['email'] ?? "No Email";

    return Scaffold(
      key: _scaffoldKey,
      appBar: KAppBarWithDrawer(
        userName: name,
        cachedNetworkImageUrl: profilePhoto,
        userDesignation: designation,
        showUserInfo: true,
        onDrawerPressed: _openDrawer,
        onNotificationPressed: () {},
      ),
      drawer: KDrawer(
        userName: name,
        userEmail: email,
        profileImageUrl: profilePhoto,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _shiftDataSource == null
            ? const Center(child: CircularProgressIndicator())
            : SfCalendar(
          view: CalendarView.month,
          dataSource: _shiftDataSource,
          showNavigationArrow: true,
          showWeekNumber: true,
          showTodayButton: true,
          showCurrentTimeIndicator: true,
          showDatePickerButton: true,
          todayHighlightColor: AppColors.primaryColor,
          onViewChanged: _onViewChanged,
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
        ),
      ),
    );
  }
}


class ShiftAppointmentDataSource extends CalendarDataSource {
  ShiftAppointmentDataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}