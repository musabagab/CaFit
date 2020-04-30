import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider_architecture/core/viewmodels/onboarding_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart' as prefix0;

import 'package:provider_architecture/ui/views/base_view.dart';

import '../shared/app_colors.dart';

class OnBoardingView extends StatelessWidget {
  String s = "";
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: IntroductionScreen(
              showNextButton: true,
              dotsDecorator: DotsDecorator(
                activeColor: prefix0.primaryColor.withOpacity(.9),
                color: primaryColor.withOpacity(.3),
              ),
              globalBackgroundColor: backgroundColor,
              pages: model.getPages(),
              onDone: () {},
              done: Text("Done")),
        ),
      ),
    );
  }
}
