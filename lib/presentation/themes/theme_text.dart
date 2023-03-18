import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/core/app_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle? get _whiteHeadline6 => _poppinsTextTheme.titleLarge?.copyWith(
    fontSize: 20,
    color: Colors.white,
  );
  static getTextTheme() => TextTheme(
    titleLarge: _whiteHeadline6,
  );

}

extension ThemeTextExtension on TextTheme{
  TextStyle? get greySubtitle1 => subtitle1?.copyWith(
    color: Colors.grey,
  );

  TextStyle? get greyCaption => bodySmall?.copyWith(
    color: Colors.grey,
  );

  TextStyle? get violetHeadline6 => headline6?.copyWith(
    color: AppColor.violet.withOpacity(0.6),
  );

  TextStyle? get vulcanBodyText2 => bodyMedium?.copyWith(
    color: AppColor.vulcan,
    fontWeight: FontWeight.w600
  );
}