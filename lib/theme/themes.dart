import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobxprojectteamplate/utils/const.dart';

enum ThemeType {
  light,
  dark,
}

BaseTheme themeByType(ThemeType type) {
  switch (type) {
    case ThemeType.light:
      return LightTheme();
    case ThemeType.dark:
      return DarkTheme();
  }
  return LightTheme();
}

abstract class BaseTheme {
  Color get colorWhite => Colors.white;

  Color get colorRed => Colors.red;

  Color get colorGreen => Colors.green;

  Color get colorBlue => Colors.blue;

  Color get colorYellow => Colors.yellow;

  Color get colorOrange => Colors.orange;

  Color get colorPink => Colors.pink;

  Color get colorBlack => Colors.black;

  Color get colorGrey => Colors.grey;

  TextStyle get smallTextStyle =>
      TextStyle(fontFamily: AppFont.roboto, fontSize: AppDimen.defaultTextSmallSize, fontWeight: FontWeight.normal);

  TextStyle get normalTextStyle =>
      TextStyle(fontFamily: AppFont.roboto, fontSize: AppDimen.defaultTextNormalSize, fontWeight: FontWeight.normal);

  TextStyle get bigTextStyle =>
      TextStyle(fontFamily: AppFont.roboto, fontSize: AppDimen.defaultTextBigSize, fontWeight: FontWeight.normal);

  ThemeData get themData;

  Color get boxColor;
}

@immutable
class LightTheme extends BaseTheme {
  @override
  ThemeData get themData => ThemeData(
        fontFamily: AppFont.productSans,
        brightness: Brightness.light,
        primaryColor: colorBlue,
        primaryColorBrightness: Brightness.light,
        accentColor: colorRed,
        accentColorBrightness: Brightness.light,
      );

  @override
  TextStyle get smallTextStyle => super.smallTextStyle.apply(color: colorBlack);

  @override
  TextStyle get normalTextStyle => super.normalTextStyle.apply(color: colorBlack);

  @override
  TextStyle get bigTextStyle => super.bigTextStyle.apply(color: Colors.black);

  @override
  Color get boxColor => Colors.white;
}

@immutable
class DarkTheme extends BaseTheme {
  @override
  ThemeData get themData => ThemeData(
        fontFamily: AppFont.productSans,
        brightness: Brightness.light,
        primaryColor: colorBlack,
        primaryColorBrightness: Brightness.dark,
        accentColor: colorGrey,
        accentColorBrightness: Brightness.dark,
      );

  @override
  TextStyle get smallTextStyle => super.smallTextStyle.apply(color: colorWhite);

  @override
  TextStyle get normalTextStyle => super.normalTextStyle.apply(color: colorWhite);

  @override
  TextStyle get bigTextStyle => super.bigTextStyle.apply(color: colorWhite);

  @override
  Color get boxColor => Colors.black;
}
