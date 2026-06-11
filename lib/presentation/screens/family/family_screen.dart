import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/screens/child_usage/child_app_usage_screen.dart';
import 'package:pokus/presentation/screens/focus/focus_mode_screen.dart';

/// FamilyScreen — tabbed hub for family management.
///
/// Uses a [DefaultTabController] with three tabs: Children, Activity Feed,
/// and Family Goals. The Children tab shows a list of family profiles.
class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Family'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Children'),
              Tab(text: 'Activity Feed'),
              Tab(text: 'Family Goals'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ChildrenTab(),
            _ActivityFeedTab(),
            _FamilyGoalsTab(),
          ],
        ),
      ),
    );
  }
}

// ── Children Tab ─────────────────────────────────────────────────────
class _ChildrenTab extends StatelessWidget {
  const _ChildrenTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: _children.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final child = _children[index];
        return _FamilyMemberTile(
          model: child,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChildAppUsageScreen(
                  name: child.name,
                  screenTimePercent: child.screenTimePercent,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ── Activity Feed Tab ────────────────────────────────────────────────
class _ActivityFeedTab extends StatelessWidget {
  const _ActivityFeedTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: _activities.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final act = _activities[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.surfaceVariant,
            child: Icon(act.icon, color: AppColors.primary, size: 20),
          ),
          title: Text(act.title, style: theme.textTheme.titleSmall),
          subtitle: Text(act.time, style: theme.textTheme.bodySmall),
          trailing: Icon(Icons.chevron_right, color: AppColors.grey400),
        );
      },
    );
  }
}

// ── Family Goals Tab ─────────────────────────────────────────────────
class _FamilyGoalsTab extends StatelessWidget {
  const _FamilyGoalsTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flag_outlined, size: 64, color: AppColors.grey400),
            const SizedBox(height: 16),
            Text(
              'Set family goals together',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Work towards shared milestones and celebrate achievements as a family.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Create First Goal'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Family Member Tile ───────────────────────────────────────────────
class _FamilyMemberTile extends StatelessWidget {
  const _FamilyMemberTile({required this.model, this.onTap});

  final _FamilyMember model;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOnline = model.isOnline;

    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // Avatar + presence dot
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.surfaceVariant,
                    child: Text(
                      model.emoji,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isOnline ? AppColors.online : AppColors.offline,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),

              // Name + screen time bar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(model.name, style: theme.textTheme.titleSmall),
                        const SizedBox(width: 6),
                        Text(
                          isOnline ? 'Online' : 'Offline',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: isOnline
                                ? AppColors.online
                                : AppColors.offline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: model.screenTimePercent / 100,
                              backgroundColor: AppColors.grey200,
                              valueColor:
                                  const AlwaysStoppedAnimation<Color>(
                                AppColors.warning,
                              ),
                              minHeight: 6,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${model.screenTimeHours}h',
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Streak
              Column(
                children: [
                  const Icon(Icons.local_fire_department,
                      color: AppColors.streak, size: 20),
                  Text(
                    '${model.streakDays}d',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
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

// ── Models ───────────────────────────────────────────────────────────
class _FamilyMember {
  const _FamilyMember({
    required this.name,
    required this.emoji,
    required this.isOnline,
    required this.screenTimeHours,
    required this.screenTimePercent,
    required this.streakDays,
  });

  final String name;
  final String emoji;
  final bool isOnline;
  final double screenTimeHours;
  final double screenTimePercent;
  final int streakDays;
}

const List<_FamilyMember> _children = [
  _FamilyMember(
    name: 'Emma',
    emoji: '👧',
    isOnline: true,
    screenTimeHours: 2.5,
    screenTimePercent: 53,
    streakDays: 12,
  ),
  _FamilyMember(
    name: 'Lucas',
    emoji: '👦',
    isOnline: true,
    screenTimeHours: 1.8,
    screenTimePercent: 38,
    streakDays: 5,
  ),
  _FamilyMember(
    name: 'Sarah',
    emoji: '👶',
    isOnline: false,
    screenTimeHours: 0.5,
    screenTimePercent: 12,
    streakDays: 0,
  ),
];

const List<_Activity> _activities = [
  _Activity(
    title: 'Emma completed her morning routine',
    time: '2 min ago',
    icon: Icons.check_circle_outline,
  ),
  _Activity(
    title: 'Lucas hit his reading goal',
    time: '1 hour ago',
    icon: Icons.menu_book,
  ),
  _Activity(
    title: 'New family challenge unlocked!',
    time: '3 hours ago',
    icon: Icons.emoji_events_outlined,
  ),
];

class _Activity {
  const _Activity({
    required this.title,
    required this.time,
    required this.icon,
  });

  final String title;
  final String time;
  final IconData icon;
}
