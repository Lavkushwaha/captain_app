import 'package:captain_app/config/app_config.dart';
import 'package:captain_app/routes.dart';
import 'package:captain_app/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: appNavigationService.myNavigatorKey,
      title: appConfig.appName ?? "Captain App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Mulish-Regular',
      ),
      debugShowCheckedModeBanner: appConfig.isDebugMode,
      initialRoute: Routes.splash,
      onGenerateRoute: Routes.getGeneratedRoute,
      // routes: Routes.getGeneratedRoute,
    );
  }
}
