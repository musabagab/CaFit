import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';

class OnboardingModel extends BaseModel {
  final String runningWomanSVG = 'lib/assets/images/running_woman.png';
  final String weightWomanSVG = 'lib/assets/images/weight_woman.png';

  Widget renderPage(String assetName) {
    final Widget svgImage = Image.asset(assetName);
    Widget myWidget = Center(
        child: Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: new BoxDecoration(
              color: primaryColor.withOpacity(.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Center(child: svgImage),
      ],
    ));
    return myWidget;
  }
}
