import 'package:flutter/material.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';

Future<void> main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carfit',
      theme: ThemeData(primaryColor: primaryColor),
      initialRoute: 'onboarding',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
