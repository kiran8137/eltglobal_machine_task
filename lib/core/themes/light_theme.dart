

import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Color(0xFFF56C04)
    // secondary: Colors.grey.shade200,
    // tertiary: Colors.white,
    // inversePrimary: Colors.grey.shade300

  ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFF56C04), // Matches the primary color
    unselectedItemColor: Colors.grey,     // Color for unselected items
    selectedIconTheme: IconThemeData(color: Color(0xFFF56C04)),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
  ),
);