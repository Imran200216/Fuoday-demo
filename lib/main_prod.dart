import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fuoday/common_main.dart';
import 'package:fuoday/config/flavors/flavors_config.dart';

import 'core/constants/app_assets_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env file
  await dotenv.load(fileName: AppAssetsConstants.env);

  // Environment Dev
  AppEnvironment.setUpEnv(Environment.production);

  // Common Main
  commonMain();
}
