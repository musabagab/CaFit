import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/router.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndReplace(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToHome() {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(Router.MENU, (Route<dynamic> route) => false);
  }

  goBack() {
    navigatorKey.currentState.pop();
  }
}
