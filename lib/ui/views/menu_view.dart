import 'package:flutter/material.dart';
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
            itemCount: model.workoutCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Image.network(
                        model.workoutCategories.elementAt(index).photoUrl)
                  ],
                )),
              );
            },
          ),
        ),
      ),
    );
  }
}
