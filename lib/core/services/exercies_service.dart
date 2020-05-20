import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/shared/constants.dart';

class ExericesService {
  final List<Exercise> fullBodyList = [
    Exercise("PUSH-UPS", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("PLANK", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("SITUPS", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("JUMPING JACKS", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("BURPEES", EXERCISE_DURAION, "assetPath", "description"),
  ];

  List<Exercise> getExercisesList(String selectedExerciseCategory) {
    return fullBodyList;
  }
}
