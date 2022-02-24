import 'package:captain_app/blocs/address_bloc/address_bloc.dart';
import 'package:captain_app/blocs/cart_bloc/cart_bloc.dart';
import 'package:captain_app/blocs/home_bloc/home_bloc.dart';
import 'package:captain_app/blocs/splash_bloc/splash_bloc.dart';
import 'package:captain_app/config/app_config.dart';
import 'package:captain_app/routes.dart';
import 'package:captain_app/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

//DISPOSE FUNCTION ADDED FOR BLOCS
  @override
  void dispose() {
    homeBloc.dispose();
    cartBloc.dispose();
    addressBloc.dispose();
    splashBloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: appNavigationService.myNavigatorKey,
      title: appConfig.appName ?? "Captain App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Mulish-Regular',
      ),
      debugShowCheckedModeBanner: appConfig.showDebugBanner,
      initialRoute: Routes.splash,
      onGenerateRoute: Routes.getGeneratedRoute,
      // routes: Routes.getGeneratedRoute,
    );
  }
}
