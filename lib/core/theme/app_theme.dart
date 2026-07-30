import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static const String fontFamily = 'Inter';

  static ThemeData get lightTheme => _theme(AppColors.lightColorScheme);

  static ThemeData get darkTheme => _theme(AppColors.darkColorScheme);

  static ThemeData _theme(ColorScheme colorScheme) {
    final isDark = colorScheme.brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      textTheme: _textTheme(colorScheme),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: _heading3Bold(colorScheme.onSurface),
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 20),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: AppColors.contentPrimary.withValues(alpha: 0.4),
        selectedLabelStyle: _caption2(colorScheme.onSurface),
        unselectedLabelStyle: _caption2(colorScheme.onSurface),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        height: 72,
        backgroundColor: colorScheme.surface,
        indicatorColor: AppColors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? colorScheme.onSurface
              : _mutedNavColor(isDark);
          return _caption2(color);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? colorScheme.onSurface
              : _mutedNavColor(isDark);
          return IconThemeData(color: color, size: 24);
        }),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surfaceContainerHighest,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        elevation: 0,
        pressElevation: 0,
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.onSurface,
        disabledColor: AppColors.backgroundDisabled,
        labelStyle: _body2Medium(colorScheme.onSurface),
        secondaryLabelStyle: _body2Medium(colorScheme.surface),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        hintStyle: _body3(AppColors.contentSecondary),
        labelStyle: _body2Medium(colorScheme.onSurface),
        prefixIconColor: AppColors.contentSecondary,
        suffixIconColor: AppColors.contentSecondary,
        border: _inputBorder(AppColors.transparent),
        enabledBorder: _inputBorder(AppColors.transparent),
        focusedBorder: _inputBorder(AppColors.borderFocus),
        errorBorder: _inputBorder(AppColors.error),
        focusedErrorBorder: _inputBorder(AppColors.error),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.onSurface,
          foregroundColor: colorScheme.surface,
          disabledBackgroundColor: AppColors.backgroundDisabled,
          disabledForegroundColor: AppColors.contentDisabled,
          textStyle: _heading3Bold(colorScheme.surface),
          minimumSize: const Size.fromHeight(52),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.onSurface,
          foregroundColor: colorScheme.surface,
          disabledBackgroundColor: AppColors.backgroundDisabled,
          disabledForegroundColor: AppColors.contentDisabled,
          textStyle: _heading3Bold(colorScheme.surface),
          minimumSize: const Size.fromHeight(52),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          disabledForegroundColor: AppColors.contentDisabled,
          side: BorderSide(color: colorScheme.outline),
          textStyle: _heading3Bold(colorScheme.onSurface),
          minimumSize: const Size.fromHeight(52),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          disabledForegroundColor: AppColors.contentDisabled,
          textStyle: _body2Medium(colorScheme.onSurface),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: colorScheme.surfaceContainerHighest,
          disabledForegroundColor: AppColors.contentDisabled,
          fixedSize: const Size.square(40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        shape: const CircleBorder(),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),
      dialogTheme: DialogThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        titleTextStyle: _heading2SemiBold(colorScheme.onSurface),
        contentTextStyle: _body1(AppColors.contentSecondary),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: _body2Medium(colorScheme.onInverseSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.zero,
        iconColor: colorScheme.onSurface,
        titleTextStyle: _heading2SemiBold(colorScheme.onSurface),
        subtitleTextStyle: _caption1(AppColors.contentSecondary),
      ),
    );
  }

  static TextTheme _textTheme(ColorScheme colorScheme) {
    final primary = colorScheme.onSurface;
    const secondary = AppColors.contentSecondary;
    const tertiary = AppColors.contentTertiary;

    return TextTheme(
      displayLarge: _heading1(primary),
      displayMedium: _heading2SemiBold(primary),
      displaySmall: _heading2ExtraBold(primary),
      headlineMedium: _heading2SemiBold(primary),
      headlineSmall: _heading3Bold(primary),
      titleLarge: _heading2SemiBold(primary),
      titleMedium: _heading3Medium(primary),
      titleSmall: _body2Medium(primary),
      bodyLarge: _body1(primary),
      bodyMedium: _body3(primary),
      bodySmall: _body2Medium(secondary),
      labelLarge: _heading3Bold(primary),
      labelMedium: _body2Medium(tertiary),
      labelSmall: _caption2(primary),
    );
  }

  static OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }

  static Color _mutedNavColor(bool isDark) {
    return isDark
        ? AppColors.contentTertiary
        : AppColors.contentPrimary.withValues(alpha: 0.4);
  }

  static TextStyle _heading1(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 1,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
    color: color,
  );

  static TextStyle _heading2SemiBold(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: color,
  );

  static TextStyle _heading2ExtraBold(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.2,
    color: color,
  );

  static TextStyle _heading3Bold(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle _heading3ExtraBold(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1,
    fontWeight: FontWeight.w800,
    color: color,
  );

  static TextStyle _heading3Medium(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 16 / 14,
    fontWeight: FontWeight.w500,
    color: color,
  );

  static TextStyle _body1(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle _body2Medium(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 14 / 12,
    fontWeight: FontWeight.w500,
    color: color,
  );

  static TextStyle _body3(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle _caption1(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    height: 12 / 10,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle _caption2(Color color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    height: 1,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle salePrice({double size = 14}) => TextStyle(
    fontFamily: fontFamily,
    fontSize: size,
    height: size == 20 ? 1 : 14 / size,
    fontWeight: FontWeight.w800,
    letterSpacing: size == 20 ? -0.2 : 0,
    color: AppColors.contentSale,
  );

  static TextStyle productPrice({double size = 14}) {
    return size == 20
        ? _heading2ExtraBold(AppColors.contentPrimary)
        : _heading3ExtraBold(AppColors.contentPrimary);
  }

  static TextStyle oldPrice() => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 14 / 12,
    fontWeight: FontWeight.w400,
    color: AppColors.contentTertiary,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.contentTertiary,
  );
}
