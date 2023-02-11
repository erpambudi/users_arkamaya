import 'build_config.dart';
import 'env_config.dart';

enum Environment { development, production }

void env(Environment environment) {
  const String prod = "https://reqres.in/api";

  const String dev = "https://reqres.in/api";

  EnvConfig config = environment == Environment.production
      ? EnvConfig(
          appName: "Users",
          baseUrl: prod,
          shouldCollectCrashLog: true,
        )
      : EnvConfig(
          appName: "Users Dev",
          baseUrl: dev,
          shouldCollectCrashLog: true,
        );

  BuildConfig.instantiate(envType: environment, envConfig: config);
}
