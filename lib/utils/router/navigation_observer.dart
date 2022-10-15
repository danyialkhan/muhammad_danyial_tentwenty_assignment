import 'package:flutter/material.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/routes.dart';

class MyNavigationObserver extends NavigatorObserver {
  List<Route<dynamic>> routeStack = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
    print(routeStack);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (routeStack.isNotEmpty) {
      if (route.settings.name != null && route.settings.name! == initialRoute) {
        print('INITIAL ROUTE IS POPPING.');
        print(routeStack);
      }
      routeStack.removeLast();
    }
    print(routeStack);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (routeStack.isNotEmpty) {
      routeStack.removeLast();
    }

    print(routeStack);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if(routeStack.isNotEmpty) {
      routeStack.removeLast();
    }
    if (newRoute != null) {
      routeStack.add(newRoute);
      print(routeStack);
    }
  }
}
