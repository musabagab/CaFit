import 'package:confetti/confetti.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class ExerciseCompletedViewModel extends BaseModel {
  ConfettiController controllerTopCenter;
  final NavigationService _navigationService = locator<NavigationService>();

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));

    controllerTopCenter.play();
  }

  void goBackToHome() {
    _navigationService.navigateToHome();
  }
}
