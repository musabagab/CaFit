import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/viewmodels/startworkout_model.dart';
import 'package:provider_architecture/core/viewmodels/workout_model.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';
import 'package:quiver/async.dart';

class WorkoutView extends StatefulWidget {
  final String categoryName;
  final List<Exercise> exercisesList;
  WorkoutView(this.categoryName, this.exercisesList);

  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  int _start = 10;
  int _current = 10;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<WorkoutModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          title: AppBarTitle(widget.categoryName),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  startTimer();
                },
                child: Text("start"),
              ),
              Text("$_current")
            ],
          ),
        ),
      ),
    );
  }
}
