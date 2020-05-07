import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider_architecture/core/viewmodels/onboarding_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart' as prefix0;
import 'package:provider_architecture/ui/shared/text_styles.dart';

import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/onboarding_title.dart';

import '../shared/app_colors.dart';

class OnBoardingView extends StatelessWidget {
  final String runningWoman = 'lib/assets/images/running_woman.png';
  final String weightWoman = 'lib/assets/images/weight_woman.png';
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
            globalBackgroundColor: Colors.white,
            pages: getPages(),
            onDone: () {
              model.start();
            },
            done: FlatButton(
              onPressed: () {
                model.start();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red),
              ),
              color: prefix0.primaryColor,
              textColor: Colors.white,
              child: Text("Start"),
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel createPage(
      String title, String bodyText, String pageAssetName) {
    return PageViewModel(
      titleWidget: OnBoardingTitle(title),
      footer: Text(
        bodyText,
        textAlign: TextAlign.center,
        style: pageBodyStyle,
      ),
      bodyWidget: renderPage(pageAssetName),
    );
  }

  List<PageViewModel> getPages() {
    var list = [
      createPage(
        "Have a good health",
        "Being healthy is all, no health is nothing.\nSo why do not we",
        runningWoman,
      ),
      createPage(
        "Be stronger",
        "Take 30 minutes of bodybuilding every day\nto get physically fit and healthy.",
        weightWoman,
      ),
      createPage(
        "Have a nice body",
        "Bad body shape, poor sleep, lack of strength,\nweight gain, weak bones, easily traumatized\nbody, depressed, stressed, poor metabolism,\npoor resistance.",
        manWithWoman,
      ),
    ];
    return list;
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
              color: prefix0.primaryColor.withOpacity(.2),
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
