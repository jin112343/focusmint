#!/usr/bin/env python3
"""Check shipping translations, placeholders and native language registration."""
import json
from pathlib import Path
import plistlib
import re
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
STORE_LOCALES = 'he pt-BR el vi ar-SA fr-CA ro th hr sk ms ko fi fr-FR pl de-DE zh-Hans id da nl-NL ca tr no en-GB zh-Hant es-ES it sv en-CA en-AU ja uk hu pt-PT es-MX cs ru en-US hi'.split()
ALIASES = {'ar-SA': 'ar', 'de-DE': 'de', 'fr-FR': 'fr', 'nl-NL': 'nl',
           'pt-PT': 'pt', 'es-ES': 'es', 'en-US': 'en', 'no': 'nb', 'zh-Hans': 'zh'}


def main():
    folder = ROOT / 'lib/l10n'
    template = json.loads((folder / 'app_en.arb').read_text())
    keys = {k for k in template if not k.startswith('@')}
    rows = []
    native = set()
    for locale in STORE_LOCALES:
        arb = ALIASES.get(locale, locale).replace('-', '_')
        data = json.loads((folder / f'app_{arb}.arb').read_text())
        assert {k for k in data if not k.startswith('@')} == keys, arb
        for key in keys:
            value = data[key]
            assert isinstance(value, str), (arb, key)
            assert value or key == 'monthSuffix', (arb, key, 'empty')
            placeholders = lambda text: set(re.findall(r'\{(\w+)\}', text))
            assert placeholders(value) == placeholders(template[key]), (arb, key)
            if not arb.startswith('en'):
                assert not (value == template[key] and len(value) > 60), (arb, key, 'English fallback')
            if arb != 'ja':
                assert not re.search('[ぁ-んァ-ヶ]', value), (arb, key, 'Japanese residue')
        tag = {'pt': 'pt-PT', 'zh': 'zh-Hans'}.get(arb, arb.replace('_', '-'))
        native.add(tag)
        strings = ROOT / 'ios/Runner' / f'{tag}.lproj/InfoPlist.strings'
        assert strings.is_file(), tag
        assert 'NSPhotoLibraryUsageDescription' in strings.read_text(), tag
        rows.append({'storeLocale': locale, 'appLocale': arb, 'nativeLocale': tag,
                     'translatedMessages': len(keys)})
    plist = plistlib.loads((ROOT / 'ios/Runner/Info.plist').read_bytes())
    assert set(plist['CFBundleLocalizations']) == native
    android = ET.parse(ROOT / 'android/app/src/main/res/xml/locales_config.xml')
    assert {node.attrib['{http://schemas.android.com/apk/res/android}name']
            for node in android.getroot()} == native
    print(json.dumps({'storeLocales': len(rows), 'messagesPerLocale': len(keys),
                      'coverage': rows}, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
