import 'package:flutter/cupertino.dart';
import 'package:fuoday/common_main.dart';
import 'package:fuoday/config/flavors/flavors_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //

  // Environment Dev
  AppEnvironment.setUpEnv(Environment.development);

  // Common Main
  commonMain();
}
