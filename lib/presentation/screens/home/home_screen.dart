import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/widgets/custom_card.dart';
import 'package:pokus/presentation/screens/overview/overview_screen.dart';
import 'package:pokus/presentation/screens/alerts/alerts_screen.dart';

/// HomeScreen — the landing tab of the Pokus app.
///
/// Light theme. Contains a greeting hero section, Today's Focus banner,
/// and stats row with Productivity Score + Focus Streak.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokus'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AlertsScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Hero greeting ────────────────────────────────
              const _GreetingHero(),

              const SizedBox(height: 24),

              // ── Today's Focus banner ─────────────────────────
              const _TodaysFocusBanner(),

              const SizedBox(height: 20),

              // ── Stats row ────────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const OverviewScreen()),
                        );
                      },
                      child: const _ProductivityScoreCard(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomCard(
                      child: const _FocusStreakCard(),
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

// ── Greeting Hero ────────────────────────────────────────────────────
class _GreetingHero extends StatelessWidget {
  const _GreetingHero();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good morning, Alex! 👋",
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Stay focused. Build habits that last.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 18),
        // Placeholder illustration block
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFFEEF2FF), Color(0xFFF4F0FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.rocket_launch_rounded,
              size: 48,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Today's Focus Banner ─────────────────────────────────────────────
class _TodaysFocusBanner extends StatelessWidget {
  const _TodaysFocusBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.center_focus_strong,
                color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Focus",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Deep Work — 2 sessions planned',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.white70, size: 18),
        ],
      ),
    );
  }
}

// ── Productivity Score Card (85%) ────────────────────────────────────
class _ProductivityScoreCard extends StatelessWidget {
  const _ProductivityScoreCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.trending_up, color: AppColors.primary, size: 20),
            const SizedBox(width: 6),
            Text('Productivity', style: theme.textTheme.labelMedium),
          ],
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.85,
                  strokeWidth: 7,
                  backgroundColor: AppColors.grey200,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                ),
                Text(
                  '85',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            'Score',
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

// ── Focus Streak Card (7 days) ───────────────────────────────────────
class _FocusStreakCard extends StatelessWidget {
  const _FocusStreakCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.local_fire_department,
                color: AppColors.streak, size: 20),
            const SizedBox(width: 6),
            Text('Focus Streak', style: theme.textTheme.labelMedium),
          ],
        ),
        const SizedBox(height: 14),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.local_fire_department,
                  color: AppColors.streak, size: 36),
              const SizedBox(width: 4),
              Text(
                '7',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.streak,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            'days',
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
