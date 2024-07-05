import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_app/features/auth/presentation/screens/login_screen.dart';
import 'package:test_app/features/auth/presentation/screens/register_screen.dart';
import 'package:test_app/features/splash/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashRoute:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.loginRoute:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.registerRoute:
        return PageTransition(
          child: const RegisterScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Our Application have an error now....'),),
        body: const Center(child: Text('Our Application have an error now....'),),
      ),
    );
  }
}

class RouteName {
  static const String splashRoute = 'splashRoute';
  static const String loginRoute = 'loginRoute';
  static const String registerRoute = 'registerRoute';
}