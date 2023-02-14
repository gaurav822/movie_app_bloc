import 'package:flutter/material.dart';

import 'app_string.dart';
import 'font_dimen.dart';

enum FontType { normal, medium, semibold, bold }

const List<Color> colorList = [
  Color(0xFFF4511E),
  Color(0xFFFDD835),
  Color(0xFF7CB342),
  Color(0xFF00ACC1),
  Color(0xFF673AB7),
  Color(0xFFE53935),
  Color(0xFFD81B60),
  Color(0xFF8E24AA),
  Color(0xFF3949AB),
  Color(0xFF1E88E5),
  Color(0xFF039BE5),
  Color(0xFF00ACC1),
  Color(0xFF00897B),
  Color(0xFF43A047),
  Color(0xFF7CB342),
  Color(0xFFC0CA33),
];

const headLine6 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
  overflow: TextOverflow.ellipsis,
);

const headLine5 = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

const headLine4 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);

const headLine3 = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);

const headLine2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);

const headLine1 = TextStyle(fontSize: 20, fontWeight: FontWeight.w900);

const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black54, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black12, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const errorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.redAccent),
);

const focusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
);

//Text Styles
/// displayLarge style
/// font size 57
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

displayLarge({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.displayLarge,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont,
        color: color);

/// displayMedium style
/// font size: 45 // Use for web
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

displayMedium({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.displayMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: color,
        fontFamily: AppString.appFont);

/// displaySmall style
/// font size: 36
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

displaySmall({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.displaySmall,
        fontWeight: getFontWeight(fontType),
        color: color,
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// headlineLarge style
/// font size: 32
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

headlineLarge({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineLarge,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: color,
        fontFamily: AppString.appFont);

/// headlineMedium style
/// font size: 28
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

headlineMedium({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: color,
        fontFamily: AppString.appFont);

/// headlineMedium style
/// font size: 24
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

headlineSmall({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineSmall,
        fontWeight: getFontWeight(fontType),
        color: color,
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// titleLarge style
/// font size: 22
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

titleLarge({color = Colors.black87, fontType = FontType.normal}) => TextStyle(
    fontSize: FontDimen.titleLarge,
    fontWeight: getFontWeight(fontType),
    color: color,
    overflow: TextOverflow.ellipsis,
    fontFamily: AppString.appFont);

/// titleMedium style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

titleMedium({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium,
        fontWeight: getFontWeight(fontType),
        color: color,
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// titleSmall style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

titleSmall({color = Colors.black87, fontType = FontType.normal}) => TextStyle(
    fontSize: FontDimen.titleSmall,
    color: color,
    fontWeight: getFontWeight(fontType),
    overflow: TextOverflow.ellipsis,
    fontFamily: AppString.appFont);

/// labelLarge style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

labelLarge({color = Colors.black87, fontType = FontType.normal}) => TextStyle(
    fontSize: FontDimen.labelLarge,
    fontWeight: getFontWeight(fontType),
    color: color,
    overflow: TextOverflow.ellipsis,
    fontFamily: AppString.appFont);

/// labelMedium style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

labelMedium({color = Colors.black87, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.labelMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: color,
        fontFamily: AppString.appFont);

/// labelSmall style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

labelSmall({color = Colors.black87, fontType = FontType.normal}) => TextStyle(
    fontSize: FontDimen.labelSmall,
    fontWeight: getFontWeight(fontType),
    color: color,
    overflow: TextOverflow.ellipsis,
    fontFamily: AppString.appFont);

/// labelSmall style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

bodyLarge({color = Colors.black87, fontType = FontType.normal}) => TextStyle(
    fontSize: FontDimen.bodyLarge,
    fontWeight: getFontWeight(fontType),
    overflow: TextOverflow.ellipsis,
    color: color,
    fontFamily: AppString.appFont);

/// bodyMedium style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

bodyMedium({color = Colors.black87, fontType = FontType.normal}) => TextStyle(
    fontSize: FontDimen.bodyLarge,
    fontWeight: getFontWeight(fontType),
    color: color,
    overflow: TextOverflow.ellipsis,
    fontFamily: AppString.appFont);

/// bodyMedium style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

bodySmall({color = Colors.black87, fontType = FontType.normal}) => TextStyle(
    fontSize: FontDimen.bodySmall,
    color: color,
    fontWeight: getFontWeight(fontType),
    overflow: TextOverflow.ellipsis,
    fontFamily: AppString.appFont);

FontWeight getFontWeight(FontType type) {
  switch (type) {
    case FontType.normal:
      return FontWeight.normal;
    case FontType.medium:
      return FontWeight.w400;
    case FontType.semibold:
      return FontWeight.w500;
    case FontType.bold:
      return FontWeight.bold;
    default:
      return FontWeight.normal;
  }
}
