import 'package:flutter/material.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';

import 'core/services/localstorage_service.dart';
import 'core/services/navigation_service.dart';

Future<void> main() async {
  try {
    await setupLocator();
    runApp(MyApp());
  } catch (error) {
    print('Locator setup has failed!');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carfit',
      theme: ThemeData(primaryColor: primaryColor, fontFamily: 'Quicksand'),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: _getStartupScreen(),
      onGenerateRoute: Router.generateRoute,
    );
  }

  String _getStartupScreen() {
    return Router.ONBOARDING;
    var localStorageService = locator<LocalStorageService>();

    if (!localStorageService.hasLoggedIn) {
      return Router.ONBOARDING;
    } else {
      return Router.HOME;
    }
  }
}
