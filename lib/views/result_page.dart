import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/person_info.dart';
import 'package:bmi_calculator/view_components/bottom_button.dart';
import 'package:bmi_calculator/view_components/card_view.dart';
import 'package:bmi_calculator/view_models/input_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatefulWidget {
  final InputPageModel model;
  ResultPage({this.model});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Your Result",
                      style: kLargeButtonTextStyle.copyWith(fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: CardView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            widget.model.getResult(),
                            style: kLargeButtonTextStyle.copyWith(
                                color: Color(0xff22E67B)),
                          ),
                          Text(
                            widget.model.calculateBMI(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            widget.model.getInterpretation(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: BottomButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  title: "RE-CALCULATE"),
            )
          ],
        ));
  }
}
