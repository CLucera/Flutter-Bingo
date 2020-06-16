import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Single bingo slot, it include the text to be shown

class BingoSlot extends StatefulWidget {
  final String slotTitle;
  final bool initialCheckedState;

  const BingoSlot(this.slotTitle, {Key key, this.initialCheckedState = false}) : super(key: key);

  @override
  _BingoSlotState createState() => _BingoSlotState();
}

class _BingoSlotState extends State<BingoSlot>
    with SingleTickerProviderStateMixin {

  //animation handling variables
  AnimationController _animationController;
  Tween<double> _rotationTween = Tween<double>(begin: 1, end: 0);
  Tween<double> _scaleInTween = Tween<double>(begin: 1, end: 0.8);
  Tween<double> _scaleOutTween = Tween<double>(begin: 0, end: -0.2);
  Animation<double> _rotation;
  Animation<double> _scaleIn;
  Animation<double> _scaleOut;

  bool _isChecked;

  @override
  void initState() {
    super.initState();

    // Set starting value for isChecked
    _isChecked = widget.initialCheckedState;

    // Animation controller init
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    // Rotation animation
    _rotation = _rotationTween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 0.8, curve: Curves.easeInOut)));

    // First scale animation (before rotating)
    _scaleIn = _scaleInTween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.3, curve: Curves.bounceOut)));

    // Second scale animation (after rotating)
    _scaleOut = _scaleOutTween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.7, 1.0, curve: Curves.bounceOut)))
      ..addListener(() => setState(() {}));

    //if the initial status is checked start the animation as soon as inited
    if(_isChecked) {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    //force aspect ratio to 1 to have Square Tiles
    return AspectRatio(
      aspectRatio: 1,
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi * _rotation.value)
          ..scale(_scaleIn.value - _scaleOut.value),
        child: GestureDetector(
            onTap: () {
              if (_isChecked) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              _isChecked = !_isChecked;
            },
            child: _rotation.value <= 0.5
            // Show the correct "side of the card based on the rotation"
                ? Card(
                    color: Theme.of(context).highlightColor,
                    elevation: 5,
                    child: CardContent(widget.slotTitle))
                : Card(
                    elevation: 5,
                    color: Theme.of(context).disabledColor,
                    child: Transform(
                        // To avoid a flipped image the card shown when flipped
                        // should also be flipped to compensate
                        alignment: FractionalOffset.center,
                        transform: Matrix4.identity()..rotateY(pi * 1),
                        child: CardContent(widget.slotTitle)),
                  )),
      ),
    );
  }
}

/// Content shown inside the card.
/// it doesn't change between the rotations
///
class CardContent extends StatelessWidget {
  final String title;

  CardContent(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: LayoutBuilder(builder: (context, constraint) {
                  return FlutterLogo(
                    size: constraint.maxHeight,
                  );
                }),
              )),
          Flexible(
            flex: 2,
            child: Center(
              child: AutoSizeText(
                title,
                maxLines: 2,
                minFontSize: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );;
  }
}

