import 'package:flutter/material.dart';

import 'constants.dart';
import 'routes/routes.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      initialRoute: '/',
      routes: appRoutes,
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: kInactiveTrackColor,
          thumbColor: kThumbColor,
          overlayColor: kOverlayColor,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: kEnabledThumbRadius,
          ),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: kOverlayRadius,
          ),
        ),
      ),
    );
  }
}
