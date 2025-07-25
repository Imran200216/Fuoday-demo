import '../entities/shift_schedule_entity.dart';

abstract class ShiftScheduleRepository {
  Future<List<ShiftScheduleEntity>> getMonthlyShifts(String userId, String month);
}
