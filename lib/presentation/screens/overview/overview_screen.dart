import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/widgets/custom_card.dart';
import 'package:pokus/presentation/widgets/stat_tile.dart';
import 'package:pokus/presentation/widgets/timeline_widget.dart';

/// OverviewScreen — detailed daily stats view.
///
/// Features a trend card with custom sparkline area, a 2×2 stat grid,
/// and a vertical timeline of today's schedule.
class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Overview'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Trend card ────────────────────────────────────
              const _TrendCard(),

              const SizedBox(height: 20),

              // ── "Today at a Glance" section label ─────────────
              Text(
                "Today at a Glance",
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 12),

              // ── 2×2 stat grid ────────────────────────────────
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.15,
                children: [
                  StatTile(
                    icon: Icons.screen_lock_portrait_outlined,
                    label: 'Screen Time',
                    value: '2h 15m',
                    progress: 0.45,
                    progressColor: AppColors.warning,
                  ),
                  StatTile(
                    icon: Icons.center_focus_strong_outlined,
                    label: 'Focus Time',
                    value: '1h 45m',
                    progress: 0.70,
                    progressColor: AppColors.primary,
                  ),
                  StatTile(
                    icon: Icons.check_circle_outline,
                    label: 'Habits Progress',
                    value: '6/8',
                    progress: 0.75,
                    progressColor: AppColors.secondary,
                  ),
                  StatTile(
                    icon: Icons.wb_sunny_outlined,
                    label: 'Morning Routine',
                    value: '80%',
                    progress: 0.80,
                    progressColor: AppColors.streak,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ── Timeline ──────────────────────────────────────
              Text(
                'Your Schedule',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              const TimelineWidget(items: _timelineItems),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Trend Card ───────────────────────────────────────────────────────
class _TrendCard extends StatelessWidget {
  const _TrendCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Trend',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              const Icon(Icons.show_chart, color: Colors.white70, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '+12% vs last week',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          // Sparkline placeholder
          CustomPaint(
            size: const Size(double.infinity, 48),
            painter: _SparklinePainter(),
          ),
        ],
      ),
    );
  }
}

/// Draws a simple upward-trending sparkline.
class _SparklinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final points = [0.7, 0.65, 0.68, 0.55, 0.6, 0.45, 0.5, 0.35, 0.4, 0.2];

    for (int i = 0; i < points.length; i++) {
      final x = size.width * i / (points.length - 1);
      final y = size.height * points[i];
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);

    // Draw dots
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final lastX = size.width;
    final lastY = size.height * 0.2;
    canvas.drawCircle(Offset(lastX, lastY), 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) => false;
}

// ── Demo timeline data ───────────────────────────────────────────────
const List<TimelineItem> _timelineItems = [
  TimelineItem(
    title: 'Morning meditation',
    subtitle: '10 min · Headspace',
    time: '7:00 AM',
    isCompleted: true,
  ),
  TimelineItem(
    title: 'Team stand-up',
    subtitle: 'Daily sync with engineering',
    time: '9:30 AM',
    isCompleted: true,
  ),
  TimelineItem(
    title: 'Deep work block',
    subtitle: '2h · No interruptions',
    time: '10:00 AM',
    isCompleted: true,
  ),
  TimelineItem(
    title: 'Lunch break',
    subtitle: '30 min',
    time: '12:00 PM',
    isCompleted: false,
  ),
  TimelineItem(
    title: 'Code review session',
    subtitle: '1h · Pair programming',
    time: '2:00 PM',
    isCompleted: false,
  ),
  TimelineItem(
    title: 'Evening walk',
    subtitle: '30 min · Outdoor',
    time: '5:30 PM',
    isCompleted: false,
  ),
];
