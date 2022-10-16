import 'package:flutter/material.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/screens/home_tab_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/screen/movie_detail_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/page_not_found/page_not_found.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/route_params.dart';

const String initialRoute = '/';
const String movieDetailsScreenRoute = '/movieDetailsScreenRoute';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomeTabScreen(),
      );
    case movieDetailsScreenRoute:
      if(settings.arguments is! MovieDetailsScreenParams) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PageNotFound(),
        );
      }
      final params = settings.arguments as MovieDetailsScreenParams;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => MovieDetailsScreen(id: params.movieID, routeFrom: params.routeFrom),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const PageNotFound(),
      );
  }
}
