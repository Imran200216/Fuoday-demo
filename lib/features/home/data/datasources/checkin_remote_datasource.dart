// 4. Data Source (data/datasources/checkin_remote_datasource.dart)
import 'package:dio/dio.dart';
import 'package:fuoday/core/constants/app_api_endpoint_constants.dart';
import 'package:fuoday/features/home/data/model/checkin_model.dart';
import 'package:hive/hive.dart';

abstract class CheckInRemoteDataSource {
  Future<CheckInModel> checkIn(CheckInModel checkInModel);
  Future<CheckInModel> checkOut(CheckInModel checkOutModel);
}

class CheckInRemoteDataSourceImpl implements CheckInRemoteDataSource {
  final Dio dio;

  CheckInRemoteDataSourceImpl({required this.dio});

  @override
  Future<CheckInModel> checkIn(CheckInModel checkInModel) async {
    try {
      final response = await dio.post(
        AppApiEndpointConstants.checkIn,
        data: checkInModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // Add authorization header if needed
            // 'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CheckInModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Check-in failed',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<CheckInModel> checkOut(CheckInModel checkOutModel) async {
    try {
      final response = await dio.post(
        AppApiEndpointConstants.checkOut,
        data: checkOutModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // Add authorization header if needed
            // 'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CheckInModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Check-out failed',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please try again.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Something went wrong';
        return Exception('Error $statusCode: $message');
      case DioExceptionType.cancel:
        return Exception('Request cancelled');
      case DioExceptionType.unknown:
        return Exception('Network error. Please check your connection.');
      default:
        return Exception('Unexpected error occurred');
    }
  }
}