import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/shared/constants.dart';

class ExericesService {
  final List<Exercise> fullBodyList = [
    Exercise("PUSH-UPS", EXERCISE_DURAION, "lib/assets/exercises/pushups.png",
        "description"),
    Exercise("PLANK", EXERCISE_DURAION, "lib/assets/exercises/plank.png",
        "description"),
    Exercise("SITUPS", EXERCISE_DURAION, "lib/assets/exercises/situps.png",
        "description"),
    Exercise("JUMPING JACKS", EXERCISE_DURAION,
        "lib/assets/exercises/jumping_jacks.png", "description"),
    Exercise("BURPEES", EXERCISE_DURAION, "lib/assets/exercises/burpees.png",
        "description"),
  ];

  final List<Exercise> armList = [
    Exercise("SIDE PLANK", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("PUSH-UP", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("PUNCHES", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("ARM CIRCULES", EXERCISE_DURAION, "assetPath", "description"),
    Exercise("ARM RAISE", EXERCISE_DURAION, "assetPath", "description"),
  ];

  final List<Exercise> legList = [
    Exercise("HIGH KNEES", EXERCISE_DURAION,
        "lib/assets/exercises/high_knees.png", "description"),
    Exercise("BURPREES", EXERCISE_DURAION, "lib/assets/exercises/burpees.png",
        "description"),
    Exercise("SQUAT", EXERCISE_DURAION, "lib/assets/exercises/squat.png",
        "description"),
    Exercise("CLAF RAISE", EXERCISE_DURAION,
        "lib/assets/exercises/calf_raise.png", "description"),
    Exercise("SPLIT SQUAT", EXERCISE_DURAION,
        "lib/assets/exercises/split_squat.png", "description"),
  ];

  List<Exercise> getExercisesList(String selectedExerciseCategory) {
    if (selectedExerciseCategory == ARM_WORKOUT) {
      return List.of(armList);
    } else if (selectedExerciseCategory == LEG_WORKOUT) {
      return List.of(legList);
    } else {
      return List.of(fullBodyList);
    }
  }
}
