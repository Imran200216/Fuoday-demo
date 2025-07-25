import 'package:fuoday/config/flavors/flavors_config.dart';

class AppApiEndpointConstants {
  // Base Url
  static String get baseUrl => AppEnvironment.baseUrl;

  // Login Endpoint
  static String get login => '$baseUrl/web-users/login';

  // Logout Endpoint
  static String get logout => '$baseUrl/web-users/logout';

  //checkIn Endpoint
  static String get checkIn => '$baseUrl/hrms/attendance/addattendance';

  //checkOut Endpoint
  static String get checkOut => '$baseUrl/hrms/attendance/updateattendance';

  //calendar Endpoint
  static String get getSchedules  => '$baseUrl/hrms/timetracker/getschedules';

  //emp get profile data endpoint
  static String get ProfileData => '$baseUrl/hrms/profile/getprofile/28';

  // Get All Profile Endpoint
  static String getAllProfileDetails(String webUserId) => '$baseUrl/hrms/profile/getprofile/$webUserId';
}
