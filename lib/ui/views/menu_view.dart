import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/menu_model.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuModel>(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Text(
            "Hello menu is here",
            style: headerStyle,
          ),
        ),
      ),
    );
  }
}
