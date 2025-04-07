class DateUtilities {
  DateUtilities._();

  static DateTime? parse(int? dt) => dt == null ? null : DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true);

  static int? toInt(DateTime? dt) => dt == null ? null : (dt.millisecondsSinceEpoch / 1000).toInt();
}
