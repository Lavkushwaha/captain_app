import 'package:captain_app/modules/root.dart';
import 'package:captain_app/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = 'home';

  static const String categories = 'categories';

  static const String cart = 'cart';

  static const String user = 'user';

  static const String splash = 'splash';

  static Route<dynamic>? getGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          settings: const RouteSettings(name: splash),
          builder: (_) => const SplashScreen(),
        );

      case home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: home),
          builder: (_) => const RootScreen(),
        );

      // case categories:
      //   return MaterialPageRoute(
      //     settings: const RouteSettings(name: categories),
      //     builder: (_) => const CategoriesScreen(),
      //   );

      // case cart:
      //   return MaterialPageRoute(
      //     settings: const RouteSettings(name: cart),
      //     builder: (_) => const CartScreen(),
      //   );

      // case user:
      //   return MaterialPageRoute(
      //     settings: const RouteSettings(name: user),
      //     builder: (_) => const UserScreen(),
      //   );

      default:
        return null;
    }
  }
}
