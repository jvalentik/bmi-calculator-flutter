import 'package:bmi_calculator/routes/result_route.dart';
import 'package:bmi_calculator/utils/calculator.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/screen_arguments.dart';
import 'package:bmi_calculator/widgets/base_tile.dart';
import 'package:bmi_calculator/widgets/bottom_action_button.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:bmi_calculator/widgets/tile_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  MALE,
  FEMALE,
}

class InputRoute extends StatefulWidget {
  static const routeName = '/';
  @override
  _InputRouteState createState() => _InputRouteState();
}

class _InputRouteState extends State<InputRoute> {
  Gender _selectedGender;
  int _height = kInitialHeight;
  int _weight = kInitialWeight;
  int _age = kInitialAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Tracker'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BaseTile(
                    onTap: () {
                      setState(() {
                        _selectedGender = Gender.MALE;
                      });
                    },
                    color: _selectedGender == Gender.MALE
                        ? kActiveTileColor
                        : kInactiveTileColor,
                    child: TileContent(
                      data: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: BaseTile(
                      onTap: () {
                        setState(() {
                          _selectedGender = Gender.FEMALE;
                        });
                      },
                      color: _selectedGender == Gender.FEMALE
                          ? kActiveTileColor
                          : kInactiveTileColor,
                      child: TileContent(
                        data: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: BaseTile(
              color: kActiveTileColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '${_height.toString()} ',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: _height.toDouble(),
                    min: kMinHeight,
                    max: kMaxHeight,
                    onChanged: (double newValue) {
                      setState(() {
                        _height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BaseTile(
                    color: kActiveTileColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: kDividerHeight,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (_weight > 0) {
                                    _weight--;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BaseTile(
                    color: kActiveTileColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: kDividerHeight,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (_age > 0) {
                                    _age--;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomActionButton(
              onTap: () {
                Calculator calc = Calculator(height: _height, weight: _weight);
                Navigator.pushNamed(
                  context,
                  ResultRoute.routeName,
                  arguments: ScreenArguments(
                    bmi: calc.calculateBMI(),
                    result: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                );
              },
              label: 'CALCULATE'),
        ],
      ),
    );
  }
}
