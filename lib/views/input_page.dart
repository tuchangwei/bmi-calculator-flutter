import 'dart:ffi';
import 'dart:wasm';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/person_info.dart';
import 'package:bmi_calculator/view_components/bottom_button.dart';
import 'package:bmi_calculator/view_components/gender_content.dart';
import 'package:bmi_calculator/view_components/card_view.dart';
import 'package:bmi_calculator/view_components/weight_age_content.dart';
import 'package:bmi_calculator/view_models/input_page_model.dart';
import 'package:bmi_calculator/views/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  InputPageModel model = InputPageModel();
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
                  Expanded(
                      child: CardView(
                    onPressed: () {
                      setState(() {
                        model.info.gender = Gender.male;
                      });
                    },
                    child: GenderContent(
                      gender: Gender.male,
                    ),
                    isActive: model.info.gender == Gender.male,
                  )),
                  Expanded(
                      child: CardView(
                    onPressed: () {
                      setState(() {
                        model.info.gender = Gender.female;
                      });
                    },
                    child: GenderContent(
                      gender: Gender.female,
                    ),
                    isActive: model.info.gender == Gender.female,
                  )),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
            Expanded(
                child: CardView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      model.info.height.round().toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xffEA1556),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x1fEA1556),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff888995)),
                  child: Slider(
                    value: model.info.height,
                    min: 140,
                    max: 200,
                    onChanged: (value) {
                      setState(() {
                        model.info.height = value;
                      });
                    },
                  ),
                )
              ],
            ))),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: CardView(
                    child: WeightAgeContent(
                      type: ContentType.weight,
                      value: model.info.weight,
                      valueReduced: () {
                        setState(() {
                          if (model.info.weight < 20) {
                            model.info.weight = 20;
                          } else {
                            model.info.weight--;
                          }
                        });
                      },
                      valueIncreased: () {
                        setState(() {
                          if (model.info.weight > 200) {
                            model.info.weight = 200;
                          } else {
                            model.info.weight++;
                          }
                        });
                      },
                    ),
                  )),
                  Expanded(
                      child: CardView(
                    child: WeightAgeContent(
                      type: ContentType.age,
                      value: model.info.age,
                      valueReduced: () {
                        setState(() {
                          if (model.info.age < 1) {
                            model.info.age = 1;
                          } else {
                            model.info.age--;
                          }
                        });
                      },
                      valueIncreased: () {
                        setState(() {
                          if (model.info.age > 100) {
                            model.info.age = 100;
                          } else {
                            model.info.age++;
                          }
                        });
                      },
                    ),
                  ))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: BottomButton(
                  title: "CALCULATE YOUR BMI",
                  onPressed: () {
                    model.calculateBMI();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultPage(
                              model: model,
                            )));
                  }),
            )
          ],
        ));
  }
}
