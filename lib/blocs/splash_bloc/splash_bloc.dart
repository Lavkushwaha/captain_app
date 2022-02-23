import 'package:captain_app/blocs/base_bloc.dart';
import 'package:captain_app/routes.dart';
import 'package:captain_app/shared/services/navigation_service.dart';

class SplashBloc extends Bloc {
  _moveToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      appNavigationService.pushReplacementNamed(Routes.home);
    });
  }

  Function get moveToHome => _moveToHome;
  @override
  void dispose() {}
}

final splashBloc = SplashBloc();
