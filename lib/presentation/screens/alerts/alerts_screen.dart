import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';

/// AlertsScreen — notification feed with categorized icon badges.
///
/// Each alert row shows an icon badge, title, description, and relative
/// timestamp. Tapping clears it (removes from list in this demo).
class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  late final List<_Alert> _alerts = List.from(_demoAlerts);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Alerts'),
        actions: [
          if (_alerts.isNotEmpty)
            TextButton(
              onPressed: () => setState(() => _alerts.clear()),
              child: const Text('Clear All'),
            ),
        ],
      ),
      body: _alerts.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications_off_outlined,
                      size: 64, color: AppColors.grey400),
                  const SizedBox(height: 12),
                  Text('All caught up!',
                      style: theme.textTheme.titleMedium),
                ],
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              itemCount: _alerts.length,
              itemBuilder: (context, index) {
                final alert = _alerts[index];
                return Dismissible(
                  key: ValueKey(alert.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child:
                        const Icon(Icons.archive_outlined, color: AppColors.error),
                  ),
                  onDismissed: (_) {
                    setState(() => _alerts.removeAt(index));
                  },
                  child: _AlertTile(model: alert),
                );
              },
            ),
    );
  }
}

// ── Alert tile ───────────────────────────────────────────────────────
class _AlertTile extends StatelessWidget {
  const _AlertTile({required this.model});

  final _Alert model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon badge
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: model.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(model.icon, color: model.color, size: 22),
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: theme.textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(model.body, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 6),
                Text(model.time, style: theme.textTheme.labelSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Alert model ──────────────────────────────────────────────────────
class _Alert {
  const _Alert({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.color,
  });

  final String id;
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final Color color;
}

const List<_Alert> _demoAlerts = [
  _Alert(
    id: '1',
    title: 'Location update',
    body: 'Emma arrived at Lincoln Elementary.',
    time: '5 min ago',
    icon: Icons.location_on_outlined,
    color: AppColors.primary,
  ),
  _Alert(
    id: '2',
    title: 'Screen time limit reached',
    body: 'Lucas has used 90% of his daily screen time.',
    time: '30 min ago',
    icon: Icons.screen_lock_portrait_outlined,
    color: AppColors.warning,
  ),
  _Alert(
    id: '3',
    title: 'Habit completed! 🎉',
    body: 'You completed "Morning Meditation" for 7 days straight!',
    time: '1 hour ago',
    icon: Icons.check_circle_outline,
    color: AppColors.secondary,
  ),
  _Alert(
    id: '4',
    title: 'Commute alert',
    body: 'Traffic is heavier than usual on your route to the office.',
    time: '2 hours ago',
    icon: Icons.traffic_outlined,
    color: AppColors.streak,
  ),
  _Alert(
    id: '5',
    title: 'New family challenge',
    body: '"Weekend Cooking" challenge starts Friday. Join now!',
    time: 'Yesterday',
    icon: Icons.emoji_events_outlined,
    color: Color(0xFF8B5CF6),
  ),
  _Alert(
    id: '6',
    title: 'Weekly report ready',
    body: 'Your productivity score increased by 12% this week.',
    time: 'Yesterday',
    icon: Icons.assessment_outlined,
    color: AppColors.primary,
  ),
];
