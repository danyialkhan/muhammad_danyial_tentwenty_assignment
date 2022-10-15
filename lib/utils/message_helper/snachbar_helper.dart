import 'package:flutter/material.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

class SnackbarHelper {
  static void show({required String message}) {
    final context = navigatorKeyGlobal.currentState!.context;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: context.getBodyText2TextStyle(color: ColorConstants.secondaryFontColor),
      ),
      backgroundColor: ColorConstants.secondaryAppColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
