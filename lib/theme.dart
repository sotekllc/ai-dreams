import 'package:flutter/cupertino.dart';

CupertinoThemeData get darkTheme {
  return CupertinoThemeData(
    brightness: Brightness.dark,
    barBackgroundColor: CupertinoColors.black,
    scaffoldBackgroundColor: CupertinoColors.black,
    primaryColor: CupertinoColors.systemBlue,
    primaryContrastingColor: CupertinoColors.systemPurple,
    selectionHandleColor: CupertinoColors.systemPurple,
    textTheme: const CupertinoTextThemeData(
      textStyle: TextStyle(color: CupertinoColors.white, fontSize: 12.0),
      tabLabelTextStyle: TextStyle(
        color: CupertinoColors.lightBackgroundGray,
        fontSize: 10.0,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 14.0,
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 16.0,
      ),
      primaryColor: CupertinoColors.systemBlue,
    ),
  );
}

// https://www.materialpalette.com/indigo/deep-purple
CupertinoThemeData get lightTheme {
  return CupertinoThemeData(
    brightness: Brightness.light,
    barBackgroundColor: CupertinoColors.white,
    scaffoldBackgroundColor: CupertinoColors.white,
    primaryColor: CupertinoColors.systemBlue,
    primaryContrastingColor: CupertinoColors.systemPurple,
    selectionHandleColor: CupertinoColors.systemPurple,
    textTheme: const CupertinoTextThemeData(
      textStyle: TextStyle(color: CupertinoColors.black, fontSize: 12.0),
      tabLabelTextStyle: TextStyle(
        color: CupertinoColors.inactiveGray,
        fontSize: 10.0,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 14.0,
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
      ),
      primaryColor: CupertinoColors.systemBlue,
    ),
  );
}

const titleStyle = TextStyle(
  color: Color(0xff212121),
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);

const subtitleStyle = TextStyle(
  color: Color(0xff757575),
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
);

final errorTextStyle = TextStyle(
  color: CupertinoColors.destructiveRed,
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
);

final formFieldDecoration = BoxDecoration(
  color: CupertinoColors.white,
  borderRadius: BorderRadius.circular(30),
);

class AppSizes {
  static EdgeInsets screenPadding = EdgeInsets.symmetric(
    vertical: 24.0,
    horizontal: 24.0,
  );

  static EdgeInsets sidePadding = EdgeInsets.only(left: 20);
}
