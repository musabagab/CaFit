import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';

class OnBoardingTitle extends StatelessWidget {
  final String title;
  OnBoardingTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UIHelper.verticalSpaceMedium(),
        Text(
          title,
          style: headerStyle,
        ),
        UIHelper.verticalSpaceLarge()
      ],
    );
  }
}
