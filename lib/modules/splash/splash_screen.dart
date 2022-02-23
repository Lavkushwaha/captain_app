import 'package:captain_app/blocs/splash_bloc/splash_bloc.dart';
import 'package:captain_app/utils/assets.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashBloc.moveToHome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Stack(
            children: const [
              FlareActor(Assets.loadingAnimation,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  isPaused: false,
                  animation: "Background Loop"),
              Center(
                child: Text(
                  "Captain App",
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: "Mulish-Bold",
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
