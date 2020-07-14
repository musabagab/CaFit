import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/viewmodels/instructions_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';

class InstructionsList extends StatelessWidget {
  final List<Exercise> exerciseList;
  final InstructionsModel model;

  InstructionsList(this.exerciseList, this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: exerciseList
            .map((exercise) => Card(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              exercise.name,
                              style: instructionExerciseTitleStyle,
                            ),
                            InkWell(
                              onTap: () async {
                                await model
                                    .launchInBrowser(exercise.youtubeURL);
                              },
                              child: Icon(
                                Icons.videocam,
                                size: 30,
                                color: primaryColor,
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          exercise.assetPath,
                          width: 100,
                          height: 100,
                        ),
                        Expanded(
                          child: Text(
                            exercise.description,
                            textAlign: TextAlign.justify,
                            style: instructionExerciseDescStyle,
                          ),
                        )
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                  ),
                ))
            .toList());
  }
}
