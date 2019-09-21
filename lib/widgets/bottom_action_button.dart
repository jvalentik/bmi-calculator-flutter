import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomActionButton extends StatelessWidget {
  final Function onTap;
  final String label;

  const BottomActionButton({
    this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: kBottomContainerMargin),
        padding: EdgeInsets.only(bottom: kBottomContainerMargin),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
