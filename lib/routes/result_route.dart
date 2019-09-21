import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/screen_arguments.dart';
import 'package:bmi_calculator/widgets/base_tile.dart';
import 'package:bmi_calculator/widgets/bottom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultRoute extends StatelessWidget {
  static const routeName = '/result';
  @override
  Widget build(BuildContext context) {
    final ScreenArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kTileMargin),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BaseTile(
              color: kActiveTileColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    arguments.result.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    arguments.bmi.toUpperCase(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    arguments.interpretation.toUpperCase(),
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomActionButton(
            onTap: () => Navigator.pop(context),
            label: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
