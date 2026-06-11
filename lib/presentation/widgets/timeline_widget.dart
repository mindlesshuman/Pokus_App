import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';

/// A vertical timeline widget with circle nodes.
///
/// Each [items] entry maps to a row containing a vertical line, a
/// filled/outlined circle dot, and a title + subtitle pair.
class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    super.key,
    required this.items,
  });

  /// Timeline entries to display.
  final List<TimelineItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isLast = index == items.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Left column: line + dot ─────────────────────────
              SizedBox(
                width: 32,
                child: Column(
                  children: [
                    // Vertical line (top half)
                    if (index > 0)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: AppColors.grey200,
                        ),
                      ),
                    // Dot
                    Container(
                      width: item.isCompleted ? 14 : 14,
                      height: item.isCompleted ? 14 : 14,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item.isCompleted
                            ? AppColors.secondary
                            : Colors.transparent,
                        border: Border.all(
                          color: item.isCompleted
                              ? AppColors.secondary
                              : AppColors.grey400,
                          width: 2,
                        ),
                      ),
                      child: item.isCompleted
                          ? const Icon(Icons.check,
                              size: 10, color: Colors.white)
                          : null,
                    ),
                    // Vertical line (bottom half)
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: AppColors.grey200,
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // ── Right column: text content ──────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.title,
                        style: theme.textTheme.titleSmall,
                      ),
                      if (item.subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          item.subtitle!,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                      if (item.time != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          item.time!,
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// A single entry in a [TimelineWidget].
class TimelineItem {
  const TimelineItem({
    required this.title,
    this.subtitle,
    this.time,
    this.isCompleted = false,
  });

  final String title;
  final String? subtitle;
  final String? time;
  final bool isCompleted;
}
