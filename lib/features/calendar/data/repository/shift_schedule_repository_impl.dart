import 'package:fuoday/features/calendar/domain/entities/shift_schedule_entity.dart';
import 'package:fuoday/features/calendar/domain/repository/shift_schedule_repository.dart';

import '../datasources/shift_schedule_remote_datasource.dart';

class ShiftScheduleRepositoryImpl implements ShiftScheduleRepository {
  final ShiftScheduleRemoteDataSource remoteDataSource;

  ShiftScheduleRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ShiftScheduleEntity>> getMonthlyShifts(String webUserId, String month) async {
    final models = await remoteDataSource.fetchMonthlyShifts(webUserId, month);
    return models.map((model) => ShiftScheduleEntity(
      id: model.id,
      webUserId: model.webUserId,
      empName: model.empName,
      empId: model.empId,
      date: model.date,
      shiftStart: model.shiftStart,
      shiftEnd: model.shiftEnd,
    )).toList();
  }
}
