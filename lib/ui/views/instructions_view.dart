import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/exercise.dart';
import 'package:provider_architecture/core/shared/constants.dart';
import 'package:provider_architecture/core/viewmodels/instructions_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/instructions_view_widget/instructions_list.dart';
import 'package:provider_architecture/ui/widgets/shared/appbar_title.dart';

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
        theme: ThemeData(
            primaryColor: primaryColor,
            primaryColorDark: primaryColorDark,
            fontFamily: 'Quicksand',
            accentColor: primaryColor),
        home: DefaultTabController(
          length: model.categoryies.length,
          child: Scaffold(
            body: TabBarView(
              controller: model.getController(),
              children: buildTabViews(model),
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: model.goBack,
              ),
              title: AppBarTitle('Instructions'),
              backgroundColor: primaryColor,
              bottom: TabBar(
                controller: model.getController(),
                indicatorColor: Colors.black,
                onTap: (tabedIndex) {
                  model.getController().animateTo(tabedIndex);
                },
                tabs: buildTaps(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildTabViews(InstructionsModel model) {
    return [
      buildInstructionsList(FULL_BODY, model),
      buildInstructionsList(LEG_WORKOUT, model),
      buildInstructionsList(ARM_WORKOUT, model)
    ];
  }

  List<Widget> buildTaps() {
    return [
      Tab(
        text: "FULL BODY",
      ),
      Tab(
        text: "LEG",
      ),
      Tab(
        text: "ARM",
      ),
    ];
  }

  buildInstructionsList(String exerciseCategory, InstructionsModel model) {
    List<Exercise> exerciseList = model.getExercises(exerciseCategory);

    return InstructionsList(exerciseList, model);
  }
}
