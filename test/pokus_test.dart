import 'package:flutter_test/flutter_test.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/core/theme/global_theme.dart';

void main() {
  test('AppColors constants should be correctly defined', () {
    expect(AppColors.primary, isNotNull);
    expect(AppColors.secondary, isNotNull);
    expect(AppColors.warning, isNotNull);
  });

  test('Light theme should use Material 3', () {
    final theme = GlobalTheme.light();
    expect(theme.useMaterial3, isTrue);
    expect(theme.brightness, Brightness.light);
  });

  test('Dark theme should use Material 3', () {
    final theme = GlobalTheme.dark();
    expect(theme.useMaterial3, isTrue);
    expect(theme.brightness, Brightness.dark);
  });
}
