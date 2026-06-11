import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/widgets/custom_card.dart';
import 'package:pokus/presentation/widgets/timeline_widget.dart';

/// CommuteScreen — trip planner with milestone tracker, map placeholder,
/// and live trip metrics grid.
class CommuteScreen extends StatelessWidget {
  const CommuteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commute'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Trip timeline ─────────────────────────────────
              Text('Active Trip', style: theme.textTheme.titleLarge),
              const SizedBox(height: 10),
              const TimelineWidget(items: _milestones),

              const SizedBox(height: 20),

              // ── Map placeholder ───────────────────────────────
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.surfaceVariant,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined,
                        size: 56, color: AppColors.primary.withValues(alpha: 0.4)),
                    const SizedBox(height: 8),
                    Text(
                      'Route View',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: AppColors.grey600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Home → Office · 12.4 km',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── Trip metrics 2×2 grid ─────────────────────────
              Text('Trip Metrics', style: theme.textTheme.titleLarge),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.35,
                children: [
                  CustomCard(
                    child: _MetricTile(
                      icon: Icons.timer_outlined,
                      label: 'ETA',
                      value: '8:42 AM',
                      color: AppColors.primary,
                    ),
                  ),
                  CustomCard(
                    child: _MetricTile(
                      icon: Icons.speed,
                      label: 'Duration',
                      value: '24 min',
                      color: AppColors.secondary,
                    ),
                  ),
                  CustomCard(
                    child: _MetricTile(
                      icon: Icons.route_outlined,
                      label: 'Distance',
                      value: '12.4 km',
                      color: AppColors.warning,
                    ),
                  ),
                  CustomCard(
                    child: _MetricTile(
                      icon: Icons.traffic_outlined,
                      label: 'Traffic',
                      value: 'Moderate',
                      color: AppColors.streak,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Metric tile contents ─────────────────────────────────────────────
class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const Spacer(),
        Text(value, style: theme.textTheme.titleMedium),
        const SizedBox(height: 2),
        Text(label, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

// ── Milestone data ───────────────────────────────────────────────────
const List<TimelineItem> _milestones = [
  TimelineItem(
    title: 'Home',
    subtitle: '123 Main Street',
    time: 'Departed 8:18 AM',
    isCompleted: true,
  ),
  TimelineItem(
    title: 'School drop-off',
    subtitle: 'Lincoln Elementary',
    time: 'Passed 8:30 AM',
    isCompleted: true,
  ),
  TimelineItem(
    title: 'Office',
    subtitle: 'Tech Park, Building C',
    time: 'ETA 8:42 AM',
    isCompleted: false,
  ),
];
