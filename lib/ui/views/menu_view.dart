import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/workout_category.dart';
import 'package:provider_architecture/core/viewmodels/menu_model.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Workout Categories",
            style: appBarTitleStyle,
          )),
        ),
        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            itemCount: model.workoutCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCategoryItem(model.workoutCategories.elementAt(index),
                  model.navigateToInstructions);
            },
          ),
        ),
      ),
    );
  }

  Container buildCategoryItem(
      WorkoutCategory category, void Function() navigateToInstructions) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  category.photoUrl,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    category.name,
                    style: categoryTitleStyle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.desc,
                style: categoryDescStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: const Text(
                      'INSTRUCTIONS',
                      style: categoryButtonTextStyle,
                    ),
                    onPressed: navigateToInstructions,
                  ),
                  FlatButton(
                    child: const Text(
                      'START',
                      style: categoryButtonTextStyle,
                    ),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
