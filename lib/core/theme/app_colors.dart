import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color backgroundPrimary = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF5F5F5);
  static const Color backgroundTertiary = Color(0xFFEDEFF1);
  static const Color backgroundAccent = Color(0xFF212429);
  static const Color backgroundDisabled = Color(0xFFF8F8F8);

  static const Color contentPrimary = Color(0xFF212429);
  static const Color contentSecondary = Color(0xFF868D94);
  static const Color contentTertiary = Color(0xFFB0B5B9);
  static const Color contentDisabled = Color(0xFFD3D6D8);
  static const Color contentOnColor = Color(0xFFFFFFFF);
  static const Color contentOnColorInverse = Color(0xFFFFFFFF);
  static const Color contentSale = Color(0xFFFA254C);

  static const Color borderSubtle = Color(0xFFE0E2E4);
  static const Color borderFocus = Color(0xFF212429);
  static const Color divider = Color(0xFFE0E2E4);

  static const Color success = Color(0xFF1F9D55);
  static const Color warning = Color(0xFFF5A524);
  static const Color error = Color(0xFFFA254C);
  static const Color info = Color(0xFF2D7FF9);

  static const Color overlay = Color(0x66000000);
  static const Color transparent = Color(0x00000000);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: contentPrimary,
    onPrimary: contentOnColor,
    secondary: contentSecondary,
    onSecondary: contentOnColor,
    tertiary: contentSale,
    onTertiary: contentOnColor,
    error: error,
    onError: contentOnColor,
    surface: backgroundPrimary,
    onSurface: contentPrimary,
    surfaceContainerHighest: backgroundSecondary,
    outline: borderSubtle,
    outlineVariant: divider,
    shadow: Color(0x1A000000),
    scrim: overlay,
    inverseSurface: contentPrimary,
    onInverseSurface: contentOnColorInverse,
    inversePrimary: backgroundPrimary,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: backgroundPrimary,
    onPrimary: contentPrimary,
    secondary: contentTertiary,
    onSecondary: contentPrimary,
    tertiary: contentSale,
    onTertiary: contentOnColor,
    error: error,
    onError: contentOnColor,
    surface: Color(0xFF111315),
    onSurface: backgroundPrimary,
    surfaceContainerHighest: Color(0xFF1D2024),
    outline: Color(0xFF34383D),
    outlineVariant: Color(0xFF2A2E32),
    shadow: Color(0x66000000),
    scrim: overlay,
    inverseSurface: backgroundPrimary,
    onInverseSurface: contentPrimary,
    inversePrimary: contentPrimary,
  );
}
