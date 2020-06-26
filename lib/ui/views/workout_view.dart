import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/viewmodels/workout_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';

class WorkoutView extends StatefulWidget {
  final String categoryName;
  final List<Exercise> exercisesList;

  WorkoutView(this.categoryName, this.exercisesList);
  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<WorkoutModel>(
      onModelReady: (model) => model.initExerciseList(widget.exercisesList),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UIHelper.verticalSpaceSmall(),
            Text(
              widget.exercisesList.elementAt(model.selectedIndex).name,
              style: workoutNameWorkoutViewTextStyle,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              model.exercisesList.elementAt(model.selectedIndex).assetPath,
              width: 250,
              height: 250,
            ),
            !model.isStarted
                ? RaisedButton(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    onPressed: model.startTimer,
                    color: primaryColor,
                    child: Text(
                      'Start',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  )
                : Container(),
            Stack(
              children: <Widget>[
                FAProgressBar(
                  currentValue: model.currentValue,
                  maxValue: 30,
                  borderRadius: 1,
                  size: 130,
                  progressColor: primaryColor,
                  backgroundColor: primaryColor.withOpacity(.4),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    (30 - model.currentValue).toString() + 's',
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
}
