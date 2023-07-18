import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/names.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:flutter_application_1/screens/homeScreen/home_screen.dart';
import 'package:flutter_application_1/screens/splash.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    Widget page;
    int transitionDuration = 300;
    int reverseTransitionDuration = 300;

    switch (settings.name) {
      case (Routes.login):
        page = const LoginPage(
          title: 'Fifo',
        );
        break;

      case (Routes.dashboard):
        page = const HomeScreen();
        break;
      default:
        page = const SplashScreen();
        break;
    }

    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: transitionDuration),
      reverseTransitionDuration: Duration(
        milliseconds: reverseTransitionDuration,
      ),
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
    );
  }
}
