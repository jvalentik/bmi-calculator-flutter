import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class TileContent extends StatelessWidget {
  final IconData data;
  final String label;

  const TileContent({
    this.data,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          data,
          size: kIconSize,
        ),
        SizedBox(
          height: kDividerHeight,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
