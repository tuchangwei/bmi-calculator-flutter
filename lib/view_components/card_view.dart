import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final bool isActive;
  CardView({this.onPressed, @required this.child, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF1D1E33) : Color(0xFF111328),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
