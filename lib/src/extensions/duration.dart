import 'dart:async';
import 'package:tool_kit/src/extensions/date.dart';

extension DurationExt on Duration {

  Future delay([FutureOr Function()? callback]) async => Future.delayed(this, callback);

   static const int daysPerWeek = 7;
  static const int nanosecondsPerMicrosecond = 1000;

  /// Returns the representation in weeks
  int get inWeeks => (inDays / daysPerWeek).ceil();

  /// Adds the Duration to the current DateTime and returns a DateTime in the future
  DateTime get fromNow => DateTime.now() + this;

  /// Subtracts the Duration from the current DateTime and returns a DateTime in the past
  DateTime get ago => DateTime.now() - this;

}