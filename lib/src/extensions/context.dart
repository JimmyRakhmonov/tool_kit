import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension BuildContextEntension<T> on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mq => MediaQuery.of(this);

  // COLORS
  Color get primaryColor => theme.primaryColor;

  Color get primaryColorDark => theme.primaryColorDark;

  Color get primaryColorLight => theme.primaryColorLight;

  Color get primary => theme.colorScheme.primary;

  Color get onPrimary => theme.colorScheme.onPrimary;

  Color get secondary => theme.colorScheme.secondary;

  Color get onSecondary => theme.colorScheme.onSecondary;

  Color get cardColor => theme.cardColor;

  Color get errorColor => theme.colorScheme.error;

  Color get background => theme.colorScheme.background;

  // RESPONSIBILITY

  bool get isMobile => mq.size.width <= 500.0;

  bool get isTablet => mq.size.width < 1024.0 && mq.size.width >= 650.0;

  bool get isSmallTablet => mq.size.width < 650.0 && mq.size.width > 500.0;

  bool get isDesktop => mq.size.width >= 1024.0;

  bool get isSmall => mq.size.width < 850.0 && mq.size.width >= 560.0;

  double get width => mq.size.width;

  double get height => mq.size.height;

  Size get size => mq.size;

  bool get isLandscape => mq.orientation == Orientation.landscape;

  // TEXT STYLES
  TextStyle? get displayMedium => theme.textTheme.displayMedium;

  TextStyle? get displaySmall => theme.textTheme.displaySmall;

  TextStyle? get headlineLarge => theme.textTheme.headlineLarge;

  TextStyle? get headlineMedium => theme.textTheme.headlineMedium;

  TextStyle? get titleLarge => theme.textTheme.titleLarge;

  TextStyle? get titleMedium => theme.textTheme.titleMedium;

  TextStyle? get titleSmall => theme.textTheme.titleSmall;

  TextStyle? get labelLarge => theme.textTheme.labelLarge;

  TextStyle? get bodySmall => theme.textTheme.bodySmall;

  TextStyle? get titleTextStyle => theme.appBarTheme.titleTextStyle;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
      letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
      letterSpacing: 1.5,
      fontWeight: FontWeight.w700,
      fontSize: 13.0,
      height: 1.23);

  // POP UPS
  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? Colors.transparent,
      builder: (context) => Wrap(children: [child]),
    );
  }

  Future<T?> showCustomDialog(Widget dialog,
      {double? padding, Color? barrierColor}) {
    return showDialog(
        useSafeArea: false,
        context: this,
        barrierDismissible: true,
        barrierColor: barrierColor ?? Colors.black.withOpacity(.8),
        builder: (context) {
          return Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: dialog);
        });
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      dynamic message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: message is String ? Text(message) : message,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void removeSnackBar() {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }

  Future<bool?> showToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: primary,
      textColor: onPrimary,
    );
  }
}
