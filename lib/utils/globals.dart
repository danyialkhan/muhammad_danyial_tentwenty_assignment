import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
GlobalKey<NavigatorState> navigatorKeyGlobal = GlobalKey();
bool isAndroid = false;
String url = dotenv.env["url"] ?? '';