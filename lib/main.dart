import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutterbingo/MainRoute.dart';

void main() {
  initializeApp(
      apiKey: "AIzaSyCaQTeCcfYgdJ1ReLukuntN4UTz5m8QZ1k",
      authDomain: "flutter-bingo.firebaseapp.com",
      databaseURL: "https://flutter-bingo.firebaseio.com",
      projectId: "flutter-bingo",
      storageBucket: "flutter-bingo.appspot.com",
      messagingSenderId: "605618736443",
      appId: "1:605618736443:web:0013740d6cfa4c8817bb1e",
      measurementId: "G-HY0GY51HWG"
  );

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
