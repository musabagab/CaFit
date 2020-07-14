import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/services/exercies_service.dart';
import 'package:provider_architecture/core/services/navigation_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:url_launcher/url_launcher.dart';

class InstructionsModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ExericesService _exericesService = locator<ExericesService>();
  String exerciseCategory;
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
    // set the category
    exerciseCategory = categoryName;

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

  List<Exercise> getExercises(String exerciseCategory) {
    return _exericesService.getExercisesList(exerciseCategory);
  }

  Future launchInBrowser(String videoUrl) async {
    if (await canLaunch(videoUrl)) {
      await launch(
        videoUrl,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $videoUrl';
    }
  }
}
