// 6. Repository Implementation (data/repositories/checkin_repository_impl.dart)
import 'package:dartz/dartz.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
import 'package:fuoday/core/helper/app_logger_helper.dart';
import 'package:fuoday/features/home/data/datasources/checkin_remote_datasource.dart';
import 'package:fuoday/features/home/data/model/checkin_model.dart';
import 'package:fuoday/features/home/domain/entities/checkin_entity.dart';
import 'package:fuoday/features/home/domain/repositories/checkin_repository.dart';
import 'package:intl/intl.dart';

class CheckInRepositoryImpl implements CheckInRepository {
  final CheckInRemoteDataSource remoteDataSource;

  CheckInRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, CheckInEntity>> checkIn(CheckInEntity checkInEntity) async {
    try {
      AppLoggerHelper.logInfo('🔍 Repository received checkIn entity: webUserId=${checkInEntity.webUserId}, time=${checkInEntity.time}');

      // ✅ Use the webUserId from the entity (passed from provider)
      int webUserId = checkInEntity.webUserId;

      // ✅ Fallback: Get from correct HiveStorageService if entity webUserId is invalid
      if (webUserId == 0 || webUserId == null) {
        AppLoggerHelper.logInfo('🔍 Entity webUserId is invalid ($webUserId), trying to get from storage...');

        final hiveService = HiveStorageService();
        final employeeDetails = hiveService.employeeDetails;

        if (employeeDetails != null && employeeDetails['web_user_id'] != null) {
          final storedWebUserId = employeeDetails['web_user_id'];
          webUserId = storedWebUserId is String ? int.parse(storedWebUserId) : storedWebUserId as int;
          AppLoggerHelper.logInfo('🔍 Got webUserId from storage: $webUserId');
        } else {
          AppLoggerHelper.logError('❌ Could not get webUserId from storage either');
          throw Exception('Invalid webUserId: Could not get valid web user ID');
        }
      }

      AppLoggerHelper.logInfo('✅ Final webUserId for API call: $webUserId');

      final checkInModel = CheckInModel(
        webUserId: webUserId, // ✅ Use the correct webUserId (should be 28)
        time: checkInEntity.time, // ✅ Use time from entity instead of generating new one
        isCheckIn: true,
      );

      AppLoggerHelper.logInfo('🚀 Calling remote data source with model: webUserId=${checkInModel.webUserId}, time=${checkInModel.time}');

      final result = await remoteDataSource.checkIn(checkInModel);

      AppLoggerHelper.logInfo('✅ CheckIn API call successful');
      return Right(result);
    } catch (e) {
      AppLoggerHelper.logError('❌ CheckIn repository error: $e');
      return Left(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, CheckInEntity>> checkOut(CheckInEntity checkOutEntity) async {
    try {
      AppLoggerHelper.logInfo('🔍 Repository received checkOut entity: webUserId=${checkOutEntity.webUserId}, time=${checkOutEntity.time}');

      // ✅ Use the webUserId from the entity (passed from provider)
      int webUserId = checkOutEntity.webUserId;

      // ✅ Fallback: Get from correct HiveStorageService if entity webUserId is invalid
      if (webUserId == 0 || webUserId == null) {
        AppLoggerHelper.logInfo('🔍 Entity webUserId is invalid ($webUserId), trying to get from storage...');

        final hiveService = HiveStorageService();
        final employeeDetails = hiveService.employeeDetails;

        if (employeeDetails != null && employeeDetails['web_user_id'] != null) {
          final storedWebUserId = employeeDetails['web_user_id'];
          webUserId = storedWebUserId is String ? int.parse(storedWebUserId) : storedWebUserId as int;
          AppLoggerHelper.logInfo('🔍 Got webUserId from storage: $webUserId');
        } else {
          AppLoggerHelper.logError('❌ Could not get webUserId from storage either');
          throw Exception('Invalid webUserId: Could not get valid web user ID');
        }
      }

      AppLoggerHelper.logInfo('✅ Final webUserId for API call: $webUserId');

      final checkOutModel = CheckInModel(
        webUserId: webUserId, // ✅ Use the correct webUserId (should be 28)
        time: checkOutEntity.time, // ✅ Use time from entity instead of generating new one
        isCheckIn: false,
      );

      AppLoggerHelper.logInfo('🚀 Calling remote data source with model: webUserId=${checkOutModel.webUserId}, time=${checkOutModel.time}');

      final result = await remoteDataSource.checkOut(checkOutModel);

      AppLoggerHelper.logInfo('✅ CheckOut API call successful');
      return Right(result);
    } catch (e) {
      AppLoggerHelper.logError('❌ CheckOut repository error: $e');
      return Left(e is Exception ? e : Exception(e.toString()));
    }
  }

  String _formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }
}