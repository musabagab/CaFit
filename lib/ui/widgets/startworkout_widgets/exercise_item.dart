import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';

class ExerciseItem extends StatelessWidget {
  final Exercise exercise;
  ExerciseItem(this.exercise);

  @override
  Widget build(BuildContext context) {
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
}
