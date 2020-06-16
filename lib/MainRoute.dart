import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterbingo/GridWidget.dart';
import 'package:flutterbingo/SplashWidget.dart';

class MainRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                FirebaseUser user = snapshot.data;
                if (user == null) {
                  _signInAnonymously(context);
                  return SplashWidget();
                }
                return GridWidget();
              } else {
                return Scaffold(
                  body: Center(
                    child: SplashWidget(),
                  ),
                );
              }
            },
          );
  }

  //attempt async firebase signing
  //(anonym, needed just for storing the bingo state)
  _signInAnonymously(BuildContext context) async {
    try {
        await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e);
      //In case of error just send to the demo card
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => GridWidget()));
    }
  }
}
