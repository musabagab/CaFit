import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/startworkout_model.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';
import 'package:provider_architecture/ui/widgets/startworkout_widgets/exercise_item.dart';
import 'package:provider_architecture/ui/widgets/startworkout_widgets/go_button.dart';
import 'package:provider_architecture/ui/widgets/startworkout_widgets/list_header.dart';

class StartWorkoutView extends StatefulWidget {
  final String categoryName;
  StartWorkoutView(this.categoryName);

  @override
  _StartWorkoutViewState createState() => _StartWorkoutViewState();
}

class _StartWorkoutViewState extends State<StartWorkoutView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<StartWorkoutModel>(
      onModelReady: (model) => model.getExercisesList(widget.categoryName),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          title: AppBarTitle(widget.categoryName),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  child: buildExercisesList(model),
                ),
              ),
              GoButton(model.navigateToWorkout, widget.categoryName),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildExercisesList(StartWorkoutModel model) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: model.exerciesList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return ListHeader(model, widget.categoryName);

        return ExerciseItem(model.exerciesList.elementAt(index));
      },
    );
  }
}
