import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/services.dart';

class UITheme {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: UIColors.transparent,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      bottomSheetTheme: _lightBottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      chipTheme: _chipTheme,
      dividerColor: UIColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
      appBarTheme: _lightAppBarTheme,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
    );
  }

  final ColorScheme colorScheme = const ColorScheme(
    primary: UIColors.backgroundDark,
    error: UIColors.red,
    secondary: UIColors.orange,
    background:
        UIColors.backgroundDark, // Replace with your desired background color
    onPrimary: Colors.white, // Replace with your desired text color on primary
    onSecondary: Colors.black,
    onError: Colors.red,
    onBackground: UIColors.backgroundDark,
    brightness: Brightness.light,
    surface: UIColors.orange,
    onSurface: UIColors.backgroundDark,
  );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => UIColors.backgroundDark;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: UIColors.backgroundDark,
      toolbarTextStyle: _lightTextTheme.titleLarge,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: UIColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: UIColors.outlineLight,
      space: UISpacing.lg,
      thickness: UISpacing.xxxs,
      indent: UISpacing.lg,
      endIndent: UISpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// The UI text theme based on [UITextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: UITextStyle.headline1,
    displayMedium: UITextStyle.headline2,
    displaySmall: UITextStyle.headline3,
    titleMedium: UITextStyle.subtitle1,
    titleSmall: UITextStyle.subtitle2,
    bodyLarge: UITextStyle.bodyText1,
    bodyMedium: UITextStyle.bodyText2,
    labelLarge: UITextStyle.button,
    bodySmall: UITextStyle.caption,
    labelSmall: UITextStyle.overline,
  ).apply(
    bodyColor: UIColors.white,
    displayColor: UIColors.white,
    decorationColor: UIColors.white,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: UIColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: UIColors.secondary.shade700,
      secondarySelectedColor: UIColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: UITextStyle.button.copyWith(color: UIColors.black),
      secondaryLabelStyle:
          UITextStyle.labelSmall.copyWith(color: UIColors.white),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UISpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: UISpacing.lg),
      buttonColor: UIColors.blue,
      disabledColor: UIColors.lightGrey,
      height: 48,
      minWidth: 48,
    );
  }

  /// Returns the correct [ElevatedButtonThemeData] based on the current theme.
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.symmetric(vertical: UISpacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: UIFontWeight.bold,
        ),
        backgroundColor: UIColors.orange,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: UIFontWeight.light,
        ),
        foregroundColor: UIColors.black,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: UIColors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(UISpacing.lg),
          topRight: Radius.circular(UISpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: UIColors.onBackground,
      contentPadding: EdgeInsets.all(UISpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return UIColors.darkAqua;
        }
        return UIColors.black;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return UIColors.primaryContainer;
        }
        return UIColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: UIColors.darkAqua,
      circularTrackColor: UIColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: UITextStyle.button,
      labelColor: UIColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: UISpacing.lg,
        vertical: UISpacing.md + UISpacing.xxs,
      ),
      unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: UIColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: UIColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: UIColors.backgroundDark,
      selectedItemColor: UIColors.white,
      unselectedItemColor: UIColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => UIColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: UISpacing.xlg,
            vertical: UISpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? UITextStyle.button.copyWith(
                  color: UIColors.black,
                  fontWeight: FontWeight.w500,
                )
              : UITextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? UIColors.black
                      : UIColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
