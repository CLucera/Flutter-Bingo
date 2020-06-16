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
    "Responsive widgets"
    "Null Safety",
    "Fuchsia support",
    "Dash color change",
    "BREAKING CHANGES!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    boxShadow: [
                      BoxShadow(blurRadius: 2, spreadRadius: 1)
                    ]
                  ),
                  child: Text(
                    "FlutterDay Bingo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue[50],
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: columns,
                  childAspectRatio: 1,
                  children: <Widget>[
                    for (int i = 0; i < options.length; i++)
                      BingoSlot(options[i])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
