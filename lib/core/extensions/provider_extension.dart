import 'package:flutter/material.dart';
import 'package:fuoday/commons/providers/checkbox_provider.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/core/providers/app_file_downloader_provider.dart';
import 'package:fuoday/core/providers/app_file_picker_provider.dart';
import 'package:fuoday/features/auth/presentation/providers/employee_auth_login_provider.dart';
import 'package:fuoday/features/auth/presentation/providers/employee_auth_logout_provider.dart';
import 'package:fuoday/features/auth/presentation/providers/sliding_segmented_provider.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
import 'package:fuoday/features/home/presentation/provider/check_in_provider.dart';
import 'package:fuoday/features/profile/presentation/providers/profile_edit_provider.dart';
import 'package:provider/provider.dart';

extension ProviderExtension on BuildContext {
  // Check box provider
  CheckboxProvider get checkBoxProviderRead => read<CheckboxProvider>();

  CheckboxProvider get checkBoxProviderWatch => watch<CheckboxProvider>();

  // Drop down provider
  DropdownProvider get dropDownProviderRead => read<DropdownProvider>();

  DropdownProvider get dropDownProviderWatch => watch<DropdownProvider>();

  // Bottom Nav Provider
  BottomNavProvider get bottomNavProviderRead => read<BottomNavProvider>();

  BottomNavProvider get bottomNavProviderWatch => watch<BottomNavProvider>();

  // Sliding Segmented Provider
  SlidingSegmentedProvider get slidingSegmentProviderRead =>
      read<SlidingSegmentedProvider>();

  SlidingSegmentedProvider get slidingSegmentProviderWatch =>
      watch<SlidingSegmentedProvider>();

  // Profile Edit Provider
  ProfileEditProvider get profileEditProviderRead =>
      read<ProfileEditProvider>();

  ProfileEditProvider get profileEditProviderWatch =>
      watch<ProfileEditProvider>();

  // App File Picker Provider
  AppFilePickerProvider get filePickerProviderWatch =>
      watch<AppFilePickerProvider>();

  AppFilePickerProvider get filePickerProviderRead =>
      read<AppFilePickerProvider>();

  // Check In Provider
  CheckInProvider get checkInProviderWatch => watch<CheckInProvider>();

  CheckInProvider get checkInProviderRead => read<CheckInProvider>();

  // App File Downloader Provider
  AppFileDownloaderProvider get appFileDownloaderProviderWatch =>
      watch<AppFileDownloaderProvider>();

  AppFileDownloaderProvider get appFileDownloaderProviderRead =>
      read<AppFileDownloaderProvider>();

  // Employee Auth Login Provider
  EmployeeAuthLoginProvider get employeeAuthLoginProviderWatch =>
      watch<EmployeeAuthLoginProvider>();

  EmployeeAuthLoginProvider get employeeAuthLoginProviderRead =>
      read<EmployeeAuthLoginProvider>();

  // Employee Auth Logout Provider
  EmployeeAuthLogoutProvider get employeeAuthLogOutProviderWatch =>
      watch<EmployeeAuthLogoutProvider>();

  EmployeeAuthLogoutProvider get employeeAuthLogoutProviderRead =>
      read<EmployeeAuthLogoutProvider>();
}
