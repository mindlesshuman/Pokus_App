import 'package:flutter/material.dart';

/// Global color palette for the Pokus app.
class AppColors {
  AppColors._();

  // ── Primary palette ──────────────────────────────────────────────
  static const Color primary = Color(0xFF6B4EFF);
  static const Color primaryLight = Color(0xFF8F79FF);
  static const Color primaryDark = Color(0xFF4A35CC);

  // ── Secondary palette ────────────────────────────────────────────
  static const Color secondary = Color(0xFF10B981);
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF059669);

  // ── Warning / Amber ──────────────────────────────────────────────
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFBBF24);

  // ── Surfaces ─────────────────────────────────────────────────────
  static const Color surfaceVariant = Color(0xFFEEF2FF);
  static const Color surfaceDark = Color(0xFF1E1E2E);
  static const Color backgroundLight = Color(0xFFF8F9FC);
  static const Color backgroundDark = Color(0xFF121218);

  // ── Neutrals ─────────────────────────────────────────────────────
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey600 = Color(0xFF6B7280);
  static const Color grey800 = Color(0xFF374151);

  // ── Semantic ─────────────────────────────────────────────────────
  static const Color online = Color(0xFF10B981);
  static const Color offline = Color(0xFF9CA3AF);
  static const Color error = Color(0xFFEF4444);
  static const Color streak = Color(0xFFFF6B35);

  // ── Chart ────────────────────────────────────────────────────────
  static const Color chartBlue = Color(0xFF6B4EFF);
  static const Color chartGreen = Color(0xFF10B981);
  static const Color chartOrange = Color(0xFFF59E0B);
}
