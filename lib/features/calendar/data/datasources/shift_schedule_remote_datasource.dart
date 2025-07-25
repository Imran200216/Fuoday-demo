import 'package:dio/dio.dart';
import 'package:fuoday/core/constants/app_api_endpoint_constants.dart';
import 'package:fuoday/features/calendar/data/models/shift_schedule_model.dart';


class ShiftScheduleRemoteDataSource {
  final Dio dio;

  ShiftScheduleRemoteDataSource(this.dio);

  Future<List<ShiftScheduleModel>> fetchMonthlyShifts(String webUserId, String month) async {
    final response = await dio.post(
      AppApiEndpointConstants.getSchedules,
      data: {
        'web_user_id': webUserId,
        'month': month, // format: YYYY-MM
      },
    );

    final data = response.data['data']['shifts'] as List;
    return data.map((json) => ShiftScheduleModel.fromJson(json)).toList();
  }
}
