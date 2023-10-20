import 'package:flutter/material.dart';
import 'package:tool_kit/tool_kit.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown(
      {super.key,
      required this.activeValue,
      required this.items,
      this.borderColor,
      this.borderWidth = 1,
      this.onTap,
      this.radius = 12,
      this.contentPadding,
      this.icon,
      this.style,
      this.border});

  final List<dynamic> items;
  final dynamic activeValue;
  final Color? borderColor;
  final double borderWidth;
  final double radius;
  final void Function(Object?)? onTap;
  final EdgeInsets? contentPadding;
  final Widget? icon;
  final TextStyle? style;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          enabledBorder: border ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? context.theme.colorScheme.outline,
                      width: borderWidth),
                  borderRadius: BorderRadius.circular(radius)),
          contentPadding:
              contentPadding ?? const EdgeInsets.symmetric(horizontal: 16)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: activeValue,
            borderRadius: BorderRadius.circular(radius),
            icon: icon,
            padding: EdgeInsets.zero,
            elevation: 0,
            items: items
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value, style: style),
                  ),
                )
                .toList(),
            onChanged: onTap),
      ),
    );
  }
}
