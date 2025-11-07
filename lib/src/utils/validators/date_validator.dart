import 'package:intl/intl.dart';

/// Validates date-related operations
class RetCoreDateValidator {
  RetCoreDateValidator._();

  /// Check if a date string is valid
  static bool isValid(String dateString) {
    if (dateString.isEmpty) return false;

    try {
      DateTime.parse(dateString);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Check if a date string matches a specific format
  static bool isValidFormat(String dateString, String format) {
    if (dateString.isEmpty) return false;

    try {
      final _ = DateFormat(format).parseStrict(dateString);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Check if a date is in the past
  static bool isPast(DateTime dateTime) {
    return dateTime.isBefore(DateTime.now());
  }

  /// Check if a date is in the future
  static bool isFuture(DateTime dateTime) {
    return dateTime.isAfter(DateTime.now());
  }

  /// Check if a date is today
  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  /// Check if two dates are the same day
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Check if a date string represents an expired notification
  static bool isExpired(String isoDateString) {
    try {
      final dateTime = DateTime.parse(isoDateString).toLocal();
      return isPast(dateTime);
    } catch (_) {
      return false;
    }
  }
}
