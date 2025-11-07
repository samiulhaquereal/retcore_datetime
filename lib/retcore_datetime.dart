/// A comprehensive DateTime utility library for Flutter.
///
/// This library provides smart date parsing, format detection, and bilingual
/// (English/Bengali) conversion capabilities with zero setup required.
///
/// ## Features
///
/// - 🎯 Smart auto-detection of 20+ date formats
/// - 🌍 Bilingual output (English and Bengali)
/// - 🔄 Bengali input support (numerals and month names)
/// - 📱 Cross-platform (Web, Android, iOS, Desktop)
/// - ⚡ Zero initialization required
/// - 💪 Type-safe with rich result objects
///
/// ## Quick Start
///
/// ```
/// import 'package:retcore_datetime/retcore_datetime.dart';
///
/// // Parse Bengali date
/// final result = DateConverter.convertSmart(
///   dateString: 'নভেম্বর ০৭ ২০২৪',
///   toFormat: DateFormatConstants.yyyyMMddDash,
/// );
///
/// print(result.formattedDateEnglish); // 2024-11-07
/// print(result.formattedDateBengali);  // ২০২৪-১১-০৭
/// ```

// Constants
export 'src/core/constants/date_format_constants.dart';

// Core functionality
export 'src/utils/parsers/date_parser.dart';
export 'src/utils/formatters/date_formatter.dart';
export 'src/utils/converters/date_converter.dart';
export 'src/utils/validators/date_validator.dart';

