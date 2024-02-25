import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'LIVE_BASE_URL', obfuscate: true)
  static final String liveBaseUrl = _Env.liveBaseUrl;
  @EnviedField(varName: 'STAGING_BASE_URL', obfuscate: true)
  static final String stagingBaseUrl = _Env.stagingBaseUrl;
  @EnviedField(varName: 'LOAN_STAGING_BASE_URL', obfuscate: true)
  static final String loanStagingBaseUrl = _Env.loanStagingBaseUrl;
  @EnviedField(varName: 'PRODUCTION')
  static const bool production = _Env.production;
}