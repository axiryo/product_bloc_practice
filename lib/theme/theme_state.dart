import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);

  static ThemeState get darkTheme => ThemeState(ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFDEE4EA),
          secondary: Color(0xFFB6C2CF),
          primaryContainer: Color(0xFF1D2125),
          tertiary: Colors.red,
        ),
        scaffoldBackgroundColor: const Color(0xFF161A1D),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF161A1D),
          iconTheme: IconThemeData(color: Color(0xFFDEE4EA)),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF1D2125),
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: Typography.whiteCupertino.apply(fontFamily: 'WorkSans'),
      ));

  static ThemeState get lightTheme => ThemeState(ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF020203),
          secondary: Color(0xFF474747),
          primaryContainer: Color(0xFFEAEEF1),
          tertiary: Color.fromARGB(255, 0, 255, 106),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFEFE),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFFFEFE),
          iconTheme: IconThemeData(color: Color(0xFF020203)),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFEAEEF1),
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: Typography.blackCupertino.apply(fontFamily: 'WorkSans'),
      ));
}
