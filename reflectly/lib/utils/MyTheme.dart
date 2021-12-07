import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MySizes.dart';

class MyTheme {

  static final Color titleColor = const Color(0xFF3e4148);
  static final Color subtitleColor = const Color(0xFFa6a5ad);
  static final Color geryTransparent = const Color(0xFFF5F5F5);
  static final Color titleSecondColor = const Color(0xFF8282cc);
  static final Color black = const Color(0xFF2f2e3d);
  static final lightTheme = ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      primarySwatch: Colors.deepPurple,
      backgroundColor: _MyColors.backgroundColor,
      primaryColor: _MyColors.primaryColor,
      brightness: Brightness.light,
      secondaryHeaderColor: _MyColors.accentColor,
      errorColor: _MyColors.errorColor,
      scaffoldBackgroundColor: _MyColors.backgroundColor,
      bottomAppBarColor: _MyColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: _MyColors.primaryColor,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: _MyColors.primaryColor,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 3,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: _CustomTheme.textTheme,
      fontFamily: _CustomTheme.fontFamily,
      textButtonTheme: _CustomTheme.textThemeButtonData,
      inputDecorationTheme: _CustomTheme.inputDecorationTheme,
      cardTheme: _CustomTheme.cardTheme,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent, elevation: 0));


  static final transparentTextButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
  );
}

class _MyColors {
  static final Color primaryColor = const Color(0xFF6d8ff9);
  static final Color accentColor = const Color(0xFF3792a4);
  static final Color backgroundColor = const Color(0xFFf0f5f9);
  static final Color errorColor = Colors.red;
}

class _CustomTheme {
  static final borderRadius = BorderRadius.circular(MySizes.buttonHeight);
  static final fontFamily = 'cairo';

  static final TextTheme textTheme = TextTheme(
          subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
      headline6: TextStyle(
        fontSize: 18,
        height: 1.3,
        fontWeight: FontWeight.bold,
      ),
          button:
              TextStyle(height: 1.3, fontSize: 15, fontWeight: FontWeight.bold))
      .apply(
    fontFamily: fontFamily,
    displayColor: MyTheme.titleColor,
  );

  static final TextButtonThemeData textThemeButtonData = TextButtonThemeData(
    style: TextButton.styleFrom(
        primary: Colors.white,
        //Text Color
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        backgroundColor: _MyColors.primaryColor,
        minimumSize: Size(0,MySizes.buttonHeight),
        maximumSize: Size(400, MySizes.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        )),
  );
  static final CardTheme cardTheme = CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.transparent)),
    color: Colors.white,
  );
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: MyTheme.subtitleColor,
      ),
      //borderRadius: borderRadius,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: MyTheme.subtitleColor,
      ),
      //borderRadius: borderRadius,
    ),

    border: UnderlineInputBorder(
        borderSide: BorderSide(color: MyTheme.subtitleColor)),
    // filled: true,
    // fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    hintStyle: TextStyle(
      color: MyTheme.geryTransparent,
      fontSize: 14,
      fontFamily: fontFamily,
    ),
    labelStyle: TextStyle(
      color: MyTheme.titleColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: fontFamily,
    ),
  );
}
