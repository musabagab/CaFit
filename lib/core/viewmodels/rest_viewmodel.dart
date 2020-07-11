import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

import '../../locator.dart';

class RestViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final countDownTexts = ["5", "4", "3", "2", "1"];
  void goBack() {
    _navigationService.goBack();
  }
}
