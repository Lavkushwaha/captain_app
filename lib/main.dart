import 'dart:async';
import 'dart:io';

import 'package:captain_app/app.dart';
import 'package:captain_app/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//INITIALIZE CONFIG
  appConfig.initalize();

//FLUTTER ERROR DEBUG PRINTS ADDED
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (appConfig.isDebugMode) {
      debugPrint("FLUTTER CONTEXT : ${details.context}");
      debugPrint("FLUTTER ERROR : ${details.exceptionAsString()}");
      debugPrint("FLUTTER STACKTRACE : ${details.stack}");
    }
    if (appConfig.isReleaseMode) {
      exit(1);
    }
  };

//ORIENTATION SET TO PORTRAIT
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runZonedGuarded(
      () async {
        const Widget app = MyApp();
        runApp(app);
      },
      (dynamic error, dynamic stack) {
        //LOG ERRORS OR SEND ERROR TO SERVER
        debugPrint("FLUTTER ERROR : ${error.toString()}");
      },
    );
  });

  // runApp(const MyApp());
}
