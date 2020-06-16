import 'package:flutter/material.dart';
import 'package:flutterbingo/MainRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light()
          .copyWith(
          scaffoldBackgroundColor: Colors.blue[50],
          accentColor: Colors.blue,
          highlightColor: Colors.blue[100],
          cardColor: Colors.lightBlue[50],
          disabledColor: Colors.grey[100]
      ),
      darkTheme: ThemeData.dark()
          .copyWith(
          accentColor: Colors.blue[900],
          highlightColor: Colors.blue[800],
          cardColor: Colors.grey[800]
      ),
      themeMode: ThemeMode.system ,
      home: MainRoute(),
    );
  }
}
