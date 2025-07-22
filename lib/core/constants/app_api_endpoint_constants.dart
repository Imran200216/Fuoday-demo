import 'package:fuoday/config/flavors/flavors_config.dart';

class AppApiEndpointConstants {
  // Base Url
  static String get baseUrl => AppEnvironment.baseUrl;

  // Login
  static String get login => '$baseUrl/web-users/login';

  // Logout
  static String get logout => '$baseUrl/web-users/logout';
}
