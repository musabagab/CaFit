import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/rest_viewmodel.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class RestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RestViewModel>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: primaryColor,
              body: WillPopScope(
                onWillPop: () {
                  return Future.value(true);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    UIHelper.verticalSpaceLarge(),
                    Text(
                      "Take a rest!",
                      style: takeRestTextStyle,
                    ),
                    FadeAnimatedTextKit(
                        totalRepeatCount: 1,
                        pause: Duration(milliseconds: 1000),
                        text: model.countDownTexts,
                        onFinished: model.goBack,
                        textStyle: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true),
                  ],
                ),
              ),
            ));
  }
}
