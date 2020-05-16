import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String title;

  AppBarTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: appBarTitleStyle,
    );
  }
}
