import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';

/// An interactive habit row with trailing check toggle.
///
/// Displays the habit name, progress fraction (e.g. "4/8 cups"),
/// and a tappable circle that toggles between unchecked/checked.
class HabitCheckItem extends StatelessWidget {
  const HabitCheckItem({
    super.key,
    required this.name,
    required this.progressText,
    this.progress, // 0.0–1.0, null to hide bar
    this.isCompleted = false,
    this.onToggle,
    this.icon = Icons.check,
    this.progressColor,
  });

  final String name;
  final String progressText;
  final double? progress;
  final bool isCompleted;
  final VoidCallback? onToggle;
  final IconData icon;
  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = progressColor ?? AppColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          // ── Left icon ────────────────────────────────────────────
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: activeColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: activeColor, size: 20),
          ),
          const SizedBox(width: 12),

          // ── Title + progress ─────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: theme.textTheme.titleSmall),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (progress != null)
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: progress!.clamp(0.0, 1.0),
                            backgroundColor: AppColors.grey200,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              activeColor,
                            ),
                            minHeight: 5,
                          ),
                        ),
                      ),
                    if (progress != null) const SizedBox(width: 10),
                    Text(
                      progressText,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isCompleted ? AppColors.secondary : null,
                        fontWeight:
                            isCompleted ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // ── Trailing toggle ──────────────────────────────────────
          GestureDetector(
            onTap: onToggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? activeColor : Colors.transparent,
                border: Border.all(
                  color: isCompleted ? activeColor : AppColors.grey400,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
