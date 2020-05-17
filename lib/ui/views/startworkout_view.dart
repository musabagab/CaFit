import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/viewmodels/startworkout_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';

class StartWorkoutView extends StatelessWidget {
  final String categoryName;
  StartWorkoutView(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return BaseView<StartWorkoutModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          title: AppBarTitle(categoryName),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: model.getExercisesList(categoryName).length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildExercisesList(model
                          .getExercisesList(categoryName)
                          .elementAt(index));
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
        child: Text(
          "GO >",
          style: TextStyle(color: Colors.white),
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
              style: exerciseTitleStyle,
            ),
            Text(
              exercise.duration,
              style: exerciseTitleStyle,
            ),
          ],
        ),
        Divider(
          thickness: .5,
        )
      ],
    );
  }
}
