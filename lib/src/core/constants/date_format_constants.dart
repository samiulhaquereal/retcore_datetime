/// Defines all supported date format patterns with metadata
class DateFormatConstants {
  DateFormatConstants._();

  // Date only formats
  static const String yyyyMMdd = 'yyyyMMdd';
  static const String yyMMdd = 'yyMMdd';
  static const String yyyyMMddDash = 'yyyy-MM-dd';
  static const String yyyyMMddSlash = 'yyyy/MM/dd';
  static const String yyyyMMddDot = 'yyyy.MM.dd';
  static const String ddMMyyyySlash = 'dd/MM/yyyy';
  static const String ddMMyyyyDash = 'dd-MM-yyyy';
  static const String ddMMyyyyDot = 'dd.MM.yyyy';
  static const String ddMMyyyySpace = 'dd MM yyyy';
  static const String MMddyyyySlash = 'MM/dd/yyyy';
  static const String MMddyyyyDash = 'MM-dd-yyyy';
  static const String MMddyyyyDot = 'MM.dd.yyyy';
  static const String ddMMMyyyySpace = 'dd MMM yyyy';
  static const String dMMMM = 'd MMMM';
  static const String MMMMddyyyyDash = 'MMMM-dd-yyyy';
  static const String ddMMMMyyyySpace = 'dd MMMM yyyy';
  static const String MMMMdyyyyComma = 'MMMM d, yyyy';
  static const String dMMMMyyyyComma = 'd MMMM, yyyy';
  static const String MMMMddyyyySpace = 'MMMM dd yyyy';

  // DateTime formats
  static const String yyyyMMddHHmmssSSSdash = 'yyyy-MM-dd HH:mm:ss.SSS';
  static const String yyyyMMddTHHmmssSSS = "yyyy-MM-ddTHH:mm:ss.SSS";
  static const String yyyyMMddTHHmmssSSSZ = "yyyy-MM-ddTHH:mm:ss.SSSZ";
  static const String yyyyMMddHHmmssSlash = 'yyyy/MM/dd HH:mm:ss';
  static const String yyyyMMddDotHHmmss = 'yyyy.MM.dd HH:mm:ss';
  static const String ddMMyyyySlashHHmmss = 'dd/MM/yyyy HH:mm:ss';
  static const String ddMMyyyyDashHHmmss = 'dd-MM-yyyy HH:mm:ss';
  static const String MMddyyyyDashHHmmss = 'MM-dd-yyyy HH:mm:ss';
  static const String MMddyyyySlashHHmmss = 'MM/dd/yyyy HH:mm:ss';

  // Time formats
  static const String hhmma = 'h:mm a';
  static const String HHmmss = 'HH:mm:ss';

  /// Format metadata for better detection and user feedback
  static const Map<String, FormatMetadata> formatMetadata = {
    yyyyMMdd: FormatMetadata(
      pattern: yyyyMMdd,
      name: 'Compact Date (yyyyMMdd)',
      example: '20241107',
      priority: 5,
    ),
    yyMMdd: FormatMetadata(
      pattern: yyMMdd,
      name: 'Short Compact Date (yyMMdd)',
      example: '241107',
      priority: 4,
    ),
    yyyyMMddDash: FormatMetadata(
      pattern: yyyyMMddDash,
      name: 'ISO Date (yyyy-MM-dd)',
      example: '2024-11-07',
      priority: 10,
    ),
    yyyyMMddSlash: FormatMetadata(
      pattern: yyyyMMddSlash,
      name: 'Year First Slash (yyyy/MM/dd)',
      example: '2024/11/07',
      priority: 8,
    ),
    yyyyMMddDot: FormatMetadata(
      pattern: yyyyMMddDot,
      name: 'Year First Dot (yyyy.MM.dd)',
      example: '2024.11.07',
      priority: 7,
    ),
    ddMMyyyySlash: FormatMetadata(
      pattern: ddMMyyyySlash,
      name: 'European Slash (dd/MM/yyyy)',
      example: '07/11/2024',
      priority: 9,
    ),
    ddMMyyyyDash: FormatMetadata(
      pattern: ddMMyyyyDash,
      name: 'European Dash (dd-MM-yyyy)',
      example: '07-11-2024',
      priority: 8,
    ),
    ddMMyyyyDot: FormatMetadata(
      pattern: ddMMyyyyDot,
      name: 'European Dot (dd.MM.yyyy)',
      example: '07.11.2024',
      priority: 9,
    ),
    ddMMyyyySpace: FormatMetadata(
      pattern: ddMMyyyySpace,
      name: 'European Space (dd MM yyyy)',
      example: '07 11 2024',
      priority: 6,
    ),
    MMddyyyySlash: FormatMetadata(
      pattern: MMddyyyySlash,
      name: 'US Slash (MM/dd/yyyy)',
      example: '11/07/2024',
      priority: 8,
    ),
    MMddyyyyDash: FormatMetadata(
      pattern: MMddyyyyDash,
      name: 'US Dash (MM-dd-yyyy)',
      example: '11-07-2024',
      priority: 7,
    ),
    MMddyyyyDot: FormatMetadata(
      pattern: MMddyyyyDot,
      name: 'US Dot (MM.dd.yyyy)',
      example: '11.07.2024',
      priority: 7,
    ),
    ddMMMyyyySpace: FormatMetadata(
      pattern: ddMMMyyyySpace,
      name: 'Readable Date (dd MMM yyyy)',
      example: '07 Nov 2024',
      priority: 10,
    ),
    MMMMddyyyyDash: FormatMetadata(
      pattern: MMMMddyyyyDash,
      name: 'Full Month Name Dash (MMMM-dd-yyyy)',
      example: 'November-07-2024',
      priority: 9,
    ),
    ddMMMMyyyySpace: FormatMetadata(
      pattern: ddMMMMyyyySpace,
      name: 'Day Full Month Year Space (dd MMMM yyyy)',
      example: '07 November 2024',
      priority: 10,
    ),
    MMMMdyyyyComma: FormatMetadata(
      pattern: MMMMdyyyyComma,
      name: 'Full Month Day Year with Comma (MMMM d, yyyy)',
      example: 'November 7, 2024',
      priority: 10,
    ),
    dMMMMyyyyComma: FormatMetadata(
      pattern: dMMMMyyyyComma,
      name: 'Day Full Month Year with Comma (d MMMM, yyyy)',
      example: '7 November, 2024',
      priority: 10,
    ),
    MMMMddyyyySpace: FormatMetadata(
      pattern: MMMMddyyyySpace,
      name: 'Month First Full Name Space (MMMM dd yyyy)',
      example: 'November 07 2024',
      priority: 10,
    ),
    yyyyMMddTHHmmssSSSZ: FormatMetadata(
      pattern: yyyyMMddTHHmmssSSSZ,
      name: 'ISO 8601 UTC (yyyy-MM-ddTHH:mm:ss.SSSZ)',
      example: '2024-11-07T12:00:00.000Z',
      priority: 10,
    ),
  };

  /// Returns all supported input formats ordered by priority
  static List<String> get allSupportedFormats {
    final formats =
        formatMetadata.entries.toList()
          ..sort((a, b) => b.value.priority.compareTo(a.value.priority));
    return formats.map((e) => e.key).toList();
  }

  /// Get format metadata by pattern
  static FormatMetadata? getMetadata(String pattern) {
    return formatMetadata[pattern];
  }
}

/// Metadata for date format patterns
class FormatMetadata {
  final String pattern;
  final String name;
  final String example;
  final int priority; // Higher priority = tried first during detection

  const FormatMetadata({
    required this.pattern,
    required this.name,
    required this.example,
    required this.priority,
  });
}
