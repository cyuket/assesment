import 'package:flutter/material.dart';
import 'package:luvit/app/src/theme/colors.dart';

class LuvitTheme {
  static ThemeData dartTheme() {
    final theme = ThemeData.dark();
    final textTheme = theme.textTheme.copyWith();

    return theme.copyWith(
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: LuvitColors.backgroundColor,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: textTheme.displaySmall,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: LuvitColors.pureWhite,
        ),
      ),
      primaryIconTheme: theme.iconTheme.copyWith(
        color: LuvitColors.pureWhite,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: textTheme.labelLarge,
        ),
      ),
    );
  }
}
