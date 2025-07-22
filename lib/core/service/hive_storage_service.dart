import 'package:hive/hive.dart';
import 'package:fuoday/core/constants/app_hive_storage_constants.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';

class HiveStorageService {
  static final HiveStorageService _instance = HiveStorageService._internal();

  factory HiveStorageService() => _instance;

  HiveStorageService._internal();

  late Box _authBox;
  late Box _onBoardingBox;
  late Box _employeeDetailsBox;

  /// Initialize Hive boxes
  Future<void> init() async {
    try {
      _authBox = Hive.box(AppHiveStorageConstants.authBox);
      _onBoardingBox = Hive.box(AppHiveStorageConstants.onBoardingBox);
      _employeeDetailsBox = Hive.box(
        AppHiveStorageConstants.employeeDetailsBox,
      );

      AppLoggerHelper.logInfo("Hive boxes initialized successfully.");
    } catch (e) {
      AppLoggerHelper.logError("Failed to initialize Hive boxes: $e");
    }
  }

  /// Set Auth login status
  Future<void> setIsAuthLogged(bool value) async {
    await _authBox.put(AppHiveStorageConstants.isAuthLoggedInStatus, value);
    AppLoggerHelper.logInfo("Set isAuthLoggedInStatus to: $value");
  }

  /// Set OnBoarding status
  Future<void> setOnBoardingIn(bool value) async {
    await _onBoardingBox.put(AppHiveStorageConstants.onBoardingInStatus, value);
    AppLoggerHelper.logInfo("Set onBoardingInStatus to: $value");
  }

  /// Get Auth login status
  bool get isAuthLoggedStatus {
    final value = _authBox.get(
      AppHiveStorageConstants.isAuthLoggedInStatus,
      defaultValue: false,
    );
    AppLoggerHelper.logInfo("Fetched isAuthLoggedInStatus: $value");
    return value;
  }

  /// Get OnBoarding status
  bool get isOnBoardingInStatus {
    final value = _onBoardingBox.get(
      AppHiveStorageConstants.onBoardingInStatus,
      defaultValue: false,
    );
    AppLoggerHelper.logInfo("Fetched onBoardingInStatus: $value");
    return value;
  }

  // Set Employee Details
  Future<void> setEmployeeDetails({
    required String role,
    required String empId,
    required String email,
    required String designation,
    required String profilePhoto,
    required String userName,
  }) async {
    final employeeData = {
      "role": role,
      "empId": empId,
      "email": email,
      "designation": designation,
      "profilePhoto": profilePhoto,
      "name": userName,
    };

    await _employeeDetailsBox.put(
      AppHiveStorageConstants.employeeDetailsBox,
      employeeData,
    );

    AppLoggerHelper.logInfo("Employee details saved: $employeeData");
  }

  /// Get Employee Details
  Map<String, dynamic>? get employeeDetails {
    final data = _employeeDetailsBox.get(
      AppHiveStorageConstants.employeeDetailsBox,
    );
    if (data != null && data is Map<String, dynamic>) {
      AppLoggerHelper.logInfo("Fetched employee details: $data");
      return data;
    }
    AppLoggerHelper.logError("No employee details found.");
    return null;
  }
}
