import 'package:flutter/cupertino.dart';

extension NavigationHelper on BuildContext {
  void pushNamed({required String route}) {
    Navigator.of(this).pushNamed(route);
  }

  void popUntil({required String routeName}) {
    Navigator.of(this).popUntil((route) => route.settings.name == routeName);
  }

  void pop({required String routeName}) {
    Navigator.of(this).pop();
  }

  void pushNamedAndRemoveAll({required String routeName}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}