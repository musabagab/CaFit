import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/instructions_model.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class InstructionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<InstructionsModel>(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(child: Text('Instructions HERE')),
      ),
    );
  }
}
