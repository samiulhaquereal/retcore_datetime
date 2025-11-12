import 'package:retcore_datetime/src/config/import.dart';

/// Handles parsing of date strings into DateTime objects
class RetCoreDateParser {
  RetCoreDateParser._();

  /// Parse a date string with automatic format detection
  /// Returns null if parsing fails
  static DateTime? parse(String dateString) {
    if (dateString.isEmpty) return null;

    final normalizedDateString = LocalizationUtils.normalizeToEnglish(
      dateString,
    );

    // Try ISO 8601 first (most common)
    try {
      return DateTime.parse(normalizedDateString);
    } catch (_) {
      // Continue to try other formats
    }

    // Try all supported formats
    for (final format in RetCoreDateFormat.allSupportedFormats) {
      try {
        return DateFormat(format).parseStrict(normalizedDateString);
      } catch (_) {
        continue;
      }
    }

    return null;
  }

  /// Parse with detailed detection result
  /// Returns DateDetectionResult with format information
  static DateDetectionResult parseWithDetection(String dateString) {
    if (dateString.isEmpty) {
      return DateDetectionResult.failed(error: 'Date string is empty');
    }

    final normalizedDateString = LocalizationUtils.normalizeToEnglish(
      dateString,
    );

    // 🔧 FIX: Check for compact formats BEFORE ISO 8601
    // yyyyMMdd (8 digits)
    if (RegExp(r'^\d{8}$').hasMatch(normalizedDateString)) {
      try {
        final year = int.parse(normalizedDateString.substring(0, 4));
        final month = int.parse(normalizedDateString.substring(4, 6));
        final day = int.parse(normalizedDateString.substring(6, 8));
        final dateTime = DateTime(year, month, day);

        return DateDetectionResult.detected(
          dateTime: dateTime,
          detectedFormat: RetCoreDateFormat.yyyyMMdd,
          formatName: 'Compact Date (yyyyMMdd)',
        );
      } catch (_) {
        // Not a valid date, continue
      }
    }

    // yyMMdd (6 digits)
    if (RegExp(r'^\d{6}$').hasMatch(normalizedDateString)) {
      try {
        final year = int.parse(normalizedDateString.substring(0, 2)) + 2000;
        final month = int.parse(normalizedDateString.substring(2, 4));
        final day = int.parse(normalizedDateString.substring(4, 6));
        final dateTime = DateTime(year, month, day);

        return DateDetectionResult.detected(
          dateTime: dateTime,
          detectedFormat: RetCoreDateFormat.yyMMdd,
          formatName: 'Short Compact Date (yyMMdd)',
        );
      } catch (_) {
        // Not a valid date, continue
      }

      // 🔧 FIX: Reorder formats by priority to handle ambiguous dates
      // Priority order: More specific → Less specific
      final priorityOrder = [
        // Month name formats (most specific)
        RetCoreDateFormat.MMMMdyyyyComma,
        RetCoreDateFormat.dMMMMyyyyComma,
        RetCoreDateFormat.MMMMddyyyySpace,
        RetCoreDateFormat.ddMMMMyyyySpace,
        RetCoreDateFormat.MMMMddyyyyDash,
        RetCoreDateFormat.ddMMMyyyySpace,

        // Year-first formats (unambiguous)
        RetCoreDateFormat.yyyyMMddSlash,
        RetCoreDateFormat.yyyyMMddDot,
        RetCoreDateFormat.yyyyMMddDash,

        // Day-first formats (common in many countries)
        RetCoreDateFormat.ddMMyyyySlash,
        RetCoreDateFormat.ddMMyyyyDot,
        RetCoreDateFormat.ddMMyyyyDash,
        RetCoreDateFormat.ddMMyyyySpace,

        // Month-first formats (US style - lower priority)
        RetCoreDateFormat.MMddyyyySlash,
        RetCoreDateFormat.MMddyyyyDot,
        RetCoreDateFormat.MMddyyyyDash,
      ];

      for (final format in priorityOrder) {
        try {
          final metadata = RetCoreDateFormat.formatMetadata[format];
          final dateTime = DateFormat(format).parseStrict(normalizedDateString);

          return DateDetectionResult.detected(
            dateTime: dateTime,
            detectedFormat: format,
            formatName: metadata?.name ?? format,
          );
        } catch (_) {
          continue;
        }
      }

      // Failed to detect
      return DateDetectionResult.failed(
        error: 'Unable to detect date format for: "$dateString"',
        suggestedFormats: getSuggestedFormats(normalizedDateString),
      );
    }

    // Try ISO 8601 first
    try {
      final dateTime = DateTime.parse(normalizedDateString);
      return DateDetectionResult.detected(
        dateTime: dateTime,
        detectedFormat: 'ISO 8601',
        formatName: 'ISO 8601 Standard',
      );
    } catch (_) {
      // Continue to try other formats
    }

    // Try all supported formats with English locale only
    for (final entry in RetCoreDateFormat.formatMetadata.entries) {
      try {
        final dateTime = DateFormat(
          entry.key,
        ).parseStrict(normalizedDateString);

        return DateDetectionResult.detected(
          dateTime: dateTime,
          detectedFormat: entry.key,
          formatName: entry.value.name,
        );
      } catch (_) {
        continue;
      }
    }

    // Failed to detect - provide suggestions
    return DateDetectionResult.failed(
      error: 'Unable to detect date format for: "$dateString"',
      suggestedFormats: getSuggestedFormats(normalizedDateString),
    );
  }

  /// Get suggested formats based on date string pattern
  static List<String> getSuggestedFormats(String dateString) {
    final suggestions = <String>[];

    // Check string length and characters
    final hasSlash = dateString.contains('/');
    final hasDash = dateString.contains('-');
    final hasDot = dateString.contains('.');
    final hasSpace = dateString.contains(' ');
    final hasComma = dateString.contains(',');
    final hasColon = dateString.contains(':');
    final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(dateString);
    final letterCount = RegExp(r'[a-zA-Z]').allMatches(dateString).length;

    if (hasLetters) {
      if (letterCount > 3) {
        if (hasComma) {
          suggestions.add(
            '${RetCoreDateFormat.MMMMdyyyyComma} (e.g., November 7, 2024)',
          );
        }
        if (hasSpace && !hasComma) {
          suggestions.add(
            '${RetCoreDateFormat.ddMMMMyyyySpace} (e.g., 07 November 2024)',
          );
        }
        if (hasDash) {
          suggestions.add(
            '${RetCoreDateFormat.MMMMddyyyyDash} (e.g., November-07-2024)',
          );
        }
      }
      suggestions.add(
        '${RetCoreDateFormat.ddMMMyyyySpace} (e.g., 07 Nov 2024)',
      );
    }

    if (hasSlash && !hasColon) {
      suggestions.add('${RetCoreDateFormat.ddMMyyyySlash} (e.g., 07/11/2024)');
      suggestions.add('${RetCoreDateFormat.MMddyyyySlash} (e.g., 11/07/2024)');
      suggestions.add('${RetCoreDateFormat.yyyyMMddSlash} (e.g., 2024/11/07)');
    }

    if (hasLetters && hasComma && letterCount == 3) {
      suggestions.add(
        '${RetCoreDateFormat.MMMdyyyyComma} (e.g., Sep 18, 2025)',
      );
    }

    if (hasDash && !hasColon) {
      if (letterCount > 3) {
        suggestions.add(
          '${RetCoreDateFormat.MMMMddyyyyDash} (e.g., November-07-2024)',
        );
      }
      suggestions.add('${RetCoreDateFormat.yyyyMMddDash} (e.g., 2024-11-07)');
      suggestions.add('${RetCoreDateFormat.ddMMyyyyDash} (e.g., 07-11-2024)');
      suggestions.add('${RetCoreDateFormat.MMddyyyyDash} (e.g., 11-07-2024)');
    }

    if (hasDot) {
      suggestions.add('${RetCoreDateFormat.ddMMyyyyDot} (e.g., 07.11.2024)');
      suggestions.add('${RetCoreDateFormat.MMddyyyyDot} (e.g., 11.07.2024)');
      suggestions.add('${RetCoreDateFormat.yyyyMMddDot} (e.g., 2024.11.07)');
    }

    if (hasSpace && !hasLetters) {
      suggestions.add('${RetCoreDateFormat.ddMMyyyySpace} (e.g., 07 11 2024)');
    }

    if (dateString.length == 8 &&
        !hasSlash &&
        !hasDash &&
        !hasDot &&
        !hasSpace) {
      suggestions.add('${RetCoreDateFormat.yyyyMMdd} (e.g., 20241107)');
    }

    if (dateString.length == 6 &&
        !hasSlash &&
        !hasDash &&
        !hasDot &&
        !hasSpace) {
      suggestions.add('${RetCoreDateFormat.yyMMdd} (e.g., 241107)');
    }

    return suggestions.isEmpty
        ? ['Please provide format explicitly']
        : suggestions;
  }

  /// Parse a date string with a specific format
  /// Throws FormatException if parsing fails
  static DateTime parseWithFormat(String dateString, String format) {
    if (dateString.isEmpty) {
      throw const FormatException('Date string cannot be empty');
    }

    final normalizedDateString = LocalizationUtils.normalizeToEnglish(
      dateString,
    );

    try {
      return DateFormat(format).parseStrict(normalizedDateString);
    } catch (e) {
      throw FormatException(
        'Failed to parse date: $dateString with format: $format',
      );
    }
  }

  /// Parse a date string with multiple possible formats
  /// Returns null if all formats fail
  static DateTime? parseWithFormats(String dateString, List<String> formats) {
    if (dateString.isEmpty) return null;

    final normalizedDateString = LocalizationUtils.normalizeToEnglish(
      dateString,
    );

    for (final format in formats) {
      try {
        return DateFormat(format).parseStrict(normalizedDateString);
      } catch (_) {
        continue;
      }
    }

    return null;
  }

  /// Parse special format like 'yyMMdd' (e.g., '241107' -> 2024-11-07)
  static DateTime? parseCompactDate(String dateString) {
    if (dateString.isEmpty || dateString.length != 6) return null;
    final normalizedDateString = LocalizationUtils.bengaliToEnglishNumerals(
      dateString,
    );
    try {
      final year = int.parse(normalizedDateString.substring(0, 2)) + 2000;
      final month = int.parse(normalizedDateString.substring(2, 4));
      final day = int.parse(normalizedDateString.substring(4, 6));
      return DateTime(year, month, day);
    } catch (_) {
      return null;
    }
  }
}
