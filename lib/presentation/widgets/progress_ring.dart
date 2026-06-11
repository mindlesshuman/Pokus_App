import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';

/// A gradient-stroke circular progress indicator with centered content.
///
/// Used by [FocusModeScreen] for the timer ring and
/// [ChildAppUsageScreen] for the screen-time ring.
class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.radius,
    required this.strokeWidth,
    required this.progress, // 0.0 – 1.0
    this.gradientColors = const [AppColors.primary, AppColors.secondary],
    this.backgroundColor,
    this.child,
  });

  final double radius;
  final double strokeWidth;
  final double progress;
  final List<Color> gradientColors;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.grey200;

    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          CustomPaint(
            size: Size(radius * 2, radius * 2),
            painter: _RingPainter(
              strokeWidth: strokeWidth,
              color: bg,
              progress: 1.0,
            ),
          ),
          // Foreground gradient arc
          CustomPaint(
            size: Size(radius * 2, radius * 2),
            painter: _GradientRingPainter(
              strokeWidth: strokeWidth,
              gradientColors: gradientColors,
              progress: progress.clamp(0.0, 1.0),
            ),
          ),
          // Center content
          if (child != null) child!,
        ],
      ),
    );
  }
}

// ── Solid background ring ────────────────────────────────────────────
class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.strokeWidth,
    required this.color,
    required this.progress,
  });

  final double strokeWidth;
  final Color color;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) =>
      color != oldDelegate.color || strokeWidth != oldDelegate.strokeWidth;
}

// ── Gradient arc ring ────────────────────────────────────────────────
class _GradientRingPainter extends CustomPainter {
  _GradientRingPainter({
    required this.strokeWidth,
    required this.gradientColors,
    required this.progress,
  });

  final double strokeWidth;
  final List<Color> gradientColors;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final gradient = SweepGradient(
      startAngle: -pi / 2, // start from top
      endAngle: 2 * pi - pi / 2,
      colors: gradientColors,
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(rect);

    // Draw arc from -90° clockwise
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _GradientRingPainter oldDelegate) =>
      progress != oldDelegate.progress ||
      strokeWidth != oldDelegate.strokeWidth;
}
