import 'package:flutter/material.dart';
import 'package:tool_kit/src/constants/durations.dart';
import 'package:tool_kit/src/constants/sapces.dart';
import 'package:tool_kit/src/extensions/context.dart';

class AppCard extends StatelessWidget {
  const AppCard(
      {super.key,
      this.padding,
      this.child,
      this.borderColor,
      this.borderRadius,
      this.showShadow = true,
      this.height,
      this.width,
      this.alignment,
      this.fillColor,
      this.items,
      this.margin,
      this.onTap,
      this.borderWidth,
      this.label,
      this.labelStyle,
      this.subTitle,
      this.dividerColor,
      this.showDivider = false});

  final double? height, width, borderWidth;
  final EdgeInsets? padding, margin;
  final Color? borderColor, fillColor;
  final bool showShadow;
  final Alignment? alignment;
  final Widget? child;
  final List<Widget>? items;
  final dynamic borderRadius;
  final void Function()? onTap;
  final String? label;
  final TextStyle? labelStyle;
  final Widget? subTitle;
  final Color? dividerColor;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(label!, style: labelStyle),
            verticalSpace8
          ],
          AnimatedContainer(
            duration: duration300,
            margin: margin,
            padding: padding,
            height: height,
            width: width,
            alignment: alignment,
            decoration: BoxDecoration(
                borderRadius: borderRadius is double || borderRadius is int
                    ? BorderRadius.circular(
                        double.parse(borderRadius.toString()))
                    : borderRadius,
                color: fillColor ?? Theme.of(context).cardColor,
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                      color: context.bodyLarge!.color!.withOpacity(.04),
                      blurRadius: 26,
                      offset: const Offset(0, 0),
                    )
                ],
                border: borderColor != null
                    ? Border.all(width: borderWidth ?? 1, color: borderColor!)
                    : null),
            child: items == null
                ? child
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(items?.length ?? 0, (index) {
                      return Column(
                        children: [
                          items![index],
                          if (index != items!.length - 1 && showDivider)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(height: 0, color: dividerColor),
                            )
                        ],
                      );
                    }),
                  ),
          ),
          if (subTitle != null) ...[verticalSpace8, subTitle!]
        ],
      ),
    );
  }
}
