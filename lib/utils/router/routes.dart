import 'package:flutter/material.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/screens/home_tab_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/page_not_found/page_not_found.dart';

const String initialRoute = '/';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomeTabScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const PageNotFound(),
      );
  }
}
