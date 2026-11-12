import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/l10n/locale_resolution.dart';

void main() {
  final supported = AppLocalizations.supportedLocales;
  test('all 39 shipping locales load without an English fallback', () async {
    expect(supported, hasLength(39));
    for (final locale in supported) {
      final strings = await AppLocalizations.delegate.load(locale);
      expect(strings.breathingTitle, isNotEmpty);
      expect(strings.supportIntro, isNotEmpty);
      expect(strings.vegetableImages, isNotEmpty);
      expect(strings.supportRemaining(2), contains('2'));
      if (locale.languageCode != 'en') {
        expect(strings.breathingTitle, isNot('Take a breath'));
        expect(strings.supportIntro, isNot(startsWith('Chat anonymously')));
      }
    }
  });

  test('Chinese regions choose the appropriate writing system', () {
    for (final region in ['TW', 'HK', 'MO']) {
      final chosen = resolveAppLocale([Locale('zh', region)], supported);
      expect(chosen.scriptCode, 'Hant');
    }
    for (final region in ['CN', 'SG']) {
      final chosen = resolveAppLocale([Locale('zh', region)], supported);
      expect(chosen.languageCode, 'zh');
      expect(chosen.scriptCode, isNot('Hant'));
    }
  });

  test('Norwegian and regional variants use their matching translations', () {
    expect(
      resolveAppLocale([const Locale('no', 'NO')], supported).languageCode,
      'nb',
    );
    for (final locale in [
      const Locale('pt', 'BR'),
      const Locale('es', 'MX'),
      const Locale('fr', 'CA'),
      const Locale('en', 'AU'),
      const Locale('en', 'CA'),
      const Locale('en', 'GB'),
    ]) {
      expect(resolveAppLocale([locale], supported), locale);
    }
    expect(
      resolveAppLocale([const Locale('xx')], supported),
      const Locale('en'),
    );
  });
}
