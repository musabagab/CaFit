import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/instructions_view.dart';
import 'package:provider_architecture/ui/views/menu_view.dart';
import 'package:provider_architecture/ui/views/onboarding_view.dart';
import 'package:provider_architecture/ui/views/startworkout_view.dart';
import 'package:provider_architecture/ui/views/workout_view.dart';

class Router {
  static const ONBOARDING = "onboarding";
  static const MENU = "home";
  static const START = "start";
  static const INSTRUCTIONS = "instructions";
  static const STARTWORKOUT = "startworkout";
  static const WORKOUT = "workoutt";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ONBOARDING:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case MENU:
        return MaterialPageRoute(builder: (_) => MenuView());
      case INSTRUCTIONS:
        var categoryName = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => InstructionsView(categoryName));
      case STARTWORKOUT:
        var categoryName = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => StartWorkoutView(categoryName));
      case WORKOUT:
        var categoryName = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => WorkoutView(categoryName));
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
