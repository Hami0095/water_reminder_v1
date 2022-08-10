import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 203, 226, 244),
    primarySwatch: Colors.blue,
    dividerColor: const Color.fromARGB(255, 0, 50, 91),
    cardColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return Colors.white;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return const Color.fromARGB(255, 0, 50, 91);
          },
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 181, 202, 244),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
    ),
    switchTheme: SwitchThemeData(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue;
          }
          return Colors.white;
        },
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color.fromARGB(255, 1, 39, 71),
        fontFamily: 'Lato',
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 0, 29, 52),
        fontFamily: 'Lato',
        fontSize: 22,
      ),
      titleSmall: TextStyle(
        color: Color.fromARGB(255, 0, 29, 52),
        fontFamily: 'Lato',
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 13,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 15,
      ),
      headlineLarge: TextStyle(
        color: Color.fromARGB(255, 0, 29, 52),
        fontFamily: 'Lato-Bold',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Color.fromARGB(255, 0, 29, 52),
        fontFamily: 'Lato-Bold',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Color.fromARGB(255, 0, 29, 52),
        fontFamily: 'Lato',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 13,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 11,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 9,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      onPrimary: Colors.blue,
      onError: Colors.red,
      brightness: Brightness.light,
      primary: Colors.lightBlueAccent,
      secondary: Color.fromARGB(255, 0, 29, 52),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'lato',
        color: Color.fromARGB(255, 0, 29, 52),
      ),
      backgroundColor: Color.fromARGB(255, 59, 174, 246),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}
