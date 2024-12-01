import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextTheme {
  static TextTheme textTheme = TextTheme(
    // Títulos grandes
    displayLarge: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),

    // Títulos médios
    headlineMedium: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),

    // Corpo do texto
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    ),

    // Subtítulos
    titleLarge: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),

    // Botões
    labelLarge: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),

    // Legendas
    bodySmall: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
  );
}
