import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'API_DEV_BASE_URL')
  static final String apiDevBaseUrl = _Env.apiDevBaseUrl;

  @EnviedField(varName: 'API_PROD_BASE_URL')
  static String apiProdBaseUrl = _Env.apiProdBaseUrl;
}
