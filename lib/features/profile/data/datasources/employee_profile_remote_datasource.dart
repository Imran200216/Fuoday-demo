import 'package:fuoday/core/constants/app_api_endpoint_constants.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/core/service/dio_service.dart';
import '../models/employee_profile_model.dart';

class EmployeeProfileRemoteDataSource {
  final DioService dio;

  EmployeeProfileRemoteDataSource({required this.dio});

  Future<EmployeeProfileModel> getEmployeeProfile() async {
    try {
      final response = await dio.get(
        AppApiEndpointConstants.ProfileData, // 🔥 pass ID dynamically
      );

      return EmployeeProfileModel.fromJson(response.data['data']);
    } catch (e) {
      AppLoggerHelper.logError('Failed to fetch profile: $e');
      rethrow;
    }
  }

}
