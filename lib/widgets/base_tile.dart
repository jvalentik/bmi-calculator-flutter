import 'package:flutter/material.dart';

import '../constants.dart';

class BaseTile extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;
  const BaseTile({
    @required this.color,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(kTileMargin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kTileBorderRadius),
        ),
      ),
    );
  }
}
