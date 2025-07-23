import 'package:fuoday/config/flavors/flavors_config.dart';

class AppApiEndpointConstants {
  // Base Url
  static String get baseUrl => AppEnvironment.baseUrl;

  // Login Endpoint
  static String get login => '$baseUrl/web-users/login';

  // Logout Endpoint
  static String get logout => '$baseUrl/web-users/logout';

  // Get All Profile Endpoint
  static String get getAllProfileDetails =>
      '$baseUrl/hrms/profile/getprofile/28';
}
