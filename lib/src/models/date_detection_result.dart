/// Result of date format detection
class DateDetectionResult {
  final bool success;
  final DateTime? dateTime;
  final String? detectedFormat;
  final String? formatName;
  final String? error;
  final List<String>? suggestedFormats;

  const DateDetectionResult({
    required this.success,
    this.dateTime,
    this.detectedFormat,
    this.formatName,
    this.error,
    this.suggestedFormats,
  });

  /// Factory for successful detection
  factory DateDetectionResult.detected({
    required DateTime dateTime,
    required String detectedFormat,
    String? formatName,
  }) {
    return DateDetectionResult(
      success: true,
      dateTime: dateTime,
      detectedFormat: detectedFormat,
      formatName: formatName,
    );
  }

  /// Factory for failed detection
  factory DateDetectionResult.failed({
    required String error,
    List<String>? suggestedFormats,
  }) {
    return DateDetectionResult(
      success: false,
      error: error,
      suggestedFormats: suggestedFormats,
    );
  }

  @override
  String toString() {
    if (success) {
      return 'DateDetectionResult(success: true, format: $detectedFormat, formatName: $formatName)';
    } else {
      return 'DateDetectionResult(success: false, error: $error, suggestions: $suggestedFormats)';
    }
  }
}

/// Result of date conversion
class DateConversionResult {
  final bool success;
  final String? detectedFormat;
  final String? error;
  final String? formattedDateEnglish;
  final String? formattedDateBengali;
  final List<String>? suggestedFormats;

  const DateConversionResult({
    required this.success,
    this.detectedFormat,
    this.formattedDateEnglish,
    this.formattedDateBengali,
    this.error,
    this.suggestedFormats,
  });

  /// Factory for successful conversion
  factory DateConversionResult.converted({
    required String formattedDateEnglish,
    required String formattedDateBengali,
    String? detectedFormat,
  }) {
    return DateConversionResult(
      success: true,
      formattedDateEnglish: formattedDateEnglish,
      formattedDateBengali: formattedDateBengali,
      detectedFormat: detectedFormat,
    );
  }

  /// Factory for failed conversion
  factory DateConversionResult.failed({
    required String error,
    List<String>? suggestedFormats,
  }) {
    return DateConversionResult(
      success: false,
      error: error,
      suggestedFormats: suggestedFormats,
    );
  }

  @override
  String toString() {
    if (success) {
      return 'DateConversionResult(success: true, english: $formattedDateEnglish, bengali: $formattedDateBengali, detectedFormat: $detectedFormat)';
    } else {
      return 'DateConversionResult(success: false, error: $error)';
    }
  }
}
