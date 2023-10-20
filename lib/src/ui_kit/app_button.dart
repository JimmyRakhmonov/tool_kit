import 'package:flutter/cupertino.dart';
import 'package:tool_kit/src/ui_kit/app_icon.dart';
import 'package:tool_kit/src/constants/durations.dart';
import 'package:tool_kit/src/constants/sapces.dart';

class AppButton extends StatefulWidget {
  const AppButton(
      {Key? key,
      this.padding,
      this.borderRadius,
      this.borderColor,
      this.fillColor,
      this.icon,
      this.height,
      this.width,
      required this.text,
      this.textStyle = const TextStyle(),
      required this.onPressed,
      this.isActive = true,
      this.textColor,
      this.shape,
      this.margin,
      this.isLoading = false,
      this.loadingColor,
      this.image,
      this.iconHeight,
      this.animate = false,
      this.visible = true})
      : super(key: key);

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final dynamic borderRadius;
  final Color? borderColor;
  final Color? fillColor;
  final Color? textColor;
  final Color? loadingColor;
  final bool isActive;
  final bool isLoading;
  final String? icon;
  final double? height;
  final double? width;
  final BoxShape? shape;
  final dynamic text;
  final TextStyle textStyle;
  final String? image;
  final void Function()? onPressed;
  final double? iconHeight;
  final bool animate;
  final bool visible;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: duration150,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onPressed() {
    if (widget.isActive && !widget.isLoading && widget.onPressed != null) {
      if (widget.animate) {
        _controller.forward();
        Future.delayed(duration150, () {
          _controller.reverse();
        });
      }
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: GestureDetector(
        onTap: onPressed,
        onLongPressStart: widget.isActive &&
                !widget.isLoading &&
                widget.onPressed != null &&
                widget.animate
            ? (details) => _controller.animateTo(.8)
            : null,
        onLongPressEnd: widget.isActive &&
                !widget.isLoading &&
                widget.onPressed != null &&
                widget.animate
            ? (details) => _controller.reverse()
            : null,
        behavior: HitTestBehavior.opaque,
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 1,
            end: .8,
          ).animate(_controller),
          child: Container(
              padding: widget.padding,
              margin: widget.margin,
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                  borderRadius: widget.borderRadius is BorderRadiusGeometry?
                      ? widget.borderRadius
                      : BorderRadius.circular(widget.borderRadius),
                  color:
                      widget.fillColor?.withAlpha(widget.isActive ? 255 : 100),
                  shape: widget.shape ?? BoxShape.rectangle,
                  border: widget.borderColor != null
                      ? Border.all(width: 1, color: widget.borderColor!)
                      : null),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.image != null) ...[
                    Image.asset(widget.image!, height: widget.iconHeight),
                    verticalSpace8
                  ],
                  if (widget.icon != null) ...[
                    AppIcon(widget.icon!, height: widget.iconHeight),
                    const SizedBox(
                      width: 12,
                    )
                  ],
                  widget.isLoading
                      ? CupertinoActivityIndicator(color: widget.loadingColor)
                      : widget.text is Widget
                          ? widget.text
                          : Text(widget.text,
                              style: widget.textStyle
                                  .copyWith(color: widget.textColor)),
                ],
              )),
        ),
      ),
    );
  }
}
