import 'package:flutter/widgets.dart';

/// Match platform language codes to the translations shipped by the app.
Locale resolveAppLocale(List<Locale>? preferred, Iterable<Locale> supported) {
  final normalized = preferred?.map((locale) {
    if (locale.languageCode == 'no') {
      return Locale('nb', locale.countryCode);
    }
    if (locale.languageCode == 'zh') {
      final traditional =
          locale.scriptCode == 'Hant' ||
          (locale.scriptCode == null &&
              const {'TW', 'HK', 'MO'}.contains(locale.countryCode));
      return Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: traditional ? 'Hant' : 'Hans',
        countryCode: locale.countryCode,
      );
    }
    return locale;
  }).toList();
  return basicLocaleListResolution(normalized, supported);
}
