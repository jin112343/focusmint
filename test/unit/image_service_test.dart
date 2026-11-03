import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/services/image_service.dart';
import 'package:focusmint/models/custom_image_models.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    ImageService().clearCache();
  });

  group('ImageService', () {
    // 実際のアセットバンドルから画像一覧を読めることを確認する
    // （AssetManifest.json 廃止で全画像が読めなくなった不具合の再発防止）
    for (final group in ImageGroup.values) {
      test(
        'builds a 4-image set from bundled assets for ${group.name}',
        () async {
          final stimuli = await ImageService().getRandomStimuliSet(group);

          expect(stimuli, hasLength(4));
          expect(
            stimuli.where((s) => s.valence == Valence.positive),
            hasLength(1),
          );
          expect(
            stimuli.where((s) => s.valence == Valence.negative),
            hasLength(3),
          );
          for (final stimulus in stimuli) {
            expect(stimulus.assetPath, startsWith('assets/images/'));
            expect(stimulus.isCustomImage, isFalse);
          }
          if (group == ImageGroup.health) {
            expect(
              stimuli
                  .where((s) => s.valence == Valence.negative)
                  .every((s) => s.assetPath.startsWith('assets/images/bad_')),
              isTrue,
            );
          }
        },
      );
    }
  });

  test('only selects complete enabled custom groups', () async {
    final directory = await Directory.systemTemp.createTemp(
      'focusmint-images-',
    );
    addTearDown(() => directory.delete(recursive: true));
    final paths = <String>[];
    for (var i = 0; i < 4; i++) {
      final file = File('${directory.path}/$i.jpg');
      await file.writeAsBytes([1]);
      paths.add(file.path);
    }
    final settings = CustomImageSettings.defaultSettings().copyWith(
      useCustomImages: true,
      groups: [
        CustomImageGroup.empty(1),
        CustomImageGroup(
          id: 2,
          enabled: true,
          imagePaths: {
            WeatherType.sunny: [paths.first],
            WeatherType.rainy: paths.skip(1).toList(),
          },
        ),
      ],
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'custom_image_settings',
      jsonEncode(settings.toJson()),
    );
    for (var i = 0; i < 20; i++) {
      final stimuli = await ImageService().getRandomStimuliSet(
        ImageGroup.emotions,
      );
      expect(stimuli, hasLength(4));
      expect(stimuli.every((s) => s.isCustomImage), isTrue);
      expect(stimuli.where((s) => s.valence == Valence.positive), hasLength(1));
    }
    await prefs.setString(
      'custom_image_settings',
      jsonEncode(settings.copyWith(mixWithOriginalImages: true).toJson()),
    );
    for (final group in ImageGroup.values) {
      final stimuli = await ImageService().getRandomStimuliSet(group);
      expect(stimuli, hasLength(4));
      expect(stimuli.any((s) => s.isCustomImage), isTrue);
      expect(stimuli.any((s) => !s.isCustomImage), isTrue);
      expect(stimuli.where((s) => s.valence == Valence.positive), hasLength(1));
      expect(stimuli.where((s) => s.valence == Valence.negative), hasLength(3));
    }
  });

  test('missing custom files fall back to a playable bundled set', () async {
    final settings = CustomImageSettings.defaultSettings().copyWith(
      useCustomImages: true,
      groups: [
        CustomImageGroup(
          id: 1,
          enabled: true,
          imagePaths: {
            WeatherType.sunny: ['/missing/sunny.jpg'],
            WeatherType.rainy: [
              '/missing/1.jpg',
              '/missing/2.jpg',
              '/missing/3.jpg',
            ],
          },
        ),
      ],
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'custom_image_settings',
      jsonEncode(settings.toJson()),
    );
    final stimuli = await ImageService().getRandomStimuliSet(
      ImageGroup.emotions,
    );
    expect(stimuli, hasLength(4));
    expect(stimuli.every((s) => !s.isCustomImage), isTrue);
  });
}
