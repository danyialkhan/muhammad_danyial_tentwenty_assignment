import 'package:flutter/material.dart';

const String initialRoute = '/';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Container(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Container(),
      );
  }
}
