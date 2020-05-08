import 'package:provider_architecture/core/models/workout_category.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

class MenuModel extends BaseModel {
  List<WorkoutCategory> workoutCategories = [
    WorkoutCategory(
        "Classic",
        "Scientifically proven ways to lose weight and improve health",
        "https://cdn9.dissolve.com/p/D187_254_013/D187_254_013_1200.jpg"),
    WorkoutCategory("Classic", "Proven to assits weight lose",
        "https://cdn9.dissolve.com/p/D187_254_013/D187_254_013_1200.jpg"),
    WorkoutCategory("Classic", "Proven to assits weight lose",
        "https://cdn9.dissolve.com/p/D187_254_013/D187_254_013_1200.jpg")
  ];
}
