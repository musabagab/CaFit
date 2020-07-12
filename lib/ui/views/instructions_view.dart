import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider_architecture/core/viewmodels/instructions_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart' as prefix0;
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
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
            accentColor: prefix0.primaryColor),
        home: DefaultTabController(
          length: model.categoryies.length,
          child: Scaffold(
            body: TabBarView(
              controller: model.getController(),
              children: buildTabViews(),
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: model.goBack,
              ),
              title: AppBarTitle('Instructions'),
              backgroundColor: prefix0.primaryColor,
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

  List<Widget> buildTabViews() => [html, Text('Legs'), Text('Arms')];

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

  Widget html = Html(
    data: """
        <div>
          <h1>Demo Page</h1>
          <p>This is a fantastic product that you should buy!</p>
          <h3>Features</h3>
          <ul>
            <li>It actually works</li>
            <li>It exists</li>
            <li>It doesn't cost much!</li>
          </ul>
          <h3>Image support:</h3>
      <p>        
        <a href='https://google.com'><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></a>        
      </p>
          <!--You can pretty much put any html in here!-->
        </div>
      """,
    //Optional parameters:
    backgroundColor: Colors.white70,

    onLinkTap: (url) {
      // open url in a webview
    },
    padding: EdgeInsets.all(10),
    onImageTap: (src) {
      print(src);
    },
  );
}
