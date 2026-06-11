import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/widgets/custom_card.dart';

/// InsightsScreen — analytics dashboard with performance cards,
/// a weekly trend chart, and an achievement streak banner.
class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Performance cards row ─────────────────────────
              Text('Performance', style: theme.textTheme.titleLarge),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _metrics.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final m = _metrics[index];
                    return SizedBox(
                      width: 160,
                      child: CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(m.icon, color: m.color, size: 18),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    m.label,
                                    style: theme.textTheme.labelSmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              m.value,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                color: m.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              m.change,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: m.changeIsPositive
                                    ? AppColors.secondary
                                    : AppColors.error,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // ── Weekly trend chart ────────────────────────────
              Text('Weekly Trends', style: theme.textTheme.titleLarge),
              const SizedBox(height: 12),
              CustomCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Productivity',
                            style: theme.textTheme.titleSmall),
                        Text('+15%',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: AppColors.secondary,
                            )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: CustomPaint(
                        size: const Size(double.infinity, 100),
                        painter: _BarChartPainter(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                          .map(
                            (d) => Text(d,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: AppColors.grey400,
                                )),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Achievement banner ────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF59E0B), Color(0xFFFF6B35)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.emoji_events_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '7-Day Streak! 🔥',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'You\'ve been productive every day this week.',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Simple bar chart painter ─────────────────────────────────────────
class _BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bars = [0.55, 0.6, 0.7, 0.5, 0.75, 0.8, 0.9];
    final barWidth = (size.width - (6 * 8)) / 7;

    for (int i = 0; i < bars.length; i++) {
      final x = i * (barWidth + 8);
      final barHeight = size.height * bars[i];
      final y = size.height - barHeight;

      final paint = Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primaryLight],
        ).createShader(Rect.fromLTWH(x, y, barWidth, barHeight));

      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(x, y, barWidth, barHeight),
          topLeft: const Radius.circular(4),
          topRight: const Radius.circular(4),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BarChartPainter oldDelegate) => false;
}

// ── Metric model ─────────────────────────────────────────────────────
class _Metric {
  const _Metric({
    required this.label,
    required this.value,
    required this.change,
    required this.icon,
    required this.color,
    required this.changeIsPositive,
  });

  final String label;
  final String value;
  final String change;
  final IconData icon;
  final Color color;
  final bool changeIsPositive;
}

const List<_Metric> _metrics = [
  _Metric(
    label: 'Productivity',
    value: '85%',
    change: '+5% this week',
    icon: Icons.trending_up,
    color: AppColors.primary,
    changeIsPositive: true,
  ),
  _Metric(
    label: 'Screen Time',
    value: '3.2h',
    change: '-12% this week',
    icon: Icons.screen_lock_portrait_outlined,
    color: AppColors.warning,
    changeIsPositive: true,
  ),
  _Metric(
    label: 'Habit Score',
    value: '78%',
    change: '-3% this week',
    icon: Icons.check_circle_outline,
    color: AppColors.secondary,
    changeIsPositive: false,
  ),
];
