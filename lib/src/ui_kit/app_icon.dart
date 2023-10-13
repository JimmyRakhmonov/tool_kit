import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tool_kit/src/constants/sapces.dart';
import 'package:tool_kit/src/extensions/context.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon,
      {super.key,
      this.color,
      this.height,
      this.width,
      this.label,
      this.onTap,
      this.borderColor,
      this.shape = BoxShape.rectangle,
      this.padding,
      this.radius,
      this.bgColor,
      this.showBgLayer = false,
      this.boxHeight,
      this.boxWidth,
      this.borderWidth,
      this.labelDirection = Axis.vertical,
      this.emptySpace,
      this.labelStyle,
      this.visible = true});

  final String icon;
  final Color? color, borderColor, bgColor;
  final double? height,
      width,
      boxHeight,
      boxWidth,
      radius,
      borderWidth,
      emptySpace;
  final String? label;
  final void Function()? onTap;
  final BoxShape shape;
  final EdgeInsets? padding;
  final bool showBgLayer;
  final Axis labelDirection;
  final TextStyle? labelStyle;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: labelDirection == Axis.vertical
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        if (showBgLayer && bgColor != null)
                          Positioned(
                              left: -4,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: bgColor!.withOpacity(.4),
                                    shape: BoxShape.circle),
                              )),
                        Container(
                          height: boxHeight,
                          width: boxWidth,
                          padding: padding,
                          decoration: BoxDecoration(
                              color: bgColor,
                              border: borderColor == null
                                  ? null
                                  : Border.all(
                                      width: borderWidth ?? 1,
                                      color: borderColor!),
                              shape: shape,
                              borderRadius:
                                  shape == BoxShape.rectangle && radius != null
                                      ? BorderRadius.circular(radius!)
                                      : null),
                          child: SvgPicture.asset(
                            icon,
                            height: height,
                            width: width,
                            colorFilter: color == null
                                ? null
                                : ColorFilter.mode(color!, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                    if (label != null) ...[
                      emptySpace != null
                          ? SizedBox(width: emptySpace)
                          : verticalSpace14,
                      Text(
                        label!,
                        style: context.titleSmall,
                      )
                    ]
                  ],
                )
              : Row(children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      if (showBgLayer && bgColor != null)
                        Positioned(
                            left: -4,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  color: bgColor!.withOpacity(.4),
                                  shape: BoxShape.circle),
                            )),
                      Container(
                        height: boxHeight,
                        width: boxWidth,
                        padding: padding,
                        decoration: BoxDecoration(
                            color: bgColor,
                            border: borderColor == null
                                ? null
                                : Border.all(
                                    width: borderWidth ?? 1,
                                    color: borderColor!),
                            shape: shape,
                            borderRadius:
                                shape == BoxShape.rectangle && radius != null
                                    ? BorderRadius.circular(radius!)
                                    : null),
                        child: SvgPicture.asset(
                          icon,
                          height: height,
                          width: width,
                          colorFilter: color == null
                              ? null
                              : ColorFilter.mode(color!, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                  if (label != null) ...[
                    emptySpace != null
                        ? SizedBox(width: emptySpace)
                        : horizontalSpace6,
                    Text(label!, style: labelStyle ?? context.titleSmall)
                  ]
                ])),
    );
  }
}
