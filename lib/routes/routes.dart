import 'package:flutter/material.dart';

import 'input_route.dart';
import 'result_route.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => InputRoute(),
  '/result': (context) => ResultRoute(),
};
