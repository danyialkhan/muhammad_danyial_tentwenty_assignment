// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "watch": "Watch",
  "dashboard": "Dashboard",
  "media_library": "Media Library",
  "more": "More",
  "something_went_wrong": "Something went wrong",
  "no_internet": "No Internet",
  "results_not_found": "Results not found",
  "tv_shows_movies_and_more": "TV shows, movies and more",
  "top_results": "top results",
  "results_found": "{} Results Found",
  "in_theaters_date": "In theaters {}",
  "get_tickets": "Get Tickets",
  "watch_trailer": "Watch Trailer",
  "genres": "Genres",
  "overview": "Overview",
  "search": "Search",
  "date": "Date",
  "select_seats": "Select Seats",
  "screen": "Screen",
  "selected": "Selected",
  "not_available": "Not available",
  "vip": "VIP ({})",
  "regular": "Regular ({})",
  "proceed_to_pay": "Proceed to pay",
  "total_price": "Total Price"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
