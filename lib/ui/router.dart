import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/onboarding_view.dart';

import 'views/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'onboarding':
        return MaterialPageRoute(builder: (_) => OnBoardingView());
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
