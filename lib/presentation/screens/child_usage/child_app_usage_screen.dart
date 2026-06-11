import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/widgets/progress_ring.dart';

/// ChildAppUsageScreen — detailed view of a single child's app usage.
///
/// Shows a hero percentage ring and a list of apps with session durations
/// and progress bars.
class ChildAppUsageScreen extends StatelessWidget {
  const ChildAppUsageScreen({
    super.key,
    required this.name,
    this.screenTimePercent = 53,
  });

  final String name;
  final double screenTimePercent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('$name - App Usage'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // ── Hero percentage ring ──────────────────────────
              Center(
                child: ProgressRing(
                  radius: 90,
                  strokeWidth: 12,
                  progress: screenTimePercent / 100,
                  gradientColors: const [
                    AppColors.warning,
                    AppColors.streak,
                  ],
                  backgroundColor: AppColors.grey200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${screenTimePercent.round()}%',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey800,
                        ),
                      ),
                      Text(
                        'Used',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),
              Center(
                child: Text(
                  '${screenTimePercent.round()}% of daily limit (4h)',
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: 28),

              // ── Section header ────────────────────────────────
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'App Usage Details',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 14),

              // ── App list ──────────────────────────────────────
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _apps.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final app = _apps[index];
                  return _AppUsageRow(model: app);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── App usage row ────────────────────────────────────────────────────
class _AppUsageRow extends StatelessWidget {
  const _AppUsageRow({required this.model});

  final _AppUsage model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = model.sessionMinutes / 120; // max 2h per app

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // App icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: model.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(model.icon, color: model.color, size: 22),
          ),
          const SizedBox(width: 12),

          // Title + progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.name, style: theme.textTheme.titleSmall),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: AppColors.grey200,
                    valueColor: AlwaysStoppedAnimation<Color>(model.color),
                    minHeight: 5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Duration
          Text(
            '${model.sessionMinutes} min',
            style: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

// ── Model ────────────────────────────────────────────────────────────
class _AppUsage {
  const _AppUsage({
    required this.name,
    required this.icon,
    required this.color,
    required this.sessionMinutes,
  });

  final String name;
  final IconData icon;
  final Color color;
  final int sessionMinutes;
}

const List<_AppUsage> _apps = [
  _AppUsage(
    name: 'YouTube Kids',
    icon: Icons.smart_display_outlined,
    color: Color(0xFFFF0000),
    sessionMinutes: 45,
  ),
  _AppUsage(
    name: 'Duolingo',
    icon: Icons.language,
    color: Color(0xFF58CC02),
    sessionMinutes: 30,
  ),
  _AppUsage(
    name: 'Minecraft',
    icon: Icons.grid_on,
    color: Color(0xFF795548),
    sessionMinutes: 25,
  ),
  _AppUsage(
    name: 'Spotify',
    icon: Icons.music_note_outlined,
    color: Color(0xFF1DB954),
    sessionMinutes: 20,
  ),
  _AppUsage(
    name: 'Khan Academy',
    icon: Icons.school_outlined,
    color: Color(0xFF0D7C86),
    sessionMinutes: 15,
  ),
];
