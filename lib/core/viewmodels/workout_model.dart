import 'dart:async';
import 'dart:io';

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
  bool takeRest = false;

  void startTimer() {
    isStarted = true;

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
          takeRest = true;
          notifyListeners();
        }
      }
    });
  }

  resetTimer() {
    currentValue = 0;
    notifyListeners();

    if (timer != null) {
      timer.cancel();
    }
    startTimer();
  }

  initExerciseList(receviedExercises) {
    exercisesList = receviedExercises;
  }

  void navigateToExerciseCompleted() {
    _navigationService.navigateAndReplace(Router.EXERCISE_COMPLETED);
  }

  void endRest() {
    takeRest = false;
    notifyListeners();
    resetTimer();
  }
}
