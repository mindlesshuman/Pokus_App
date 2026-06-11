import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';

/// A styled card wrapper used throughout Pokus.
///
/// Applies [BorderRadius.circular(16)], a soft box-shadow, and white
/// background by default. Pass [color], [padding], [onTap], and [child]
/// to customise.
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.child,
    this.color,
    this.padding,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius,
  });

  final Widget? child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }
    return card;
  }
}
