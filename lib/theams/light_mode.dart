// Light Theme
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Color(0xFFF9F9F9), // Soft light background
    primary: Color(
        0xFFFBAF19), // Primary accent color for the app (typically buttons, links, etc.)
    secondary: Color(
        0xFF00796B), // Secondary color for less prominent elements like sidebars, icons
    tertiary: Color(0xFFF1F1F1), // For cards or other surface-level elements
    inversePrimary: Colors
        .black, // Color for text/icons on primary elements when using an inverse style
    onPrimary:
        Colors.white, // Text color on primary elements (like buttons, app bars)
    onSecondary: Colors.white, // Text color on secondary elements
    surface: Color(0xFFFFFFFF), // Card or surface background
    onSurface: Colors.black, // Text color on surfaces (like cards, dialogs)
  ),
  primaryTextTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Default text color
    bodyMedium: TextStyle(color: Colors.black), // Subheadings or secondary text
    titleLarge: TextStyle(color: Colors.black), // App bar title color
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFBAF19),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
);
