import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/shared/constants.dart';
import 'package:provider_architecture/core/shared/instructions_text.dart';

class ExericesService {
  static String rootPath = "lib/assets/exercises/";

  final List<Exercise> fullBodyList = [
    Exercise(
        "JUMPING JACKS",
        EXERCISE_DURAION,
        rootPath + "jumping_jacks.png",
        InstructionText.JUMPING_JACKS_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=nGaXj3kkmrU"),
    Exercise(
        "PUSH-UPS",
        EXERCISE_DURAION,
        rootPath + "pushups.png",
        InstructionText.PUSHUP_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=i9sTjhN4Z3M"),
    Exercise(
        "BURPEES",
        EXERCISE_DURAION,
        rootPath + "burpees.png",
        InstructionText.BURPEES_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=mUYJqe_sJFE"),
    Exercise(
        "PLANK",
        EXERCISE_DURAION,
        rootPath + "plank.png",
        InstructionText.PLANK_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=gvHVdNVBu6s"),
    Exercise(
        "REVERSE CRUNCHES",
        EXERCISE_DURAION,
        rootPath + "situps.png",
        InstructionText.REVSERSE_CRUNCHES_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=s02jKx6VEoQ"),
  ];

  final List<Exercise> armList = [
    Exercise(
        "SIDE PLANK LEFT",
        EXERCISE_DURAION,
        rootPath + "side_plank_left.png",
        InstructionText.SIDE_PLANK_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=rCxF2nG9vQ0"),
    Exercise(
        "SIDE PLANK RIGHT",
        EXERCISE_DURAION,
        rootPath + "side_plank_right.png",
        InstructionText.SIDE_PLANK_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=rCxF2nG9vQ0"),
    Exercise(
        "PUSH-UP",
        EXERCISE_DURAION,
        rootPath + "pushups.png",
        InstructionText.PUSHUP_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=i9sTjhN4Z3M"),
    Exercise(
        "PUNCHES",
        EXERCISE_DURAION,
        rootPath + "puches.png",
        InstructionText.PUNCHES_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=udo0RzY-9Cg"),
    Exercise(
        "ARM CIRCULES",
        EXERCISE_DURAION,
        rootPath + "arm_circles.png",
        InstructionText.ARM_CIRCULES,
        "https://www.youtube.com/watch?v=pYawssLnWYA"),
    Exercise(
        "SIDE ARM RAISE",
        EXERCISE_DURAION,
        rootPath + "side_arm_raise.png",
        InstructionText.ARM_RAISE,
        "https://www.youtube.com/watch?v=eEcUyYlf8UI"),
  ];

  final List<Exercise> legList = [
    Exercise(
        "HIGH KNEES",
        EXERCISE_DURAION,
        rootPath + "high_knees.png",
        InstructionText.HIGH_KNEES_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=QPfOZ0e30xg"),
    Exercise(
        "BURPREES",
        EXERCISE_DURAION,
        rootPath + "burpees.png",
        InstructionText.BURPEES_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=mUYJqe_sJFE"),
    Exercise(
        "PILE SQUAT",
        EXERCISE_DURAION,
        rootPath + "squat.png",
        InstructionText.PLANK_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=w81uvhZKyc0"),
    Exercise(
        "CLAF RAISE",
        EXERCISE_DURAION,
        rootPath + "calf_raise.png",
        InstructionText.CALF_RAISE_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=ommnfVcLWxQ"),
    Exercise(
        "SPLIT SQUAT",
        EXERCISE_DURAION,
        rootPath + "split_squat.png",
        InstructionText.SPLIT_SQUAT_INSTRUCTIONS,
        "https://www.youtube.com/watch?v=VncTA2oFMuo"),
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
