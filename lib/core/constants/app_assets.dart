/// Central registry of asset paths used by the Pokus app.
///
/// Whenever a new image, icon, or font is added under `assets/`,
/// add its path here so all screens reference a single source of truth.
class AppAssets {
  AppAssets._();

  // ── Icons / Illustrations ────────────────────────────────────────
  static const String placeholderIllustration =
      'assets/illustrations/focus_placeholder.png';

  // ── Fonts ────────────────────────────────────────────────────────
  /// Set to null to use the system default sans-serif font.
  /// When the Inter .ttf files are added under assets/fonts/, change
  /// this back to 'Inter' and uncomment the fonts block in pubspec.yaml.
  static const String? fontFamily = null;
}
