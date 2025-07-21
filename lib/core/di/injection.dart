import 'package:fuoday/commons/providers/checkbox_provider.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/core/providers/app_file_picker_provider.dart';
import 'package:fuoday/core/service/hive_storage_service.dart';
import 'package:fuoday/features/auth/presentation/providers/sliding_segmented_provider.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
import 'package:fuoday/features/home/presentation/provider/check_in_provider.dart';
import 'package:fuoday/features/profile/presentation/providers/profile_edit_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  // Checkbox Provider
  getIt.registerFactory<CheckboxProvider>(() => CheckboxProvider());

  // Drop down Provider
  getIt.registerFactory<DropdownProvider>(() => DropdownProvider());

  // Sliding Segmented Provider
  getIt.registerFactory<SlidingSegmentedProvider>(
    () => SlidingSegmentedProvider(),
  );

  // BottomNav Provider
  getIt.registerFactory<BottomNavProvider>(() => BottomNavProvider());

  // Profile Edit Provider
  getIt.registerFactory<ProfileEditProvider>(() => ProfileEditProvider());

  // File Picker
  getIt.registerFactory<AppFilePickerProvider>(() => AppFilePickerProvider());

  // Hive Storage Service
  getIt.registerLazySingleton<HiveStorageService>(() => HiveStorageService());

  // Check in provider
  getIt.registerFactory<CheckInProvider>(() => CheckInProvider());
}
