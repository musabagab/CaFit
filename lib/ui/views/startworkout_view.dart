import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/startworkout_model.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class StartWorkoutView extends StatelessWidget {
  final String categoryName;
  StartWorkoutView(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return BaseView<StartWorkoutModel>(
      builder: (context, model, child) => Scaffold(
        body: Text('Start Workout view'),
      ),
    );
  }
}
