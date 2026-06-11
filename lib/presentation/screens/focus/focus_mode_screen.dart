import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/widgets/progress_ring.dart';

/// FocusModeScreen — full-screen dark-themed focus timer.
///
/// Wraps its content in a dark [Theme] override. Displays a large
/// gradient progress ring with a 45:00 timer, a challenge chip, and
/// a prominent "Start Focus" CTA.
class FocusModeScreen extends StatelessWidget {
  const FocusModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 4,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Focus Mode'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // ── Timer ring ─────────────────────────────────
                Center(
                  child: ProgressRing(
                    radius: 120,
                    strokeWidth: 14,
                    progress: 0.45, // 27 min elapsed of 60
                    gradientColors: const [
                      AppColors.primary,
                      AppColors.primaryLight,
                      AppColors.secondary,
                    ],
                    backgroundColor: Colors.white12,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '45:00',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Focus Time',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // ── Challenge chip ─────────────────────────────
                Chip(
                  avatar: const Icon(
                    Icons.shield_outlined,
                    size: 18,
                    color: AppColors.primaryLight,
                  ),
                  label: const Text('No Social Media Challenge'),
                  backgroundColor:
                      AppColors.primary.withValues(alpha: 0.2),
                  labelStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryLight,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6, vertical: 4),
                ),

                const Spacer(flex: 2),

                // ── Start Focus CTA ────────────────────────────
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Start Focus'),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
