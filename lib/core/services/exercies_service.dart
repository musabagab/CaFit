import 'package:provider_architecture/core/models/exercise.dart';

class ExericesService {
  List<Exercise> getExercisesList(String selectedExerciseCategory) {
    //TODO change this function to return specfic category exercises
    return [
      Exercise("PUSH-UPS", "30 s", "assetPath", "description"),
      Exercise("PLANK", "30 s", "assetPath", "description")
    ];
  }
}
