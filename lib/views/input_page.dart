import 'package:bmi_calculator/views/option_bg_view.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: OptionBgView()),
                  Expanded(child: OptionBgView())
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
            Expanded(child: OptionBgView()),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: OptionBgView()),
                  Expanded(child: OptionBgView())
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          ],
        ));
  }
}
