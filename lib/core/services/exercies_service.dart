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

  final List<Exercise> armList = [
    Exercise("SIDE PLANK", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("PUSH-UP", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("PUNCHES", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("ARM CIRCULES", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("ARM RAISE", EXERCISE_DURAION, "assetPath", "description"),
  ];

  final List<Exercise> legList = [
    Exercise("SIDE PLANK", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("PUSH-UP", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("PUNCHES", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("ARM CIRCULES", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("ARM RAISE", EXERCISE_DURAION, "assetPath", "description"),
  ];

  List<Exercise> getExercisesList(String selectedExerciseCategory) {
    if (selectedExerciseCategory == ARM_WORKOUT) {
      return armList;
    } else if (selectedExerciseCategory == LEG_WORKOUT) {
      return legList;
    } else {
      return fullBodyList;
    }
  }
}
