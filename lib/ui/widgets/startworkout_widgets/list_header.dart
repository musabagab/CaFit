import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/startworkout_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/widgets/startworkout_widgets/exercise_item.dart';

class ListHeader extends StatelessWidget {
  final StartWorkoutModel model;
  final String selectedCategory;
  ListHeader(this.model, this.selectedCategory);
  @override
  Widget build(BuildContext context) {
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
                    value: model.isRandom,
                    onChanged: (value) {
                      model.statusChanged(selectedCategory, value);
                    },
                    activeTrackColor: primaryLight,
                    activeColor: primaryColorDark,
                  )
                ],
              ),
              Text('Time', style: randdomAndTimeStyle)
            ],
          ),
          Divider(thickness: .5),
          ExerciseItem(model.exerciesList.elementAt(0))
        ],
      ),
    );
  }
}
