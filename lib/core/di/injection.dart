import 'package:dio/dio.dart';
import 'package:fuoday/commons/providers/checkbox_provider.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/core/providers/app_file_downloader_provider.dart';
import 'package:fuoday/core/providers/app_file_picker_provider.dart';
import 'package:fuoday/core/service/dio_service.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
import 'package:fuoday/core/service/secure_storage_service.dart';
import 'package:fuoday/features/auth/data/datasources/employee_auth_remote_datasource.dart';
import 'package:fuoday/features/auth/data/repository/employee_auth_repository_impl.dart';
import 'package:fuoday/features/auth/domain/usecases/employee_auth_login_usecase.dart';
import 'package:fuoday/features/auth/domain/usecases/employee_auth_logout_usecase.dart';
import 'package:fuoday/features/auth/presentation/providers/employee_auth_login_provider.dart';
import 'package:fuoday/features/auth/presentation/providers/employee_auth_logout_provider.dart';
import 'package:fuoday/features/auth/presentation/providers/sliding_segmented_provider.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
import 'package:fuoday/features/calendar/data/datasources/shift_schedule_remote_datasource.dart';
import 'package:fuoday/features/calendar/data/repository/shift_schedule_repository_impl.dart';
import 'package:fuoday/features/calendar/domain/repository/shift_schedule_repository.dart';
import 'package:fuoday/features/calendar/domain/usecases/get_monthly_shift_usecase.dart';
import 'package:fuoday/features/home/data/datasources/checkin_remote_datasource.dart';
import 'package:fuoday/features/home/data/repositories/checkin_repository.dart';
import 'package:fuoday/features/home/domain/repositories/checkin_repository.dart';
import 'package:fuoday/features/home/domain/usecases/checkin_usecase.dart';
import 'package:fuoday/features/home/presentation/provider/check_in_provider.dart';
import 'package:fuoday/features/profile/data/datasources/employee_profile_remote_datasource.dart';
import 'package:fuoday/features/profile/data/repositories/employee_profile_repository_impl.dart';
import 'package:fuoday/features/profile/domain/repository/employee_profile_repository.dart';
import 'package:fuoday/features/profile/domain/usecases/get_employee_profile_usecase.dart';
import 'package:fuoday/features/profile/presentation/providers/profile_edit_provider.dart';
import 'package:get_it/get_it.dart';

// Get It
final getIt = GetIt.instance;

void setUpServiceLocator() {
  // Commons
  getIt.registerFactory<CheckboxProvider>(() => CheckboxProvider());
  getIt.registerFactory<DropdownProvider>(() => DropdownProvider());

  // Core Services
  getIt.registerSingleton<HiveStorageService>(HiveStorageService());

  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );
  getIt.registerLazySingleton<DioService>(() => DioService());

  // App Utility Providers
  getIt.registerFactory<AppFilePickerProvider>(() => AppFilePickerProvider());
  getIt.registerFactory<AppFileDownloaderProvider>(
    () => AppFileDownloaderProvider(),
  );

  // UI State Providers
  getIt.registerFactory<SlidingSegmentedProvider>(
    () => SlidingSegmentedProvider(),
  );
  getIt.registerFactory<BottomNavProvider>(() => BottomNavProvider());
  getIt.registerFactory<ProfileEditProvider>(() => ProfileEditProvider());

  // Data Source
  getIt.registerLazySingleton<EmployeeAuthRemoteDataSource>(
    () => EmployeeAuthRemoteDataSource(dioService: getIt<DioService>()),
  );

  // Add Check-In Data Source
  getIt.registerLazySingleton<CheckInRemoteDataSource>(
        () => CheckInRemoteDataSourceImpl(dio: getIt<DioService>().client),
  );

  getIt.registerLazySingleton<Dio>(() => getIt<DioService>().client);


  //profile personal data
  getIt.registerLazySingleton<EmployeeProfileRemoteDataSource>(
        () => EmployeeProfileRemoteDataSource(dio: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<EmployeeAuthRepositoryImpl>(
    () => EmployeeAuthRepositoryImpl(
      employeeAuthRemoteDataSource: getIt<EmployeeAuthRemoteDataSource>(),
    ),
  );

  // Add Check-In Repository
  getIt.registerLazySingleton<CheckInRepository>(
        () => CheckInRepositoryImpl(
      remoteDataSource: getIt<CheckInRemoteDataSource>(),
    ),
  );

  //profile personal data
  getIt.registerLazySingleton<EmployeeProfileRepository>(
        () => EmployeeProfileRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<EmployeeAuthLoginUseCase>(
    () => EmployeeAuthLoginUseCase(
      employeeAuthRepository: getIt<EmployeeAuthRepositoryImpl>(),
    ),
  );

  getIt.registerLazySingleton<EmployeeAuthLogOutUseCase>(
    () => EmployeeAuthLogOutUseCase(
      employeeAuthRepository: getIt<EmployeeAuthRepositoryImpl>(),
    ),
  );

  // Add Check-In Use Cases
  getIt.registerLazySingleton<CheckInUseCase>(
        () => CheckInUseCase(repository: getIt<CheckInRepository>()),
  );

  getIt.registerLazySingleton<CheckOutUseCase>(
        () => CheckOutUseCase(repository: getIt<CheckInRepository>()),
  );

  //personal data
  getIt.registerLazySingleton<GetEmployeeProfileUseCase>(
        () => GetEmployeeProfileUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<GetMonthlyShiftUseCase>(() => GetMonthlyShiftUseCase(getIt()));


  getIt.registerLazySingleton(() => ShiftScheduleRemoteDataSource(getIt()));

  getIt.registerLazySingleton<ShiftScheduleRepository>(
        () => ShiftScheduleRepositoryImpl(getIt()),
  );


  // Providers
  getIt.registerFactory<EmployeeAuthLoginProvider>(
    () => EmployeeAuthLoginProvider(
      employeeAuthLoginUseCase: getIt<EmployeeAuthLoginUseCase>(),
    ),
  );

  getIt.registerFactory<EmployeeAuthLogoutProvider>(
    () => EmployeeAuthLogoutProvider(
      employeeAuthLogOutUseCase: getIt<EmployeeAuthLogOutUseCase>(),
    ),
  );

  // Update Check-In Provider with required dependencies
  getIt.registerFactory<CheckInProvider>(
        () => CheckInProvider(
      checkInUseCase: getIt<CheckInUseCase>(),
      checkOutUseCase: getIt<CheckOutUseCase>(),
    ),
  );
}
