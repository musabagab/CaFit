import 'package:provider_architecture/core/models/exercise.dart';

class ExericesService {
  List<Exercise> getExercisesList(String selectedExerciseCategory) {
    return [
      Exercise("Push apps", "30s", "assetPath", "description"),
      Exercise("Plank", "30s", "assetPath", "description")
    ];
  }
}
