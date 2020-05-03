import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/home_view.dart';
import 'package:provider_architecture/ui/views/onboarding_view.dart';

class Router {
  static const String ONBOARDING = "onboarding";
  static const String HOME = "home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ONBOARDING:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
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
