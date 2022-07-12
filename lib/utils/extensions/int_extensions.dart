extension IntExtension on int {
  bool inRange({required int lower, required int upper}) =>
      this > lower && this < upper;

  bool inRangeInclusive({required int lower, required int upper}) =>
      this >= lower && this <= upper;
}
