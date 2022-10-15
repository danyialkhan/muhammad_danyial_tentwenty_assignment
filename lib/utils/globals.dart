import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
GlobalKey<NavigatorState> navigatorKeyGlobal = GlobalKey();
bool isAndroid = false;
String url = '';
String apiKey = '';
String imageUrl = '';