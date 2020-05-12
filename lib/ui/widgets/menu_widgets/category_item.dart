import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/workout_category.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';

class CategoryItem extends StatelessWidget {
  final WorkoutCategory category;
  final Function navigateToInstructions;

  CategoryItem(this.category, this.navigateToInstructions);

  @override
  Widget build(BuildContext context) {
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
                Image.asset(
                  category.photoUrl,
                  fit: BoxFit.fitWidth,
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
                    onPressed: () {
                      navigateToInstructions(category.name);
                    },
                  ),
                  FlatButton(
                    child: const Text(
                      'START',
                      style: categoryButtonTextStyle,
                    ),
                    onPressed: () {},
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
