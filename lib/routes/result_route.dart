import 'package:flutter/material.dart';

class ResultRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Tracker'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Go back'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
