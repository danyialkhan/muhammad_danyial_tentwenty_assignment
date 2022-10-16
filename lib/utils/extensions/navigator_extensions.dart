import 'package:flutter/cupertino.dart';

extension NavigationHelper on BuildContext {
  void pushNamed({
    required String route,
    bool rootNavigator = false,
    Object? arguments,
  }) {
    Navigator.of(this, rootNavigator: rootNavigator).pushNamed(route, arguments: arguments);
  }

  void popUntil({required String routeName}) {
    Navigator.of(this).popUntil((route) => route.settings.name == routeName);
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void pushNamedAndRemoveAll({required String routeName}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
