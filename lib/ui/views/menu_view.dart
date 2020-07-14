import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/menu_model.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/menu_widgets/category_item.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
              return CategoryItem(model.workoutCategories.elementAt(index),
                  model.navigateToInstructions, model.navigateToStartworkout);
            },
          ),
        ),
      ),
    );
  }
}
