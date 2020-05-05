import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/home_model.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Text(
            "Hello home is here",
            style: headerStyle,
          ),
        ),
      ),
    );
  }
}
