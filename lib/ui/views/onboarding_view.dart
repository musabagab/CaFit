import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider_architecture/core/viewmodels/onboarding_model.dart';
import 'package:provider_architecture/ui/router.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart' as prefix0;
import 'package:provider_architecture/ui/shared/text_styles.dart';

import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/views/home_view.dart';
import 'package:provider_architecture/ui/widgets/onboarding_title.dart';

import '../shared/app_colors.dart';

class OnBoardingView extends StatelessWidget {
  final String runningWomanSVG = 'lib/assets/images/running_woman.png';
  final String weightWomanSVG = 'lib/assets/images/weight_woman.png';
  final String manWithWoman = 'lib/assets/images/manwithwoman.png';

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: IntroductionScreen(
              showNextButton: false,
              dotsDecorator: DotsDecorator(
                activeColor: prefix0.primaryColor.withOpacity(.9),
                color: primaryColor.withOpacity(.3),
              ),
              globalBackgroundColor: backgroundColor,
              pages: getPages(),
              onDone: () {
                model.start();
                Navigator.pushNamed(context, Router.HOME);
              },
              done: Text("Start")),
        ),
      ),
    );
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        titleWidget: OnBoardingTitle("Have a good health"),
        footer: Text(
          "Being healthy is all, no health is nothing.\nSo why do not we",
          textAlign: TextAlign.center,
          style: subHeaderStyle,
        ),
        bodyWidget: renderPage(runningWomanSVG),
      ),
      PageViewModel(
        titleWidget: OnBoardingTitle("Be stronger"),
        footer: Text(
          "Take 30 minutes of bodybuilding every day\nto get physically fit and healthy.",
          textAlign: TextAlign.center,
          style: subHeaderStyle,
        ),
        bodyWidget: renderPage(weightWomanSVG),
      ),
      PageViewModel(
        titleWidget: OnBoardingTitle("Have a nice body"),
        footer: Text(
          "Bad body shape, poor sleep, lack of strength,\nweight gain, weak bones, easily traumatized\nbody, depressed, stressed, poor metabolism,\npoor resistance",
          textAlign: TextAlign.center,
          style: subHeaderStyle,
        ),
        bodyWidget: renderPage(manWithWoman),
      ),
    ];
  }

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
