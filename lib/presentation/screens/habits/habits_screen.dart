import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/widgets/habit_check_item.dart';

/// HabitsScreen — interactive habit tracker with date navigator and FAB.
///
/// Shows a horizontal date strip, a scrollable list of toggleable habit
/// rows, and a floating action button labelled "+ Add Habit".
class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  /// Toggle state of each habit (by index).
  final List<bool> _completions = [true, true, true, true, false, true, false];

  int _selectedDateIndex = 3; // highlight "today"

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ── Date navigator ─────────────────────────────────
            SizedBox(
              height: 68,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _dates.length,
                itemBuilder: (context, index) {
                  final date = _dates[index];
                  final selected = index == _selectedDateIndex;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDateIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 52,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary
                            : theme.cardColor,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: selected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary
                                      .withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : [],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date.day,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  selected ? Colors.white : AppColors.grey800,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            date.weekday,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color:
                                  selected ? Colors.white70 : AppColors.grey400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // ── Habit list ─────────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _habits.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final habit = _habits[index];
                  return HabitCheckItem(
                    name: habit.name,
                    progressText: habit.progressText,
                    progress: habit.progress,
                    isCompleted: _completions[index],
                    onToggle: () {
                      setState(() => _completions[index] = !_completions[index]);
                    },
                    icon: habit.icon,
                    progressColor: habit.color,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ── FAB ─────────────────────────────────────────────────
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Habit'),
      ),
    );
  }
}

// ── Date model ───────────────────────────────────────────────────────
class _DateItem {
  const _DateItem({required this.day, required this.weekday});
  final String day;
  final String weekday;
}

const List<_DateItem> _dates = [
  _DateItem(day: '08', weekday: 'Mon'),
  _DateItem(day: '09', weekday: 'Tue'),
  _DateItem(day: '10', weekday: 'Wed'),
  _DateItem(day: '11', weekday: 'Thu'),
  _DateItem(day: '12', weekday: 'Fri'),
  _DateItem(day: '13', weekday: 'Sat'),
  _DateItem(day: '14', weekday: 'Sun'),
];

// ── Habit model ──────────────────────────────────────────────────────
class _Habit {
  const _Habit({
    required this.name,
    required this.progressText,
    required this.progress,
    required this.icon,
    this.color,
  });

  final String name;
  final String progressText;
  final double progress;
  final IconData icon;
  final Color? color;
}

const List<_Habit> _habits = [
  _Habit(
    name: 'Drink Water',
    progressText: '4/8 cups',
    progress: 0.5,
    icon: Icons.water_drop_outlined,
    color: Color(0xFF3B82F6),
  ),
  _Habit(
    name: 'Morning Meditation',
    progressText: '10/10 min',
    progress: 1.0,
    icon: Icons.self_improvement_outlined,
    color: Color(0xFF8B5CF6),
  ),
  _Habit(
    name: 'Read for 30 min',
    progressText: '15/30 min',
    progress: 0.5,
    icon: Icons.menu_book_outlined,
    color: Color(0xFFF59E0B),
  ),
  _Habit(
    name: 'Exercise',
    progressText: '0/45 min',
    progress: 0.0,
    icon: Icons.fitness_center_outlined,
    color: AppColors.secondary,
  ),
  _Habit(
    name: 'No sugar challenge',
    progressText: 'Day 4/7',
    progress: 0.57,
    icon: Icons.no_food_outlined,
    color: Color(0xFFEF4444),
  ),
  _Habit(
    name: 'Journal writing',
    progressText: '✓ Done',
    progress: 1.0,
    icon: Icons.edit_note_outlined,
    color: Color(0xFF6B4EFF),
  ),
  _Habit(
    name: 'Evening stretch',
    progressText: '10/15 min',
    progress: 0.67,
    icon: Icons.accessibility_new_outlined,
    color: Color(0xFF06B6D4),
  ),
];
