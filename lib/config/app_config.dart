import 'package:flutter/foundation.dart' as Foundation;

class AppConfig {
  String? appName;

  bool showDebugBanner = true;

  bool isDebugMode = Foundation.kDebugMode;

  bool isReleaseMode = Foundation.kReleaseMode;

  bool isWeb = Foundation.kIsWeb;

  bool isProfileMode = Foundation.kProfileMode;

  // isProduction = bool.fromEnvironment("dart.vm.product");
  initalize() {
    if (isReleaseMode) {
      appName = "Captain App";
      showDebugBanner = false;
    } else {
      appName = "Captain App Debug";
    }
  }
}

final AppConfig appConfig = AppConfig();
