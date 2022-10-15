import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/app_theme/app_theme_data.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';

class TextStyles {
  static TextStyle getButtonTextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.button!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize ?? 14.sp,
            color: color ?? ColorConstants.secondaryFontColor,
            decoration: decoration,
          ),
    );
  }

  static TextStyle getSubtitleTextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w600,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? ColorConstants.primaryFontColor,
          ),
    );
  }

  static TextStyle getSubtitle2TextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? ColorConstants.secondaryFontColor,
          ),
    );
  }

  static TextStyle getHeadline6TextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w600,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? secondaryAppColor(context),
          ),
    );
  }

  static TextStyle getCaptionTextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.caption!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? ColorConstants.primaryFontColor,
          ),
    );
  }

  static TextStyle getBodyText2TextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? ColorConstants.primaryFontColor,
          ),
    );
  }

  static TextStyle getBodyText1TextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? ColorConstants.primaryFontColor,
          ),
    );
  }

  static TextStyle getHeadline4TextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w700,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headline4!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? ColorConstants.primaryFontColor,
          ),
    );
  }

  static TextStyle getHeadline5TextStyle(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w700,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? ColorConstants.primaryFontColor,
          ),
    );
  }
}

extension TextStylesExtension on BuildContext {
  TextStyle getButtonTextStyle({
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getButtonTextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
    );
  }

  TextStyle getSubtitleTextStyle({
    FontWeight fontWeight = FontWeight.w600,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getSubtitleTextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getBodyText2TextStyle({
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getBodyText2TextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getHeadline6TextStyle({
    FontWeight fontWeight = FontWeight.w600,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getHeadline6TextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getCaptionTextStyle({
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getCaptionTextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getBodyText1TextStyle({
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getBodyText1TextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getHeadline4TextStyle({
    FontWeight fontWeight = FontWeight.w700,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getHeadline4TextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getSubtitle2TextStyle({
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getSubtitle2TextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  TextStyle getHeadline5TextStyle({
    FontWeight fontWeight = FontWeight.w700,
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyles.getHeadline5TextStyle(
      this,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

}
