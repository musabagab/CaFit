import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class InstructionsModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.goBack();
  }
}
