import 'package:flutter/material.dart';

/// Centralized color palette for the app.
/// Defines both light and dark theme colors.
class ColorManager {
  ColorManager._();

  // ===== Primary Colors =====
  static const Color primary = Color(0xFF7CF03D); // --main-color
  static const Color primaryLight = Color(0xFF9FF570);
  static const Color primaryDark = Color(0xFF5ABF25);

  // ===== Background Colors =====
  static const Color background = Color(0xFF1F242D); // --bg-color
  static const Color backgroundDark = Color(0xFF1F242D);
  static const Color scaffoldLight = Color(0xFF1F242D);
  static const Color scaffoldDark = Color(0xFF1F242D);
  static const Color secondBg = Color(0xFF323946); // --second-bg-color

  // ===== Text Colors =====
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xAAFFFFFF); // slightly transparent text
  static const Color titleText = Color(0xFFFFFFFF);
  static const Color titleText1 = Color(0xFFDDDDDD);
  static const Color subtitleText = Color(0xFFAAAAAA);
  static const Color subtitleText1 = Color(0xFF999999);
  static const Color mediumText = Color(0xFFEEEEEE);

  // ===== Button & Label Colors =====
  static const Color buttonText = Color(0xFF1F242D); // button text used in btn
  static const Color hintText = Color(0xFF888888);

  // ===== Neutral Colors =====
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Colors.transparent;

  // ===== Border Colors =====
  static const Color borderColor = Color(0xFF323946);
  static const Color borderColor1 = Color(0xFF7CF03D);

  // ===== Container & Fill Colors =====
  static const Color containerColor = Color(0xFF323946);
  static const Color containerColor1 = Color(0xFF424A58);
  static const Color fillColor = Color(0xFF1F242D);

  // ===== Feedback Colors =====
  static const Color errorColor = Color(0xFFE25839);
  static const Color successColor = Color(0xFF388E3C);
  static const Color warningColor = Color(0xFFFFA000);
  static const Color infoColor = Color(0xFF1976D2);

  // ===== Utility Colors =====
  static const Color shadowColor = Color(0x33000000); // shadow
  static const Color dividerColor = Color(0xFF323946);
  static const Color overlayColor = Color(0x33000000); 
}
