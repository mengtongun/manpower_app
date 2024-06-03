/// Creating custom color palettes is part of creating a custom app. The idea is to create
/// your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
/// object with those colors you just defined.
///
/// Resource:
/// A good resource would be this website: http://mcg.mbitson.com/
/// You simply need to put in the color you wish to use, and it will generate all shades
/// for you. Your primary color will be the `500` value.
///
/// Color Creation:
/// In order to create the custom colors you need to create a `Map<int, Color>` object
/// which will have all the shade values. `const Color(0xFF...)` will be how you create
/// the colors. The six character hex code is what follows. If you wanted the color
/// #114488 or #D39090 as primary colors in your setting, then you would have
/// `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
///
/// Usage:
/// In order to use this newly created setting or even the colors in it, you would just
/// `import` this file in your project, anywhere you needed it.
/// `import 'path/to/setting.dart';`
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        colorScheme: colorScheme,
        textTheme: _textTheme,
        // Matches manifest.json colors and background color.
        primaryColor: const Color(0xFF030303),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          elevation: 0,
          iconTheme: IconThemeData(color: colorScheme.primary),
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.alphaBlend(
            _lightFillColor.withOpacity(0.80),
            _darkFillColor,
          ),
          contentTextStyle:
              _textTheme.titleMedium!.apply(color: _darkFillColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        )),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(color: colorScheme.error),
        ),
        datePickerTheme: DatePickerThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ));
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color.fromARGB(255, 14, 127, 234),
    primaryContainer: Color.fromARGB(255, 23, 136, 158),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color.fromARGB(255, 68, 145, 233),
    onSurface: Color.fromARGB(255, 65, 151, 238),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineMedium: GoogleFonts.nunito(fontWeight: _bold, fontSize: 20.0),
    headlineSmall: GoogleFonts.nunito(fontWeight: _medium, fontSize: 16.0),
    titleLarge: GoogleFonts.nunito(fontWeight: _bold, fontSize: 16.0),
    titleMedium: GoogleFonts.nunito(fontWeight: _medium, fontSize: 16.0),
    titleSmall: GoogleFonts.nunito(fontWeight: _bold, fontSize: 14.0),
    bodyLarge: GoogleFonts.nunito(fontWeight: _regular, fontSize: 14.0),
    bodyMedium: GoogleFonts.nunito(fontWeight: _regular, fontSize: 16.0),
    bodySmall: GoogleFonts.nunito(fontWeight: _semiBold, fontSize: 16.0),
    labelLarge: GoogleFonts.nunito(fontWeight: _semiBold, fontSize: 14.0),
    labelSmall: GoogleFonts.nunito(fontWeight: _medium, fontSize: 12.0),
  );
}
