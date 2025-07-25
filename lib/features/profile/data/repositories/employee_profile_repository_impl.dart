import 'package:fuoday/features/profile/domain/repository/employee_profile_repository.dart';

import '../../domain/entities/employee_profile_entity.dart';
import '../datasources/employee_profile_remote_datasource.dart';
import '../mappers/employee_profile_mapper.dart';

class EmployeeProfileRepositoryImpl implements EmployeeProfileRepository {
  final EmployeeProfileRemoteDataSource remoteDataSource;

  EmployeeProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<EmployeeProfileEntity> getProfile(String webUserId) async {
    final model = await remoteDataSource.getEmployeeProfile();
    return EmployeeProfileMapper.toEntity(model);
  }
}
