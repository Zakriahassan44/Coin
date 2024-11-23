// Dark Theme
import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background:
        const Color(0xFF121212), // Dark background color for the entire screen
    primary: const Color(
        0xFFFBAF19), // Primary accent color for app elements (like buttons, links)
    secondary: const Color(
        0xFF1E1E1E), // Secondary background color for elements like sidebars
    tertiary: const Color(
        0xFF2F2F2F), // Surface-level background color for cards or lists
    inversePrimary: Colors.grey
        .shade300, // Light color for text/icons on primary elements when using an inverse style
    onPrimary:
        Colors.black, // Text color on primary elements (like buttons, app bars)
    onSecondary: Colors.white, // Text color on secondary elements
    surface: const Color(0xFF1D1D1D), // Card or surface background
    onSurface: Colors.white, // Text color on surfaces (like cards, dialogs)
  ),
  primaryTextTheme: const TextTheme(
    bodyLarge:
        TextStyle(color: Colors.white), // Default text color in dark mode
    bodyMedium: TextStyle(color: Colors.white70), // Secondary text color
    titleLarge:
        TextStyle(color: Colors.white), // App bar title color in dark mode
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
);
