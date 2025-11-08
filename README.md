# Retcore DateTime

<p align="center">
  A powerful, production-ready DateTime utility for Flutter with intelligent format detection and bilingual (English/Bengali) support.
</p>

<p align="center">
  <!-- Pub.dev Badge -->
  <a href="https://pub.dev/packages/retcore_datetime"><img src="https://img.shields.io/pub/v/retcore_datetime.svg" alt="Pub.dev"></a>
  <!-- License Badge -->
  <a href="https://github.com/samiulhaquereal/retcore_datetime/blob/master/LICENSE"><img src="https://img.shields.io/github/license/samiulhaquereal/retcore_datetime" alt="License"></a>
  <!-- Popularity Badge -->
  <a href="https://pub.dev/packages/retcore_datetime"><img src="https://img.shields.io/pub/popularity/retcore_datetime" alt="Popularity"></a>
</p>

---

## ✨ Key Features

- 🎯 **Smart Auto-Detection** - Automatically detects 20+ date formats
- 🌍 **Bilingual Output** - Get both English and Bengali formatted dates
- 🔄 **Bengali Input** - Parse dates with Bengali numerals and month names (০১২৩৪৫৬৭৮৯, জানুয়ারি, ফেব্রুয়ারি, etc.)
- 📱 **Cross-Platform** - Works on Web, Android, iOS, Desktop
- ⚡  **Zero Setup** - No initialization or configuration needed
- 💪 **Type-Safe** - Rich result objects with detailed error messages

## 📦 Installation

Add this to your package's `pubspec.yaml` file:
dependencies:
    retcore_datetime:



## 📋 Supported Formats

### Date Formats

- **Slash**: `dd/MM/yyyy`, `MM/dd/yyyy`, `yyyy/MM/dd`
- **Dash**: `dd-MM-yyyy`, `MM-dd-yyyy`, `yyyy-MM-dd`
- **Dot**: `dd.MM.yyyy`, `MM.dd.yyyy`, `yyyy.MM.dd`
- **Space**: `dd MM yyyy`
- **Compact**: `yyyyMMdd` (20241107), `yyMMdd` (241107)

### Month Name Formats

- **Short**: `dd MMM yyyy` (07 Nov 2024)
- **Full**: `dd MMMM yyyy` (07 November 2024)
- **Month First**: `MMMM dd yyyy` (November 07 2024)
- **With Comma**: `MMMM d, yyyy` (November 7, 2024), `d MMMM, yyyy` (7 November, 2024)
- **With Dash**: `MMMM-dd-yyyy` (November-07-2024)

### Bengali Support

All formats work with:
- Bengali numerals: ০১২৩৪৫৬৭৮৯
- Bengali month names: জানুয়ারি, ফেব্রুয়ারি, মার্চ, etc.


## 🌍 Localization

### Bengali Month Names

| English | Bengali |
|---------|---------|
| January | জানুয়ারি |
| February | ফেব্রুয়ারি |
| March | মার্চ |
| April | এপ্রিল |
| May | মে |
| June | জুন |
| July | জুলাই |
| August | আগস্ট |
| September | সেপ্টেম্বর |
| October | অক্টোবর |
| November | নভেম্বর |
| December | ডিসেম্বর |




#### ✨ 1. Smart Auto-Detection
<p>The library intelligently parses over 20+ date formats without requiring you to specify the input format. It automatically handles slashes, dashes, dots, spaces, month names, and compact formats.</p>

```
// All these formats are detected automatically
DateParser.parseWithDetection("07/11/2024");       // Detects dd/MM/yyyy
DateParser.parseWithDetection("2024-11-07");       // Detects yyyy-MM-dd
DateParser.parseWithDetection("November 07 2024"); // Detects MMMM dd yyyy
DateParser.parseWithDetection("241107");           // Detects yyMMdd

```

#### 🌍 2. Bilingual Support (English &amp; Bengali)
<p>This is the standout feature. The package seamlessly handles both English and Bengali dates, providing bilingual output for every successful conversion.</p>


* Bengali Input: Parses dates written with Bengali numerals (০, ১, ২...) and month names (জানুয়ারি, ফেব্রুয়ারি...).
* Bilingual Output: The DateConversionResult object contains both formattedDateEnglish and formattedDateBengali.

```
final result = DateConverter.convertSmart(
  dateString: 'নভেম্বর ০৭ ২০২৪', // Input can be Bengali
  toFormat: DateFormatConstants.ddMMMyyyySpace,
);

if (result.success) {
  print(result.formattedDateEnglish); // "07 Nov 2024"
  print(result.formattedDateBengali);  // "০৭ নভেম্বর ২০২৪"
}

```

#### 🚀 3. Zero Setup &amp; Cross-Platform
<p>The package is designed to work instantly on all platforms (Web, Android, iOS, Windows, macOS, Linux) with zero configuration.</p>


* No Initialization: No async main() or platform-specific setup required.
* Works Everywhere: A single codebase that runs consistently across all targets.



#### 💪 4. Robust &amp; Type-Safe API
<p>Instead of returning null or throwing unexpected exceptions, the library uses rich result objects (DateConversionResult, DateDetectionResult) to provide detailed feedback.</p>

```
final result = DateParser.parseWithDetection("99/99/9999");

if (!result.success) {
  print(result.error); // "Unable to detect date format for: "99/99/9999""
  print(result.suggestedFormats); // [dd/MM/yyyy (e.g., 07/11/2024), ...]
}

```

#### 🛠️ 5. Comprehensive Utility Suite
<p>It's more than just a converter. It’s a full suite of date tools.</p>


* RetCoreDateConverter: Convert between formats.
* RetCoreDateParser: Parse strings into DateTime objects.
* RetCoreDateFormatter: Format DateTime objects into strings (including relative dates like "Today" or "Yesterday").
* RetCoreDateValidator: Check if a date is valid, in the past, today, etc.

```
// Validation
bool isValid = DateValidator.isValid("2024-11-07"); // true

// Formatting
String relative = DateFormatter.toRelativeDate(DateTime.now()); // "Today at 10:45 PM"

```

#### 📋 6. Extensive Format Support
<p>The library supports a wide range of date formats right out of the box, covering most common use cases globally.</p>


* Numeric Formats: dd/MM/yyyy, MM/dd/yyyy, yyyy-MM-dd, dd.MM.yyyy, etc.
* Compact Formats: yyyyMMdd (20241107) and yyMMdd (241107).
* Month Name Formats: dd MMM yyyy, MMMM d, yyyy, d MMMM, yyyy, etc.
* ISO 8601: Standard format for APIs


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Issues

If you encounter any issues or have feature requests, please file them in the [issue tracker](https://github.com/samiulhaquereal/retcore_datetime/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Samiul Haque Real**
- GitHub: [@samiulhaquereal](https://github.com/samiulhaquereal)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes.

---

Made with ❤️ for the Flutter community
