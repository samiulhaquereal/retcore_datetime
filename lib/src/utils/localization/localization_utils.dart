/// Utilities for handling localization and numeral conversion
///
class LocalizationUtils {
  LocalizationUtils._();

  static const Map<String, String> _bengaliToEnglishNumerals = {
    '০': '0',
    '১': '1',
    '২': '2',
    '৩': '3',
    '৪': '4',
    '৫': '5',
    '৬': '6',
    '৭': '7',
    '৮': '8',
    '৯': '9',
  };

  // English to Bengali numerals
  static const Map<String, String> _englishToBengaliNumerals = {
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
  };

  // Bengali to English month names
  static const Map<String, String> _bengaliToEnglishMonths = {
    'জানুয়ারি': 'January',
    'জানুয়ারী': 'January',
    'ফেব্রুয়ারি': 'February',
    'ফেব্রুয়ারী': 'February',
    'মার্চ': 'March',
    'এপ্রিল': 'April',
    'মে': 'May',
    'জুন': 'June',
    'জুলাই': 'July',
    'আগস্ট': 'August',
    'সেপ্টেম্বর': 'September',
    'অক্টোবর': 'October',
    'নভেম্বর': 'November',
    'ডিসেম্বর': 'December',
  };

  // English to Bengali month names
  static const Map<String, String> _englishToBengaliMonths = {
    'January': 'জানুয়ারি',
    'Jan': 'জানুয়ারি',
    'February': 'ফেব্রুয়ারি',
    'Feb': 'ফেব্রুয়ারি',
    'March': 'মার্চ',
    'Mar': 'মার্চ',
    'April': 'এপ্রিল',
    'Apr': 'এপ্রিল',
    'May': 'মে',
    'June': 'জুন',
    'Jun': 'জুন',
    'July': 'জুলাই',
    'Jul': 'জুলাই',
    'August': 'আগস্ট',
    'Aug': 'আগস্ট',
    'September': 'সেপ্টেম্বর',
    'Sep': 'সেপ্টেম্বর',
    'October': 'অক্টোবর',
    'Oct': 'অক্টোবর',
    'November': 'নভেম্বর',
    'Nov': 'নভেম্বর',
    'December': 'ডিসেম্বর',
    'Dec': 'ডিসেম্বর',
  };

  /// Convert Bengali numerals to English
  static String bengaliToEnglishNumerals(String input) {
    if (input.isEmpty) return input;
    String result = input;
    _bengaliToEnglishNumerals.forEach((bn, en) {
      result = result.replaceAll(bn, en);
    });
    return result;
  }

  /// Convert English numerals to Bengali
  static String englishToBengaliNumerals(String input) {
    if (input.isEmpty) return input;
    String result = input;
    _englishToBengaliNumerals.forEach((en, bn) {
      result = result.replaceAll(en, bn);
    });
    return result;
  }

  /// Convert Bengali month names to English
  static String bengaliToEnglishMonths(String input) {
    if (input.isEmpty) return input;
    String result = input;
    _bengaliToEnglishMonths.forEach((bn, en) {
      result = result.replaceAll(bn, en);
    });
    return result;
  }

  /// Convert English month names to Bengali
  static String englishToBengaliMonths(String input) {
    if (input.isEmpty) return input;
    String result = input;

    // Sort by length (longest first) to avoid partial replacements
    final sortedEntries =
        _englishToBengaliMonths.entries.toList()
          ..sort((a, b) => b.key.length.compareTo(a.key.length));

    for (final entry in sortedEntries) {
      result = result.replaceAll(entry.key, entry.value);
    }

    return result;
  }

  /// Normalize input: Bengali → English (for parsing)
  static String normalizeToEnglish(String input) {
    String result = bengaliToEnglishNumerals(input);
    result = bengaliToEnglishMonths(result);
    return result;
  }

  /// Convert to Bengali: English → Bengali (for output)
  static String convertToBengali(String input) {
    String result = englishToBengaliNumerals(input);
    result = englishToBengaliMonths(result);
    return result;
  }
}
