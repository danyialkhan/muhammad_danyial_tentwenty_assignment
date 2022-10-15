import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/app.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/codegen_loader.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/dependency_injection/di.dart' as di;
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: 'env/.env_develop');

  url = dotenv.env["url"] ?? '';
  apiKey = dotenv.env["api_key"] ?? '';
  imageUrl = dotenv.env["imageUrl"] ?? '';

  await di.init();

  isAndroid = Platform.isAndroid;

  runApp(
    DevicePreview(
      builder: (context) => EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en'),
          Locale('id'),
        ],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
      enabled: false,
    ),
  );
}
