import 'package:flutter/material.dart';
import 'package:fuoday/commons/providers/checkbox_provider.dart';
import 'package:fuoday/commons/providers/dropdown_provider.dart';
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart';
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
}
