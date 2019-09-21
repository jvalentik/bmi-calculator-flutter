import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundIconButton({
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: kFabElevation,
      constraints: BoxConstraints.tightFor(
        width: kFabSize,
        height: kFabSize,
      ),
      shape: CircleBorder(),
      fillColor: kFabBackgroundColor,
    );
  }
}
