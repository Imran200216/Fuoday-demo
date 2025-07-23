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
import 'package:fuoday/features/home/presentation/provider/check_in_provider.dart';
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
  getIt.registerFactory<CheckInProvider>(() => CheckInProvider());

  // Data Source
  getIt.registerLazySingleton<EmployeeAuthRemoteDataSource>(
    () => EmployeeAuthRemoteDataSource(dioService: getIt<DioService>()),
  );

  // Repository
  getIt.registerLazySingleton<EmployeeAuthRepositoryImpl>(
    () => EmployeeAuthRepositoryImpl(
      employeeAuthRemoteDataSource: getIt<EmployeeAuthRemoteDataSource>(),
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
}
