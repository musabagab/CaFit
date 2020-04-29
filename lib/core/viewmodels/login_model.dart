import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

import '../../locator.dart';

class LoginModel extends BaseModel {
  // inject the auth dependency
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    // not a number
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
