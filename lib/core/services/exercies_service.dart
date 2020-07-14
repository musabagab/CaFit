import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/shared/constants.dart';
import 'package:provider_architecture/core/shared/instructions_text.dart';

class ExericesService {
  static String rootPath = "lib/assets/exercises/";

  final List<Exercise> fullBodyList = [
    Exercise("JUMPING JACKS", EXERCISE_DURAION, rootPath + "jumping_jacks.png",
        InstructionText.JUMPING_JACKS_INSTRUCTIONS),
    Exercise("PUSH-UPS", EXERCISE_DURAION, rootPath + "pushups.png",
        InstructionText.PUSHUP_INSTRUCTIONS),
    Exercise("BURPEES", EXERCISE_DURAION, rootPath + "burpees.png",
        InstructionText.BURPEES_INSTRUCTIONS),
    Exercise("PLANK", EXERCISE_DURAION, rootPath + "plank.png",
        InstructionText.PLANK_INSTRUCTIONS),
    Exercise("REVERSE CRUNCHES", EXERCISE_DURAION, rootPath + "situps.png",
        InstructionText.REVSERSE_CRUNCHES_INSTRUCTIONS),
  ];

  final List<Exercise> armList = [
    Exercise("SIDE PLANK LEFT", EXERCISE_DURAION,
        rootPath + "side_plank_left.png", "description"),
    Exercise("SIDE PLANK RIGHT", EXERCISE_DURAION,
        rootPath + "side_plank_right.png", "description"),
    Exercise(
        "PUSH-UP", EXERCISE_DURAION, rootPath + "pushups.png", "description"),
    Exercise(
        "PUNCHES", EXERCISE_DURAION, rootPath + "puches.png", "description"),
    Exercise("ARM CIRCULES", EXERCISE_DURAION, rootPath + "arm_circles.png",
        "description"),
    Exercise("ARM RAISE", EXERCISE_DURAION, rootPath + "side_arm_raise.png",
        "description"),
  ];

  final List<Exercise> legList = [
    Exercise("HIGH KNEES", EXERCISE_DURAION, rootPath + "high_knees.png",
        "description"),
    Exercise(
        "BURPREES", EXERCISE_DURAION, rootPath + "burpees.png", "description"),
    Exercise("SQUAT", EXERCISE_DURAION, rootPath + "squat.png", "description"),
    Exercise("CLAF RAISE", EXERCISE_DURAION, rootPath + "calf_raise.png",
        "description"),
    Exercise("SPLIT SQUAT", EXERCISE_DURAION, rootPath + "split_squat.png",
        "description"),
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
