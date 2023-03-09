extension NumExtension on double? {
  String convertToPercentageString() {
    return ((this ?? 0) * 10).toStringAsFixed(0) + ' %';
  }
}