import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    Key key,
    @required this.pageImage,
  }) : super(key: key);

  final Widget pageImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: new BoxDecoration(
                color: primaryColor.withOpacity(.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(child: pageImage),
        ],
      ),
    );
  }
}
