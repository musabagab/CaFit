import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/menu_view.dart';
import 'package:provider_architecture/ui/views/onboarding_view.dart';

class Router {
  static const ONBOARDING = "onboarding";
  static const MENU = "home";
  static const START = "start";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ONBOARDING:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case MENU:
        return MaterialPageRoute(builder: (_) => MenuView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
