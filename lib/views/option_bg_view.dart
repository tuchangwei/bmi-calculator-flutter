import 'package:flutter/material.dart';

class OptionBgView extends StatefulWidget {
  @override
  _OptionBgViewState createState() => _OptionBgViewState();
}

class _OptionBgViewState extends State<OptionBgView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
