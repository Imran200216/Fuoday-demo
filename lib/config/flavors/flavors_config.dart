import 'package:fuoday/config/env/env.dart';

enum Environment { development, production }

abstract class AppEnvironment {
  static late String baseUrl;
  static late String environmentName;

  static late Environment _environment;

  static Environment get environment => _environment;

  static setUpEnv(Environment environment) {
    _environment = environment;

    switch (environment) {
      case Environment.development:
        baseUrl = Env.apiDevBaseUrl;
        environmentName = "DEV";
        break;

      case Environment.production:
        baseUrl = Env.apiProdBaseUrl;
        environmentName = "PROD";
        break;
    }
  }
}
