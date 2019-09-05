class TimeUtil {
  /// Outputs year as four digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989), [yyyy]);
  ///     // => 1989
  static final String _yyyy = 'yyyy';

  /// Outputs year as two digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989), [yy]);
  ///     // => 89
  static final String _yy = 'yy';

  /// Outputs month as two digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 11), [mm]);
  ///     // => 11
  ///     formatDate(DateTime(1989, 5), [mm]);
  ///     // => 05
  // ignore: non_constant_identifier_names
  static final String _MM = 'MM';

  /// Outputs month compactly
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 11), [mm]);
  ///     // => 11
  ///     formatDate(DateTime(1989, 5), [m]);
  ///     // => 5
  // ignore: non_constant_identifier_names
  static final String _M = 'M';

  /// Outputs day as two digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 2, 21), [dd]);
  ///     // => 21
  ///     formatDate(DateTime(1989, 2, 5), [dd]);
  ///     // => 05
  static final String _dd = 'dd';

  /// Outputs day compactly
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 2, 21), [d]);
  ///     // => 21
  ///     formatDate(DateTime(1989, 2, 5), [d]);
  ///     // => 5
  static final String _d = 'd';

  /// Outputs week in month
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 2, 21), [w]);
  ///     // => 周四
  static final String _w = 'w';

  /// Outputs hour (0 - 11) as two digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15), [hh]);
  ///     // => 03
  static final String _hh = 'hh';

  /// Outputs hour (0 - 11) compactly
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15), [h]);
  ///     // => 3
  static final String _h = 'h';

  /// Outputs hour (0 to 23) as two digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15), [HH]);
  ///     // => 15
  // ignore: non_constant_identifier_names
  static final String _HH = 'HH';

  /// Outputs hour (0 to 23) compactly
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 5), [H]);
  ///     // => 5
  // ignore: non_constant_identifier_names
  static final String _H = 'H';

  /// Outputs minute as two digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15, 40), [nn]);
  ///     // => 40
  ///     formatDate(DateTime(1989, 02, 1, 15, 4), [nn]);
  ///     // => 04
  static final String _mm = 'mm';

  /// Outputs minute compactly
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15, 4), [n]);
  ///     // => 4
  static final String _m = 'm';

  /// Outputs second as two digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15, 40, 10), [ss]);
  ///     // => 10
  ///     formatDate(DateTime(1989, 02, 1, 15, 40, 5), [ss]);
  ///     // => 05
  static final String _ss = 'ss';

  /// Outputs second compactly
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15, 40, 5), [s]);
  ///     // => 5
  static final String _s = 's';

  /// Outputs millisecond as three digits
  ///
  /// Example:
  ///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 999), [SSS]);
  ///     // => 999
  ///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 99), [SS]);
  ///     // => 099
  ///     formatDate(DateTime(1989, 02, 1, 15, 40, 10, 0), [SS]);
  ///     // => 009
  // ignore: non_constant_identifier_names
  static final String _SSS = 'SSS';

  static _getWeekday(int weekDay) {
    switch (weekDay) {
      case 1:
        return '周一';
      case 2:
        return '周二';
      case 3:
        return '周三';
      case 4:
        return '周四';
      case 5:
        return '周五';
      case 6:
        return '周六';
      case 7:
        return '周日';
    }
  }

  static int now() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static getTime(timestamp, String format) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    if (format.contains(_yyyy)) {
      format = format.replaceAll(_yyyy, _digits(date.year, 4));
    }
    if (format.contains(_yy)) {
      format = format.replaceAll(_yy, _digits(date.year % 100, 2));
    }
    if (format.contains(_MM)) {
      format = format.replaceAll(_MM, _digits(date.month, 2));
    }
    if (format.contains(_M)) {
      format = format.replaceAll(_M, date.month.toString());
    }
    if (format.contains(_dd)) {
      format = format.replaceAll(_dd, _digits(date.day, 2));
    }
    if (format.contains(_d)) {
      format = format.replaceAll(_d, date.day.toString());
    }
    if (format.contains(_w)) {
      format = format.replaceAll(_w, _getWeekday(date.weekday));
    }
    if (format.contains(_HH)) {
      format = format.replaceAll(_HH, _digits(date.hour, 2));
    }
    if (format.contains(_H)) {
      format = format.replaceAll(_H, date.hour.toString());
    }
    if (format.contains(_hh)) {
      int hour = date.hour % 12;
      if (hour == 0) hour = 12;
      format = format.replaceAll(_hh, _digits(hour, 2));
    }
    if (format.contains(_h)) {
      int hour = date.hour % 12;
      if (hour == 0) hour = 12;
      format = format.replaceAll(_h, hour.toString());
    }
    if (format.contains(_mm)) {
      format = format.replaceAll(_mm, _digits(date.minute, 2));
    }
    if (format.contains(_m)) {
      format = format.replaceAll(_m, date.minute.toString());
    }
    if (format.contains(_ss)) {
      format = format.replaceAll(_ss, _digits(date.second, 2));
    }
    if (format.contains(_s)) {
      format = format.replaceAll(_s, date.second.toString());
    }
    if (format.contains(_SSS)) {
      format = format.replaceAll(_SSS, _digits(date.millisecond, 3));
    }
    return format;
  }

  static String _digits(int value, int length) {
    String ret = '$value';
    if (ret.length < length) {
      ret = '0' * (length - ret.length) + ret;
    }
    return ret;
  }

  /// year is today.
  /// 是否是今天.
  static bool isToday(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old = DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  /// 是否是昨天
  static bool isYesterday(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old = DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    now = now.add(Duration(days: -1));
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  /// get DateMilliseconds By DateStr.
  static int getDateMsByTimeStr(String dateStr) {
    DateTime dateTime = DateTime.tryParse(dateStr);
    return dateTime == null ? null : dateTime.millisecondsSinceEpoch;
  }

  /// get DateTime By Milliseconds.
  static DateTime getDateTimeByMs(int milliseconds, {bool isUtc = false}) {
    DateTime dateTime = new DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    return dateTime;
  }
}
