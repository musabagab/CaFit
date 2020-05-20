import 'package:provider_architecture/core/models/exercise.dart';

class ExericesService {
  final List<Exercise> fullBodyList = [
    Exercise(name: "PUSH", assetPath: "assetPath", description: "description"),
    Exercise(name: "PLANK", assetPath: "assetPath", description: "description"),
    Exercise(
        name: "SITUPS", assetPath: "assetPath", description: "description"),
    Exercise(
        name: "JUMPING JACKS",
        assetPath: "assetPath",
        description: "description"),
    Exercise(
        name: "BURPEES", assetPath: "assetPath", description: "description"),
  ];

  List<Exercise> getExercisesList(String selectedExerciseCategory) {
    return fullBodyList;
  }
}
