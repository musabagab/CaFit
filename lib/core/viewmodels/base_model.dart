// base_model.dart
import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
