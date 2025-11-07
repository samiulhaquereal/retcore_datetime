import 'package:retcore_datetime/src/config/import.dart';

/// Handles conversion between different date formats
class RetCoreDateConverter {
  RetCoreDateConverter._();

  /// Convert a date string from one format to another with auto-detection
  /// Returns DateConversionResult with detailed information
  static DateConversionResult convert({
    required String dateString,
    String? fromFormat,
    required String toFormat,
  }) {
    if (dateString.isEmpty) {
      return DateConversionResult.failed(error: 'Date string is empty');
    }

    final normalizedDateString = LocalizationUtils.normalizeToEnglish(
      dateString,
    );

    try {
      DateTime parsedDate;
      String? detectedFormat;
      // If fromFormat is provided, use it directly
      if (fromFormat != null) {
        try {
          parsedDate = RetCoreDateParser.parseWithFormat(
            normalizedDateString,
            fromFormat,
          );
          detectedFormat = fromFormat;
        } catch (e) {
          return DateConversionResult.failed(
            error: 'Failed to parse with provided format "$fromFormat". $e',
            suggestedFormats: RetCoreDateParser.getSuggestedFormats(
              normalizedDateString,
            ),
          );
        }
      } else {
        // Auto-detect format
        final detectionResult = RetCoreDateParser.parseWithDetection(
          normalizedDateString,
        );

        if (!detectionResult.success) {
          return DateConversionResult.failed(
            error:
                detectionResult.error ??
                'Unknown error during format detection',
            suggestedFormats: detectionResult.suggestedFormats,
          );
        }

        parsedDate = detectionResult.dateTime!;
        detectedFormat = detectionResult.detectedFormat;
      }

      // Format to English
      final formattedEnglish = RetCoreDateFormatter.format(parsedDate, toFormat);

      // Format to Bengali
      final formattedBengali = LocalizationUtils.convertToBengali(
        formattedEnglish,
      );

      return DateConversionResult.converted(
        formattedDateEnglish: formattedEnglish,
        formattedDateBengali: formattedBengali,
        detectedFormat: detectedFormat,
      );
    } catch (e) {
      return DateConversionResult.failed(
        error: 'Conversion failed: $e',
        suggestedFormats: RetCoreDateParser.getSuggestedFormats(dateString),
      );
    }
  }

  /// Convert any date string to ISO 8601 format with auto-detection
  static DateConversionResult toIso8601({
    required String dateString,
    String? fromFormat,
  }) {
    if (dateString.isEmpty) {
      return DateConversionResult.failed(error: 'Date string is empty');
    }

    try {
      final DateTime parsedDate;
      String? detectedFormat;

      if (fromFormat != null) {
        parsedDate = RetCoreDateParser.parseWithFormat(dateString, fromFormat);
        detectedFormat = fromFormat;
      } else {
        final detectionResult = RetCoreDateParser.parseWithDetection(dateString);
        if (!detectionResult.success) {
          return DateConversionResult.failed(
            error: detectionResult.error ?? 'Format detection failed',
            suggestedFormats: detectionResult.suggestedFormats,
          );
        }
        parsedDate = detectionResult.dateTime!;
        detectedFormat = detectionResult.detectedFormat;
      }

      final iso = RetCoreDateFormatter.toIso8601(parsedDate);
      final isoBengali = LocalizationUtils.englishToBengaliNumerals(iso);

      return DateConversionResult.converted(
        formattedDateEnglish: iso,
        formattedDateBengali: isoBengali,
        detectedFormat: detectedFormat,
      );
    } catch (e) {
      return DateConversionResult.failed(
        error: 'ISO conversion failed: $e',
        suggestedFormats: RetCoreDateParser.getSuggestedFormats(dateString),
      );
    }
  }

  /// Convert ISO 8601 string to any format
  static String fromIso8601({
    required String isoDateString,
    required String toFormat,
  }) {
    if (isoDateString.isEmpty) return '';

    try {
      final dateTime = DateTime.parse(isoDateString);
      return RetCoreDateFormatter.format(dateTime, toFormat);
    } catch (_) {
      return '';
    }
  }

  /// Convert compact date format (yyMMdd) to readable format
  static String fromCompactDate({
    required String compactDate,
    String toFormat = RetCoreDateFormat.ddMMMyyyySpace,
  }) {
    if (compactDate.isEmpty) return '';

    final parsedDate = RetCoreDateParser.parseCompactDate(compactDate);
    if (parsedDate == null) return '';

    return RetCoreDateFormatter.format(parsedDate, toFormat);
  }
}
