import 'package:dartz/dartz.dart';
import 'package:fuoday/features/home/domain/entities/checkin_entity.dart';

abstract class CheckInRepository {
  Future<Either<Exception, CheckInEntity>> checkIn(CheckInEntity checkInEntity);
  Future<Either<Exception, CheckInEntity>> checkOut(CheckInEntity checkOutEntity);
}