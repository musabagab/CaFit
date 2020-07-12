import 'package:flutter/material.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class InstructionsModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  List<String> categoryies = [
    "Full body workout",
    "Leg workout",
    "Arm workout"
  ];

  var _tabController;

  void navigateBack() {
    _navigationService.goBack();
  }

  prepareController(_instructionsViewState, categoryName) {
    _tabController =
        new TabController(vsync: _instructionsViewState, length: 3);

    _tabController.animateTo(categoryies.indexOf(categoryName));
  }

  getController() {
    return _tabController;
  }

  void goBack() {
    _navigationService.goBack();
  }
}
