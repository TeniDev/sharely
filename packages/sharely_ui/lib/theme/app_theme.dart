import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        colorScheme: _colorScheme,
        textTheme: _textTheme,
        useMaterial3: true,
        fontFamily: 'Lato',
        package: 'moment_ui',
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
        ),
      );
}

ColorScheme get _colorScheme {
  return const ColorScheme.light(
    primary: AppColors.primary,
    primaryContainer: AppColors.primaryBackground,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    surface: AppColors.white,
    onSurfaceVariant: AppColors.whiteAlt,
    shadow: AppColors.grey,
    scrim: AppColors.greyAlt,
    inverseSurface: AppColors.black,
    surfaceTint: AppColors.greenSuccess,
    surfaceContainer: AppColors.offWhite,
    onTertiary: AppColors.peachLight,
    onSecondaryContainer: AppColors.darkBlue,
    primaryFixed: AppColors.tagBackground,
  );
}

TextTheme get _textTheme {
  return TextTheme(
    titleLarge: AppStyles.header1,
    titleMedium: AppStyles.header2,
    titleSmall: AppStyles.header3,
    bodyLarge: AppStyles.header4,
    bodyMedium: AppStyles.button,
    bodySmall: AppStyles.paragraph,
    labelLarge: AppStyles.label1,
    labelMedium: AppStyles.label2,
  );
}
