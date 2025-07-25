// 7. Use Cases (domain/usecases/checkin_usecase.dart)
import 'package:dartz/dartz.dart';
import 'package:fuoday/features/home/domain/entities/checkin_entity.dart';
import 'package:fuoday/features/home/domain/repositories/checkin_repository.dart';

class CheckInUseCase {
  final CheckInRepository repository;

  CheckInUseCase({required this.repository});

  Future<Either<Exception, CheckInEntity>> call(CheckInEntity checkInEntity) async {
    return await repository.checkIn(checkInEntity);
  }
}

class CheckOutUseCase {
  final CheckInRepository repository;

  CheckOutUseCase({required this.repository});

  Future<Either<Exception, CheckInEntity>> call(CheckInEntity checkOutEntity) async {
    return await repository.checkOut(checkOutEntity);
  }
}