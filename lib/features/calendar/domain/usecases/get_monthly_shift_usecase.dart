import 'package:fuoday/features/calendar/domain/repository/shift_schedule_repository.dart';

import '../entities/shift_schedule_entity.dart';

class GetMonthlyShiftUseCase {
  final ShiftScheduleRepository repository;

  GetMonthlyShiftUseCase(this.repository);

  Future<List<ShiftScheduleEntity>> call(String webUserId, String month) {
    return repository.getMonthlyShifts(webUserId, month);
  }

}
