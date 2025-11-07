# Retcore DateTime

<p align="center">
  A comprehensive DateTime utility for Flutter with smart format detection, Bengali localization, and bilingual output. Parse any date format automatically and convert between English and Bengali seamlessly
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
- ⚡ **Zero Setup** - No initialization or configuration needed
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
