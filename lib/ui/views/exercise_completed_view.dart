import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:provider_architecture/core/viewmodels/exercise_completed_viewmodel.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';

class ExerciseCompleted extends StatelessWidget {
  const ExerciseCompleted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExerciseCompletedViewModel>(
        onModelReady: (model) => model.initController(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: Container(),
                title: AppBarTitle("Exercise Completed!"),
              ),
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    //TOP CENTER - shoot down
                    buildConfettiWidget(model.controllerTopCenter, pi / 1),
                    buildConfettiWidget(model.controllerTopCenter, pi / 4),

                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          UIHelper.verticalSpaceLarge(),
                          Image.asset(
                            "lib/assets/images/trophy.png",
                            width: 200,
                            height: 200,
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Text(
                            "Congratulations!",
                            style: congratsTextStyle,
                          ),
                        ],
                      ),
                    ),
                    buildBackToHome(model.goBackToHome)
                  ],
                ),
              ),
            ));
  }

  Align buildBackToHome(goBackToHome) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: RaisedButton(
          onPressed: goBackToHome,
          color: primaryColor,
          textColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Back to Home",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: controller,
        blastDirection: blastDirection,
        maxBlastForce: 10, // set a lower max blast force
        minBlastForce: 5, // set a lower min blast force
        emissionFrequency: 1,
        numberOfParticles: 5, // a lot of particles at once
        gravity: 1,
      ),
    );
  }
}
