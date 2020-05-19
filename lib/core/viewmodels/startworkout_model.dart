import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/services/exercies_service.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class StartWorkoutModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ExericesService _exerciseService = locator<ExericesService>();
  List<Exercise> exerciesList = List();
  bool isSwtched = false;

  getExercisesList(String selectedCategory) {
    exerciesList = _exerciseService.getExercisesList(selectedCategory);
  }

  randomExercies(String selectedCategory) {
    exerciesList.shuffle();
  }

  void statusChanged(String categoryName) {
    if (isSwtched) {
      randomExercies(categoryName);
    } else {
      getExercisesList(categoryName);
    }
    notifyListeners();
  }
}
