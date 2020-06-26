import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';

class GoButton extends StatelessWidget {
  final String selectedCategory;
  final Function navigateToWorkout;
  GoButton(this.navigateToWorkout, this.selectedCategory);
  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        color: primaryColor,
        onPressed: () {
          navigateToWorkout(selectedCategory);
        },
      ),
    );
  }
}
