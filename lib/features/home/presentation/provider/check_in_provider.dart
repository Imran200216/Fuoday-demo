import 'package:flutter/material.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/features/home/domain/entities/checkin_entity.dart';
import 'package:fuoday/features/home/domain/usecases/checkin_usecase.dart';
import 'package:intl/intl.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CheckInProvider with ChangeNotifier {
  final CheckInUseCase checkInUseCase;
  final CheckOutUseCase checkOutUseCase;

  CheckInProvider({
    required this.checkInUseCase,
    required this.checkOutUseCase,
  });

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  bool _isCheckedIn = false;
  String _status = "Not Checked In";
  String? _checkInTime;
  String? _checkOutTime;
  bool _isLoading = false;
  String? _errorMessage;

  StopWatchTimer get stopWatchTimer => _stopWatchTimer;
  bool get isCheckedIn => _isCheckedIn;
  String get status => _status;
  String? get checkInTime => _checkInTime;
  String? get checkOutTime => _checkOutTime;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Get webUserId from stored employee details
  Future<int> _getWebUserId() async {
    try {
      // Get HiveStorageService instance
      final hiveService = HiveStorageService();
      final employeeDetails = hiveService.employeeDetails;

      if (employeeDetails == null) {
        AppLoggerHelper.logError('❌ No employee details found. Please login again.');
        throw Exception('No employee details found. Please login again.');
      }

      final webUserId = employeeDetails['web_user_id'];

      AppLoggerHelper.logInfo('🔍 Retrieved web_user_id from storage: $webUserId');
      AppLoggerHelper.logInfo('🔍 All employee details: $employeeDetails');

      if (webUserId == null || webUserId == 0 || webUserId == '0' || webUserId.toString().isEmpty) {
        AppLoggerHelper.logError('❌ Invalid web_user_id: $webUserId. Please login again.');
        throw Exception('Invalid web_user_id: $webUserId. Please login again.');
      }

      // Convert to int if it's stored as string
      final finalWebUserId = webUserId is String ? int.parse(webUserId) : webUserId as int;
      AppLoggerHelper.logInfo('✅ Final webUserId to use: $finalWebUserId');
      return finalWebUserId;
    } catch (e) {
      AppLoggerHelper.logError('❌ Error getting web_user_id: $e');
      throw Exception('Could not get web_user_id. Please login again.');
    }
  }

  Future<void> handleCheckIn() async {
    _setLoading(true);
    _clearError();

    try {
      // Get the actual webUserId from storage
      final webUserId = await _getWebUserId();
      AppLoggerHelper.logInfo('🔍 Using webUserId for check-in: $webUserId');

      final checkInEntity = CheckInEntity(
        webUserId: webUserId, // ✅ Use actual webUserId (should be 28)
        time: _formatTime(DateTime.now()),
        isCheckIn: true,
      );

      AppLoggerHelper.logInfo('🔍 CheckIn Entity created - webUserId: ${checkInEntity.webUserId}, time: ${checkInEntity.time}');

      // ⚠️ IMPORTANT: Log the entity just before calling the use case
      AppLoggerHelper.logInfo('🚀 About to call checkInUseCase with entity: webUserId=${checkInEntity.webUserId}, time=${checkInEntity.time}, isCheckIn=${checkInEntity.isCheckIn}');

      final result = await checkInUseCase(checkInEntity);

      result.fold(
            (exception) {
          AppLoggerHelper.logError('❌ CheckIn failed: ${exception.toString()}');
          _setError(exception.toString());
          _setLoading(false);
        },
            (entity) {
          AppLoggerHelper.logInfo('✅ CheckIn successful: ${entity.time}');
          _isCheckedIn = true;
          _status = "Checked In";
          _checkInTime = entity.time;
          _stopWatchTimer.onStartTimer();
          _setLoading(false);
          notifyListeners();
        },
      );
    } catch (e) {
      AppLoggerHelper.logError('❌ CheckIn error: ${e.toString()}');
      _setError(e.toString());
      _setLoading(false);
    }

  }

  Future<void> handleCheckOut() async {
    _setLoading(true);
    _clearError();


    try {
      // Get the actual webUserId from storage
      final webUserId = await _getWebUserId();
      AppLoggerHelper.logInfo('🔍 Using webUserId for check-out: $webUserId');

      final checkOutEntity = CheckInEntity(
        webUserId: webUserId, // ✅ Use actual webUserId (should be 28)
        time: _formatTime(DateTime.now()),
        isCheckIn: false,
      );

      AppLoggerHelper.logInfo('🔍 CheckOut Entity created - webUserId: ${checkOutEntity.webUserId}, time: ${checkOutEntity.time}');

      // ⚠️ IMPORTANT: Log the entity just before calling the use case
      AppLoggerHelper.logInfo('🚀 About to call checkOutUseCase with entity: webUserId=${checkOutEntity.webUserId}, time=${checkOutEntity.time}, isCheckIn=${checkOutEntity.isCheckIn}');

      final result = await checkOutUseCase(checkOutEntity);

      result.fold(
            (exception) {
          AppLoggerHelper.logError('❌ CheckOut failed: ${exception.toString()}');
          _setError(exception.toString());
          _setLoading(false);
        },
            (entity) {
          AppLoggerHelper.logInfo('✅ CheckOut successful: ${entity.time}');
          _isCheckedIn = false;
          _status = "Checked Out";
          _checkOutTime = entity.time;
          _stopWatchTimer.onResetTimer();
          _stopWatchTimer.onStopTimer();
          _setLoading(false);
          notifyListeners();
        },
      );
    } catch (e) {
      AppLoggerHelper.logError('❌ CheckOut error: ${e.toString()}');
      _setError(e.toString());
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    AppLoggerHelper.logError('🔴 Provider Error: $error');
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }

  String _formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }

  void disposeProvider() {
    _stopWatchTimer.dispose();
    AppLoggerHelper.logInfo('🗑️ CheckInProvider disposed');
  }
}