import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CheckInProvider with ChangeNotifier {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  bool _isCheckedIn = false;
  String _status = "Not Checked In";
  String? _checkInTime;
  String? _checkOutTime;

  StopWatchTimer get stopWatchTimer => _stopWatchTimer;

  bool get isCheckedIn => _isCheckedIn;

  String get status => _status;

  String? get checkInTime => _checkInTime;

  String? get checkOutTime => _checkOutTime;

  void handleCheckIn() {
    _isCheckedIn = true;
    _status = "Checked In";
    _checkInTime = _formatTime(DateTime.now());
    _stopWatchTimer.onStartTimer();
    notifyListeners();
  }

  void handleCheckOut() {
    _isCheckedIn = false;
    _status = "Checked Out";
    _checkOutTime = _formatTime(DateTime.now());
    _stopWatchTimer.onResetTimer();
    _stopWatchTimer.onStopTimer();
    notifyListeners();
  }

  String _formatTime(DateTime time) {
    return DateFormat('h:mm a').format(time);
  }

  void disposeProvider() {
    _stopWatchTimer.dispose();
  }
}
