import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterbingo/BingoSlot.dart';

//show the grid list
class GridWidget extends StatefulWidget {
  final bool useDemoList;

  const GridWidget({Key key, this.useDemoList}) : super(key: key);

  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  final int columns = 4;
  final int rows = 4;
  final double headerSize = 60;

  //todo get list from firebase
  List options = [
    "Navigator 2.0",
    "Dash spotted",
    "Web is STABLE",
    "The boring show",
    "New UI tool",
    "State management",
    "Firebase news",
    "Dark mode mandatory",
    "Flutter 2.0",
    "Desktop is BETA",
    "Thanks community",
    "#FlutterDay",
    "Responsive widgets",
    "Null safety",
    "Dash color change",
    "BREAKING CHANGES!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(builder: (context, constraint) {
          double maxContainerSize =
              constraint.maxWidth + headerSize < constraint.maxHeight
                  ? constraint.maxWidth
                  : (constraint.maxHeight * 0.9) - headerSize;
          return Container(
            width: maxContainerSize,
            height: maxContainerSize + headerSize,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              child: LayoutBuilder(builder: (context, constraint) {
                double maxGridSize =
                    min(constraint.maxWidth, constraint.maxHeight);
                return Container(
                  width: maxGridSize * 0.8,
                  height: maxGridSize,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          height: headerSize,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              boxShadow: [
                                BoxShadow(blurRadius: 2, spreadRadius: 1)
                              ]),
                          child: AutoSizeText(
                            "FlutterDay Bingo",
                            maxLines: 1,
                            minFontSize: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue[50],
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                      GridView.count(
                        padding: EdgeInsets.all(8),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: columns,
                        childAspectRatio: 1,
                        children: <Widget>[
                          for (int i = 0; i < options.length; i++)
                            BingoSlot(options[i])
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
