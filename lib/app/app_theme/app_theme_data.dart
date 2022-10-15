import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    required Color primaryAppColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark ? Typography.blackMountainView : Typography.whiteMountainView;

    return ThemeData(
        brightness: brightness,
        canvasColor: background,
        cardColor: background,
        dividerColor: divider,
        dividerTheme: dividerThemeData(divider),
        cardTheme: cardTheme(cardBackground),
        backgroundColor: background,
        primaryColor: primaryAppColor,
        scaffoldBackgroundColor: ColorConstants.secondaryAppGreyColor,
        textSelectionTheme: textSelectionThemeData(secondaryText!),
        toggleableActiveColor: accentColor,
        appBarTheme: appBarTheme(cardBackground, secondaryText, baseTextTheme),
        iconTheme: iconThemeData(ColorConstants.iconColor),
        errorColor: error,
        buttonTheme: buttonThemeData(brightness, accentColor, background, error, buttonText),
        cupertinoOverrideTheme: cupertinoThemeData(brightness, accentColor),
        inputDecorationTheme: inputDecorationTheme(error, primaryText, secondaryText),
        fontFamily: 'Poppins',
        textTheme: textTheme(baseTextTheme, primaryText, secondaryText),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3.r))),
        ));
  }

  static DividerThemeData dividerThemeData(Color? divider) {
    return DividerThemeData(
      color: divider,
      space: 1,
      thickness: 1,
    );
  }

  static CupertinoThemeData cupertinoThemeData(Brightness brightness, Color accentColor) {
    return CupertinoThemeData(
      brightness: brightness,
      primaryColor: accentColor,
    );
  }

  static IconThemeData iconThemeData(Color? secondaryText) {
    return IconThemeData(
      color: secondaryText,
      size: 16.0,
    );
  }

  static CardTheme cardTheme(Color? cardBackground) {
    return CardTheme(
      color: cardBackground,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  static TextTheme textTheme(TextTheme baseTextTheme, Color primaryText, Color? secondaryText) {
    return TextTheme(
      headline1: GoogleFonts.poppins(
        textStyle: baseTextTheme.headline1!.copyWith(
          color: primaryText,
          fontSize: 60.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headline2: GoogleFonts.poppins(
        textStyle:  baseTextTheme.headline2!.copyWith(
          color: primaryText,
          fontSize: 40.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headline3: GoogleFonts.poppins(
        textStyle: baseTextTheme.headline3!.copyWith(
          color: secondaryText,
          fontSize: 38.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      headline4: GoogleFonts.poppins(
        textStyle: baseTextTheme.headline4!.copyWith(
          color: primaryText,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      headline5: GoogleFonts.poppins(
        textStyle: baseTextTheme.headline5!.copyWith(
          color: primaryText,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      headline6: GoogleFonts.poppins(
        textStyle: baseTextTheme.headline6!.copyWith(
          color: primaryText,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      bodyText1: GoogleFonts.poppins(
        textStyle: baseTextTheme.bodyText1!.copyWith(
          color: secondaryText,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyText2: GoogleFonts.poppins(
        textStyle: baseTextTheme.bodyText2!.copyWith(
          color: primaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      button: GoogleFonts.poppins(
        textStyle: baseTextTheme.button!.copyWith(
          color: primaryText,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      caption: GoogleFonts.poppins(
        textStyle: baseTextTheme.caption!.copyWith(
          color: ColorConstants.activeFontColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      overline: GoogleFonts.poppins(
        textStyle: baseTextTheme.overline!.copyWith(
          color: secondaryText,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle1: GoogleFonts.poppins(
        textStyle: baseTextTheme.subtitle1!.copyWith(
          color: primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle2: GoogleFonts.poppins(
        textStyle: baseTextTheme.subtitle2!.copyWith(
          color: secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme(Color error, Color primaryText, Color? secondaryText) {
    return InputDecorationTheme(
      errorStyle: TextStyle(color: error),
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: primaryText.withOpacity(0.5),
      ),
      hintStyle: TextStyle(
        color: secondaryText,
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  static ButtonThemeData buttonThemeData(Brightness brightness, Color accentColor, Color background, Color error, Color buttonText) {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accentColor,
        secondary: accentColor,
        surface: background,
        background: background,
        error: error,
        onPrimary: buttonText,
        onSecondary: buttonText,
        onSurface: buttonText,
        onBackground: buttonText,
        onError: buttonText,
      ),
      padding: const EdgeInsets.all(16.0),
    );
  }

  static TextSelectionThemeData textSelectionThemeData(Color accentColor) {
    return TextSelectionThemeData(
      selectionColor: accentColor,
      selectionHandleColor: accentColor,
      cursorColor: accentColor,
    );
  }

  static AppBarTheme appBarTheme(Color? cardBackground, Color? secondaryText, TextTheme baseTextTheme) {
    return AppBarTheme(
      color: cardBackground,
      iconTheme: IconThemeData(
        color: secondaryText,
      ),
      toolbarTextStyle: TextTheme(
        bodyText1: baseTextTheme.bodyText1!.copyWith(
          color: secondaryText,
          fontSize: 18,
        ),
      ).bodyText2,
      titleTextStyle: TextTheme(
        bodyText1: baseTextTheme.bodyText1!.copyWith(
          color: secondaryText,
          fontSize: 18,
        ),
      ).headline6,
    );
  }

  static ThemeData get lightTheme => createTheme(
    brightness: Brightness.light,
    background: ColorConstants.primaryAppColor,
    cardBackground: ColorConstants.secondaryAppColor,
    primaryText: ColorConstants.primaryFontColor,
    secondaryText: ColorConstants.secondaryFontColor,
    accentColor: ColorConstants.secondaryAppColor,
    primaryAppColor: ColorConstants.primaryAppColor,
    divider: ColorConstants.dividerColor,
    buttonBackground: Colors.black38,
    buttonText: ColorConstants.secondaryAppColor,
    disabled: ColorConstants.secondaryAppColor,
    error: Colors.red,
  );

  static ThemeData get darkTheme => createTheme(
    brightness: Brightness.dark,
    background: ColorConstants.darkScaffoldBackgroundColor,
    cardBackground: ColorConstants.secondaryDarkAppColor,
    primaryText: Colors.white,
    secondaryText: Colors.black,
    accentColor: ColorConstants.secondaryDarkAppColor,
    primaryAppColor: ColorConstants.primaryAppColor,
    divider: Colors.black45,
    buttonBackground: Colors.white,
    buttonText: ColorConstants.secondaryDarkAppColor,
    disabled: ColorConstants.secondaryDarkAppColor,
    error: Colors.red,
  );
}

Color secondaryAppColor(BuildContext context) => Theme.of(context).colorScheme.secondary;
