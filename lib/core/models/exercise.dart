import 'package:provider_architecture/core/shared/constants.dart';

class Exercise {
  String name;
  String duration;
  String assetPath;
  String description;

  Exercise({name, duration = EXERCISE_DURAION, assetPath, description});
}
