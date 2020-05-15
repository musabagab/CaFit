import 'package:provider_architecture/core/services/localstorage_service.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart';

class OnboardingModel extends BaseModel {
  final String runningWoman = 'lib/assets/images/running_woman.png';
  final String weightWoman = 'lib/assets/images/weight_woman.png';
  final String manWithWoman = 'lib/assets/images/manwithwoman.png';
  var storageService = locator<LocalStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void start() {
    storageService.hasLoggedIn = true;
    navigateToMenu();
  }

  void navigateToMenu() {
    _navigationService.navigateAndReplace(Router.MENU);
  }
}
