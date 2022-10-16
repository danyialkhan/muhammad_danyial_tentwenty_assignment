import 'package:flutter/material.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/cenema_booking/screens/booking_date_selection.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/cenema_booking/screens/select_seat_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/screens/home_tab_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/screen/movie_detail_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/page_not_found/page_not_found.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/videos_list_screen/play_videos_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/videos_list_screen/video_list_screen.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/route_params.dart';

const String initialRoute = '/';
const String movieDetailsScreenRoute = '/movieDetailsScreenRoute';
const String movieVideosListScreenRoute = '/movieVideosListScreenRoute';
const String playVideoScreenRoute = '/playVideoScreenRoute';
const String bookingDateSelectionScreenRoute = '/bookingDateSelectionScreenRoute';
const String selectSeatScreenRoute = '/selectSeatScreenRoute';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomeTabScreen(),
      );
    case movieDetailsScreenRoute:
      if (settings.arguments is! MovieDetailsScreenParams) {
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
    case movieVideosListScreenRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const VideoListScreen(),
      );
    case playVideoScreenRoute:
      final key = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => PlayVideoScreen(videoKey: key),
      );

    case bookingDateSelectionScreenRoute:
      if (settings.arguments is! BookingScreenParams) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PageNotFound(),
        );
      }
      final params = settings.arguments as BookingScreenParams;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BookingDateSelectionScreen(
          movieName: params.movieName,
          releaseDate: params.releaseDate,
        ),
      );
    case selectSeatScreenRoute:
      if (settings.arguments is! BookingScreenParams) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PageNotFound(),
        );
      }
      final params = settings.arguments as BookingScreenParams;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => SelectScreen(
          movieName: params.movieName,
          releaseDate: params.releaseDate,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const PageNotFound(),
      );
  }
}
