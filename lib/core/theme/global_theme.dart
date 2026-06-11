import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/core/constants/app_assets.dart';

/// Provides [ThemeData] for light and dark mode using Material 3.
class GlobalTheme {
  GlobalTheme._();

  // ── Light Theme ──────────────────────────────────────────────────
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      secondary: AppColors.secondary,
      surface: AppColors.backgroundLight,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,

      // ── AppBar ───────────────────────────────────────────────────
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.grey800,
        titleTextStyle: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.grey800,
        ),
      ),

      // ── Card ─────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: AppColors.primary.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        margin: EdgeInsets.zero,
      ),

      // ── Navigation Bar ───────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        elevation: 2,
        backgroundColor: Colors.white,
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontFamily: AppAssets.fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            );
          }
          return const TextStyle(
            fontFamily: AppAssets.fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grey400,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 24);
          }
          return const IconThemeData(color: AppColors.grey400, size: 24);
        }),
      ),

      // ── Tab Bar ──────────────────────────────────────────────────
      tabBarTheme: const TabBarThemeData(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.grey400,
        indicatorColor: AppColors.primary,
        labelStyle: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ── Floating Action Button ───────────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: CircleBorder(),
      ),

      // ── Elevated Button ──────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontFamily: AppAssets.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ── Chip ─────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariant,
        labelStyle: const TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: BorderSide.none,
      ),

      // ── Text Theme ───────────────────────────────────────────────
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 57,
          fontWeight: FontWeight.bold,
          color: AppColors.grey800,
        ),
        displayMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: AppColors.grey800,
        ),
        displaySmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.grey800,
        ),
        headlineLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.grey800,
        ),
        headlineMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.grey800,
        ),
        headlineSmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.grey800,
        ),
        titleLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.grey800,
        ),
        titleMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.grey800,
        ),
        titleSmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.grey800,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grey800,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey600,
        ),
        bodySmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.grey400,
        ),
        labelLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.grey800,
        ),
        labelMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.grey600,
        ),
        labelSmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.grey400,
        ),
      ),

      // ── Divider ──────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.grey200,
        thickness: 1,
        space: 0,
      ),
    );
  }

  // ── Dark Theme ───────────────────────────────────────────────────
  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      secondary: AppColors.secondary,
      surface: AppColors.surfaceDark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,

      // ── AppBar ───────────────────────────────────────────────────
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // ── Card ─────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.surfaceDark,
        margin: EdgeInsets.zero,
      ),

      // ── Navigation Bar ───────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        elevation: 2,
        backgroundColor: AppColors.surfaceDark,
        indicatorColor: AppColors.primary.withValues(alpha: 0.2),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontFamily: AppAssets.fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            );
          }
          return const TextStyle(
            fontFamily: AppAssets.fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grey400,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryLight, size: 24);
          }
          return const IconThemeData(color: AppColors.grey400, size: 24);
        }),
      ),

      // ── Tab Bar ──────────────────────────────────────────────────
      tabBarTheme: const TabBarThemeData(
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.grey400,
        indicatorColor: AppColors.primaryLight,
        labelStyle: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ── Floating Action Button ───────────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: CircleBorder(),
      ),

      // ── Elevated Button ──────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontFamily: AppAssets.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ── Chip ─────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.primary.withValues(alpha: 0.2),
        labelStyle: const TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryLight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: BorderSide.none,
      ),

      // ── Text Theme ───────────────────────────────────────────────
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 57,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFFE5E7EB),
        ),
        bodyMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey400,
        ),
        bodySmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.grey600,
        ),
        labelLarge: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.grey400,
        ),
        labelSmall: TextStyle(
          fontFamily: AppAssets.fontFamily,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.grey600,
        ),
      ),

      // ── Divider ──────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: Color(0xFF2E2E3E),
        thickness: 1,
        space: 0,
      ),
    );
  }
}
