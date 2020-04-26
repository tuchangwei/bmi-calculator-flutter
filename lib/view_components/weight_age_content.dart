import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ContentType { weight, age }

class WeightAgeContent extends StatelessWidget {
  final ContentType type;
  final double value;
  final Function valueReduced;
  final Function valueIncreased;
  WeightAgeContent(
      {@required this.type,
      @required this.value,
      @required this.valueReduced,
      @required this.valueIncreased});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            type == ContentType.weight ? "WEIGHT" : "AGE",
            style: kLabelTextStyle,
          ),
          Text(
            value.round().toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RawMaterialButton(
                onPressed: valueReduced,
                shape: CircleBorder(),
                constraints: BoxConstraints.tight(Size(56, 56)),
                child: Icon(FontAwesomeIcons.minus),
                fillColor: Color(0xff1C2032),
              ),
              RawMaterialButton(
                onPressed: valueIncreased,
                shape: CircleBorder(),
                constraints: BoxConstraints.tight(Size(56, 56)),
                child: Icon(FontAwesomeIcons.plus),
                fillColor: Color(0xff1C2032),
              )
            ],
          )
        ],
      ),
    );
  }
}
