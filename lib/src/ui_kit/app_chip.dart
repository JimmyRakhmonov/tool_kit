import 'package:flutter/material.dart';
import 'package:tool_kit/src/constants/durations.dart';
import 'package:tool_kit/src/constants/sapces.dart';
import 'package:tool_kit/src/extensions/context.dart';
import 'package:tool_kit/src/ui_kit/app_icon.dart';

class AppChip extends StatelessWidget {
  const AppChip(
      {super.key,
      required this.value,
      this.label,
      this.icon,
      this.activeColor,
      this.disabledColor,
      this.activeLabelColor,
      this.disableLabelColor,
      this.onTap,
      this.style,
      this.padding,
      this.borderColor,
      this.shape = BoxShape.rectangle,
      this.iconBorderColor,
      this.iconPadding,
      this.iconSize,
      this.disableIconBorderColor,
      this.isActive = true,
      this.radius,
      this.trailing,
      this.size});

  final bool value;
  final String? label, icon;
  final TextStyle? style;
  final Color? activeColor,
      disabledColor,
      activeLabelColor,
      disableLabelColor,
      borderColor,
      iconBorderColor,
      disableIconBorderColor;
  final EdgeInsets? padding, iconPadding;
  final void Function()? onTap;
  final BoxShape shape;
  final bool isActive;
  final double? iconSize, radius;
  final dynamic trailing;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: isActive ? onTap : null,
      child: AnimatedContainer(
        duration: duration200,
        width: size?.width,
        height: size?.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 16),
            border: borderColor != null
                ? Border.all(width: 1, color: borderColor!)
                : null,
            color: value ? activeColor ?? context.primary : disabledColor),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              AppIcon(icon!,
                  height: iconSize ?? 14,
                  shape: shape,
                  padding: iconPadding,
                  borderColor: value ? iconBorderColor : disableIconBorderColor,
                  color: value
                      ? activeLabelColor ?? Colors.white
                      : disableLabelColor ?? context.primary),
            if (label != null && icon != null) horizontalSpace6,
            if (label != null)
              Text(
                label!,
                style: (style ?? context.labelLarge)?.copyWith(
                    color: value
                        ? activeLabelColor ?? Colors.white
                        : disableLabelColor ?? context.primary),
              ),
            if (trailing != null) ...[
              horizontalSpace4,
              trailing is String
                  ? AppIcon(trailing!,
                      height: iconSize ?? 14,
                      shape: shape,
                      padding: iconPadding,
                      borderColor:
                          value ? iconBorderColor : disableIconBorderColor,
                      color: value
                          ? activeLabelColor ?? Colors.white
                          : disableLabelColor ?? context.primary)
                  : trailing
            ]
          ],
        ),
      ),
    );
  }
}
