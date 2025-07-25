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
      _authBox = await Hive.openBox(AppHiveStorageConstants.authBoxKey);
      _onBoardingBox = await Hive.openBox(
        AppHiveStorageConstants.onBoardingBoxKey,
      );
      _employeeDetailsBox = await Hive.openBox(
        AppHiveStorageConstants.employeeDetailsBoxKey,
      );

      AppLoggerHelper.logInfo("✅ Hive boxes initialized successfully.");
    } catch (e) {
      AppLoggerHelper.logError("❌ Failed to initialize Hive boxes: $e");
    }
  }

  /// Set Auth login status
  Future<void> setIsAuthLogged(bool value) async {
    await _authBox.put(AppHiveStorageConstants.isAuthLoggedInStatus, value);
    AppLoggerHelper.logInfo("Set isAuthLoggedInStatus to: $value");
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

  /// Set OnBoarding status
  Future<void> setOnBoardingIn(bool value) async {
    await _onBoardingBox.put(AppHiveStorageConstants.onBoardingInStatus, value);
    AppLoggerHelper.logInfo("Set onBoardingInStatus to: $value");
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

  /// ✅ Set Employee Details (instance method)
  Future<void> setEmployeeDetails({
    required String role,
    required String empId,
    required String email,
    required String designation,
    required String profilePhoto,
    required String userName,
    required String webUserId
  }) async {
    final employeeData = {
      "role": role,
      "empId": empId,
      "email": email,
      "designation": designation,
      "profilePhoto": profilePhoto,
      "name": userName,
      "web_user_id":webUserId
    };

    await _employeeDetailsBox.put(
      AppHiveStorageConstants.employeeDetailsKey,
      employeeData,
    );
    AppLoggerHelper.logInfo("✅ Employee details saved: $employeeData");
  }

  /// ✅ Static method for compatibility (delegates to instance)
  static Future<void> setEmployeeDetailsStatic({
    required String role,
    required String empId,
    required String email,
    required String designation,
    required String profilePhoto,
    required String userName,
    required String webUserId
  }) async {
    final instance = HiveStorageService();
    await instance.setEmployeeDetails(
      role: role,
      empId: empId,
      email: email,
      designation: designation,
      profilePhoto: profilePhoto,
      userName: userName,
      webUserId: webUserId,
    );
  }

  /// ✅ Get Employee Details using correct internal key
  Map<String, dynamic>? get employeeDetails {
    try {
      final data = _employeeDetailsBox.get(
        AppHiveStorageConstants.employeeDetailsKey,
      );

      if (data != null) {
        // Handle both Map<String, dynamic> and Map<dynamic, dynamic>
        final Map<String, dynamic> employeeData = Map<String, dynamic>.from(
          data,
        );
        AppLoggerHelper.logInfo("💡 Fetched employee details: $employeeData");
        return employeeData;
      }

      AppLoggerHelper.logError("⛔ No employee details found in box.");
      return null;
    } catch (e) {
      AppLoggerHelper.logError("❌ Error fetching employee details: $e");
      return null;
    }
  }

  /// ✅ Method to check if employee details exist
  bool get hasEmployeeDetails {
    return _employeeDetailsBox.containsKey(
      AppHiveStorageConstants.employeeDetailsKey,
    );
  }

  /// ✅ Method to clear employee details (useful for logout)
  Future<void> clearEmployeeDetails() async {
    await _employeeDetailsBox.delete(
      AppHiveStorageConstants.employeeDetailsKey,
    );
    AppLoggerHelper.logInfo("🗑️ Employee details cleared");
  }
}
