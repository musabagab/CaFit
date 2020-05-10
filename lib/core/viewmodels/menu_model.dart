import 'package:provider_architecture/core/models/workout_category.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart';

class MenuModel extends BaseModel {
  List<WorkoutCategory> workoutCategories = [
    WorkoutCategory(
        "Full body workout",
        "Scientifically proven to assist weight loss and improve cardiovascular function.",
        "lib/assets/images/fullbody.jpg"),
    WorkoutCategory(
        "Leg workout",
        "Want slim and toned legs? Strengthen and tighten your lower body now!",
        "lib/assets/images/legs.jpg"),
    WorkoutCategory(
        "Arm workout",
        "Several minutes a day to have nice and toned arms in no time!",
        "lib/assets/images/arm.jpg")
  ];

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToInstructions() {
    _navigationService.navigateTo(Router.INSTRUCTIONS);
  }
}
