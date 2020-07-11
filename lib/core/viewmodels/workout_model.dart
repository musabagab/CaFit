import 'dart:async';

import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/services/audio_service.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/ui/router.dart';

import '../../locator.dart';

class WorkoutModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AudioService _audioService = locator<AudioService>();
  List<Exercise> exercisesList;

  int currentValue = 0;
  Timer timer;
  int selectedIndex = 0;
  bool isStarted = false;

  void startTimer() {
    isStarted = true;

    _audioService.playStartAudio();

    timer = new Timer.periodic(new Duration(seconds: 1), (time) {
      currentValue++;
      notifyListeners();

      if (currentValue == 30) {
        currentValue = 0;
        selectedIndex++;
        if (selectedIndex >= exercisesList.length) {
          print("Exercies Ended!");
          _audioService.playdoneAudio();

          selectedIndex = 0;
          timer.cancel();
          navigateToExerciseCompleted();
        } else {
          // NEXT EXERCISE
          _audioService.playTakeARest();

          _navigateToRestView();
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

  void _navigateToRestView() async {
    await _navigationService.navigateTo(Router.REST);
    resetTimer();
  }
}
