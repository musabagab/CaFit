import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/viewmodels/startworkout_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';

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
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: model.exerciesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) return buildListHeader(model);

                      return buildExercisesList(
                          model.exerciesList.elementAt(index));
                    },
                  ),
                ),
              ),
              buildGoButton()
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildGoButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: RaisedButton(
        elevation: 8,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Text(
            "GO >",
            style: TextStyle(color: Colors.white),
          ),
        ),
        color: primaryColor,
        onPressed: () {},
      ),
    );
  }

  Widget buildExercisesList(Exercise exercise) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              exercise.name,
              style: exerciseItemTitleStyle,
            ),
            Text(
              exercise.duration,
              style: exerciseItemTitleStyle,
            ),
          ],
        ),
        Divider(
          thickness: .5,
        )
      ],
    );
  }

  Widget buildListHeader(StartWorkoutModel model) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Exercises',
            style: exerciseTitleStyle,
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Text(
                    'Random',
                    style: randdomAndTimeStyle,
                  ),
                  Switch(
                    value: model.isSwtched,
                    onChanged: (value) {
                      model.isSwtched = value;
                      model.statusChanged(widget.categoryName);
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  )
                ],
              ),
              Text('Time', style: randdomAndTimeStyle)
            ],
          ),
          Divider(thickness: .5),
          buildExercisesList(model.exerciesList.elementAt(0)),
        ],
      ),
    );
  }
}
