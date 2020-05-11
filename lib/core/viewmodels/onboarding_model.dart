import 'package:provider_architecture/core/services/localstorage_service.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart';

class OnboardingModel extends BaseModel {
  var storageService = locator<LocalStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void start() {
    storageService.hasLoggedIn = true;
    navigateToHome();
  }

  void navigateToHome() {
    _navigationService.navigateAndReplace(Router.MENU);
  }
}
