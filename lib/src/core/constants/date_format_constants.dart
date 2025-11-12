/// Defines all supported date format patterns with metadata
class RetCoreDateFormat {
  RetCoreDateFormat._();

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
  static const String MMMdyyyyComma = 'MMM d, yyyy';
  static const String MMM_yyyy = 'MMM yyyy';
  static const String MMMM_yyyy = 'MMMM yyyy';

  // With day of week
  static const String E_MMMdyyyy = 'E, MMM d, yyyy';
  static const String EEEE_MMMMdyyyy = 'EEEE, MMMM d, yyyy';

  // DateTime formats (24h and 12h)
  static const String yyyyMMddHHmmssSSSdash = 'yyyy-MM-dd HH:mm:ss.SSS';
  static const String yyyyMMddTHHmmssSSS = "yyyy-MM-ddTHH:mm:ss.SSS";
  static const String yyyyMMddTHHmmssSSSZ = "yyyy-MM-ddTHH:mm:ss.SSSZ";
  static const String yyyyMMddHHmmssSlash = 'yyyy/MM/dd HH:mm:ss';
  static const String yyyyMMddDotHHmmss = 'yyyy.MM.dd HH:mm:ss';
  static const String ddMMyyyySlashHHmmss = 'dd/MM/yyyy HH:mm:ss';
  static const String ddMMyyyyDashHHmmss = 'dd-MM-yyyy HH:mm:ss';
  static const String MMddyyyyDashHHmmss = 'MM-dd-yyyy HH:mm:ss';
  static const String MMddyyyySlashHHmmss = 'MM/dd/yyyy HH:mm:ss';

  // With AM/PM
  static const String MMMdyyyyComma_hmma = 'MMM d, yyyy h:mm a';
  static const String MMMMddyyyy_hmma = 'MMMM dd yyyy h:mm a';
  static const String ddMMMyyyySpace_hmma = 'dd MMM yyyy h:mm a';
  static const String yyyyMMddDash_hmma = 'yyyy-MM-dd h:mm a';
  static const String ddMMyyyySlash_hmma = 'dd/MM/yyyy h:mm a';

  // ISO variants
  static const String yyyyMMddTHHmmZ = 'yyyy-MM-ddTHH:mmZ';
  static const String yyyyMMddTHHmmssZ = 'yyyy-MM-ddTHH:mm:ssZ';
  static const String yyyyMMddTHHmmss = 'yyyy-MM-ddTHH:mm:ss';

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
    MMM_yyyy: FormatMetadata(
      pattern: MMM_yyyy,
      name: 'Short Month Year Only (MMM yyyy)',
      example: 'Sep 2025',
      priority: 5,
    ),
    MMMM_yyyy: FormatMetadata(
      pattern: MMMM_yyyy,
      name: 'Full Month Year Only (MMMM yyyy)',
      example: 'September 2025',
      priority: 5,
    ),
    E_MMMdyyyy: FormatMetadata(
      pattern: E_MMMdyyyy,
      name: 'DayOfWeek Short Month (E, MMM d, yyyy)',
      example: 'Tue, Nov 7, 2024',
      priority: 3,
    ),
    EEEE_MMMMdyyyy: FormatMetadata(
      pattern: EEEE_MMMMdyyyy,
      name: 'DayOfWeek Full Month (EEEE, MMMM d, yyyy)',
      example: 'Wednesday, November 7, 2024',
      priority: 3,
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
    MMMdyyyyComma: FormatMetadata(
      pattern: MMMdyyyyComma,
      name: 'Short Month Name with Comma (MMM d, yyyy)',
      example: 'Sep 18, 2025',
      priority: 10,
    ),
    yyyyMMddTHHmmZ: FormatMetadata(
      pattern: yyyyMMddTHHmmZ,
      name: 'Short ISO Z (yyyy-MM-ddTHH:mmZ)',
      example: '2024-11-07T12:00Z',
      priority: 7,
    ),
    yyyyMMddTHHmmssSSSZ: FormatMetadata(
      pattern: yyyyMMddTHHmmssSSSZ,
      name: 'ISO 8601 UTC (yyyy-MM-ddTHH:mm:ss.SSSZ)',
      example: '2024-11-07T12:00:00.000Z',
      priority: 10,
    ),

    MMMdyyyyComma_hmma: FormatMetadata(
      pattern: MMMdyyyyComma_hmma,
      name: 'Short Month with 12-hour Time (MMM d, yyyy h:mm a)',
      example: 'Sep 18, 2025 9:15 PM',
      priority: 10,
    ),
    yyyyMMddTHHmmssZ: FormatMetadata(
      pattern: yyyyMMddTHHmmssZ,
      name: 'ISO with Seconds Z (yyyy-MM-ddTHH:mm:ssZ)',
      example: '2024-11-07T12:00:57Z',
      priority: 7,
    ),
    yyyyMMddTHHmmss: FormatMetadata(
      pattern: yyyyMMddTHHmmss,
      name: 'ISO Local with Seconds (yyyy-MM-ddTHH:mm:ss)',
      example: '2024-11-07T12:00:57',
      priority: 6,
    ),
    MMMMddyyyy_hmma: FormatMetadata(
      pattern: MMMMddyyyy_hmma,
      name: 'Full Month with 12-hour Time (MMMM dd yyyy h:mm a)',
      example: 'November 07 2024 4:05 AM',
      priority: 9,
    ),
    ddMMMyyyySpace_hmma: FormatMetadata(
      pattern: ddMMMyyyySpace_hmma,
      name: 'Day Month Year 12-hour (dd MMM yyyy h:mm a)',
      example: '07 Nov 2024 03:21 PM',
      priority: 9,
    ),
    yyyyMMddDash_hmma: FormatMetadata(
      pattern: yyyyMMddDash_hmma,
      name: 'ISO 12-hour (yyyy-MM-dd h:mm a)',
      example: '2025-11-12 3:42 PM',
      priority: 8,
    ),
    ddMMyyyySlash_hmma: FormatMetadata(
      pattern: ddMMyyyySlash_hmma,
      name: 'Slash Date with 12-hour (dd/MM/yyyy h:mm a)',
      example: '18/09/2025 11:02 AM',
      priority: 8,
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
