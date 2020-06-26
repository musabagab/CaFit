import 'dart:async';

import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/ui/router.dart';

import '../../locator.dart';

class WorkoutModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  List<Exercise> exercisesList;

  int currentValue = 0;
  Timer timer;
  int selectedIndex = 0;
  bool isStarted = false;

  void startTimer() {
    isStarted = true;
    currentValue = 0;
    if (timer != null) {
      timer.cancel();
    }
    timer = new Timer.periodic(new Duration(seconds: 1), (time) {
      currentValue++;
      notifyListeners();

      if (currentValue == 30) {
        currentValue = 0;
        selectedIndex++;
        if (selectedIndex >= exercisesList.length) {
          print("Exercies Ended!");
          selectedIndex = 0;
          timer.cancel();
          navigateToExerciseCompleted();
        } else {
          // NEXT EXERCISE
          //TODO: create delay here (rest)
          startTimer();
        }
      }
    });
  }

  initExerciseList(receviedExercises) {
    exercisesList = receviedExercises;
  }

  void navigateToExerciseCompleted() {
    _navigationService.navigateAndReplace(Router.EXERCISE_COMPLETED);
  }
}
