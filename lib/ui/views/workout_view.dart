import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/viewmodels/workout_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/views/exercise_completed_view.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';

class WorkoutView extends StatefulWidget {
  final String categoryName;
  final List<Exercise> exercisesList;
  WorkoutView(this.categoryName, this.exercisesList);

  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  int currentValue = 0;
  Timer t;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<WorkoutModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          title: AppBarTitle(widget.categoryName),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              widget.exercisesList.elementAt(selectedIndex).name,
              style: workoutNameWorkoutViewTextStyle,
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                startTimer();
              },
            ),
            Stack(
              children: <Widget>[
                FAProgressBar(
                  currentValue: currentValue,
                  maxValue: 30,
                  borderRadius: 1,
                  size: 130,
                  progressColor: primaryColor,
                  backgroundColor: primaryColor.withOpacity(.4),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    (30 - currentValue).toString() + 's',
                    style: timerworkoutViewTextStyle,
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  void startTimer() {
    currentValue = 0;
    if (t != null) {
      t.cancel();
    }
    t = new Timer.periodic(new Duration(seconds: 1), (time) {
      setState(() {
        currentValue++;
      });

      if (currentValue == 30) {
        currentValue = 0;
        selectedIndex++;
        if (selectedIndex >= widget.exercisesList.length) {
          print("Exercies Ended!");
          selectedIndex = 0;
          t.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ExerciseCompleted()),
          );
        } else {
          // NEXT EXERCISE
          //TODO: create delay here (rest)
          startTimer();
        }
      }
    });
  }
}
