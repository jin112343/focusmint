import 'package:flutter/material.dart';

class AppColors {
  // プライマリカラー - ミントグリーン
  static const Color mintGreen = Color(0xFF00BFA5);
  static const Color mintGreenLight = Color(0xFF64FFDA);
  static const Color mintGreenDark = Color(0xFF00897B);
  
  // グレースケール
  static const Color backgroundColor = Colors.white;
  static const Color surfaceColor = Colors.white;
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  
  // フィードバックカラー
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFF9800);
  
  // シャドウ
  static const Color shadowColor = Color(0x1F000000);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.teal,
      primaryColor: AppColors.mintGreen,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.mintGreen,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      fontFamily: 'NotoSansJP',
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.mintGreen,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'NotoSansJP',
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: AppColors.mintGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        color: AppColors.surfaceColor,
        shadowColor: AppColors.shadowColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
      ),
    );
  }
}