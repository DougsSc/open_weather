class DateUtilities {
  DateUtilities._();

  static DateTime parse(int? dt) =>
      dt == null ? DateTime.now() : DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true);
}
