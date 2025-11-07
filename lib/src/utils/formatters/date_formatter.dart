import 'package:retcore_datetime/src/config/import.dart';

/// Handles formatting of DateTime objects into strings
class DateFormatter {
  DateFormatter._();

  /// Format a DateTime object with the specified format pattern
  static String format(DateTime dateTime, String format) {
    try {
      return DateFormat(format).format(dateTime);
    } catch (e) {
      throw FormatException('Failed to format DateTime with format: $format');
    }
  }

  /// Format a DateTime object with a specific locale.
  static String formatWithLocale(
    DateTime dateTime,
    String format,
    String locale,
  ) {
    try {
      return DateFormat(format, locale).format(dateTime);
    } catch (e) {
      throw FormatException(
        'Failed to format DateTime with format: $format and locale: $locale',
      );
    }
  }

  /// Format to ISO 8601 string (UTC with milliseconds)
  static String toIso8601(
    DateTime dateTime, {
    bool includeMilliseconds = true,
  }) {
    final utcDateTime = dateTime.toUtc();

    if (includeMilliseconds) {
      // Truncate microseconds
      final truncated = utcDateTime.subtract(
        Duration(microseconds: utcDateTime.microsecond),
      );
      String formatted = truncated.toIso8601String();

      // Ensure proper Z suffix
      formatted = formatted.replaceAllMapped(
        RegExp(r'(\.\d+)\+00:00$'),
        (match) => '${match[1]}Z',
      );

      return formatted;
    } else {
      return '${utcDateTime.toIso8601String().split('.').first}Z';
    }
  }

  /// Format to human-readable date (dd MMM yyyy)
  static String toReadableDate(DateTime dateTime) {
    return format(dateTime, DateFormatConstants.ddMMMyyyySpace);
  }

  /// Format to 12-hour time with AM/PM
  static String to12HourTime(DateTime dateTime) {
    return format(dateTime, DateFormatConstants.hhmma);
  }

  /// Format with relative day (Today, Yesterday, or date)
  static String toRelativeDate(DateTime dateTime, {bool includeTime = true}) {
    final now = DateTime.now();
    final localDateTime = dateTime.toLocal();

    final isToday =
        now.year == localDateTime.year &&
        now.month == localDateTime.month &&
        now.day == localDateTime.day;

    final isYesterday =
        now.subtract(const Duration(days: 1)).year == localDateTime.year &&
        now.subtract(const Duration(days: 1)).month == localDateTime.month &&
        now.subtract(const Duration(days: 1)).day == localDateTime.day;

    final time = includeTime ? ' at ${to12HourTime(localDateTime)}' : '';

    if (isToday) {
      return 'Today$time';
    } else if (isYesterday) {
      return 'Yesterday$time';
    } else {
      final date = format(localDateTime, DateFormatConstants.dMMMM);
      return '$date$time';
    }
  }

  /// Format for notifications (dd-MM-yyyy or relative)
  static String toNotificationDate(
    DateTime dateTime, {
    bool useRelative = false,
  }) {
    if (useRelative) {
      return toRelativeDate(dateTime, includeTime: false);
    }
    return format(dateTime.toLocal(), 'dd-MM-yyyy');
  }
}
