import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/instructions_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart' as prefix0;
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class InstructionsView extends StatefulWidget {
  final String categoryName;
  InstructionsView(this.categoryName);

  @override
  _InstructionsViewState createState() => _InstructionsViewState();
}

class _InstructionsViewState extends State<InstructionsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<InstructionsModel>(
      onModelReady: (model) =>
          model.prepareController(this, widget.categoryName),
      builder: (context, model, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: WillPopScope(
            onWillPop: () {
              model.navigateBack();
              return new Future(() => false);
            },
            child: Scaffold(
              appBar: AppBar(
                leading: BackButton(),
                title: Text(
                  'Instructions',
                  style: appBarTitleStyle,
                ),
                backgroundColor: prefix0.primaryColor,
                bottom: TabBar(
                  controller: model.getController(),
                  indicatorColor: Colors.black,
                  onTap: (tabedIndex) {
                    model.getController().animateTo(tabedIndex);
                  },
                  tabs: [
                    Tab(
                      text: "Full Body",
                    ),
                    Tab(
                      text: "Arm",
                    ),
                    Tab(
                      text: "Legs",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
