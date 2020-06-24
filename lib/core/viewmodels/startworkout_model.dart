import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/services/exercies_service.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart';

class StartWorkoutModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ExericesService _exerciseService = locator<ExericesService>();
  List<Exercise> exerciesList = List();
  bool isRandom = false;

  getExercisesList(String selectedCategory) {
    exerciesList = _exerciseService.getExercisesList(selectedCategory).toList();
  }

  randomExercies() {
    exerciesList.shuffle();
  }

  void statusChanged(String categoryName, bool swtichValue) {
    isRandom = swtichValue;

    if (isRandom) {
      randomExercies();
    } else {
      getExercisesList(categoryName);
    }
    notifyListeners();
  }

  navigateToWorkout(String selectedCategory) {
    List<dynamic> args = [selectedCategory, exerciesList];
    _navigationService.navigateAndReplace(Router.WORKOUT, arguments: args);
  }
}
