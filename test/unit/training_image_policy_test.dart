import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/constants/placeholder_images.dart';
import 'package:focusmint/constants/training_image_policy.dart';
import 'package:focusmint/models/image_group.dart';
import 'package:focusmint/services/hidden_image_service.dart';
import 'package:focusmint/services/random_image_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final catalog = {
    ...PlaceholderImages.positiveImages,
    ...PlaceholderImages.negativeImages,
  };

  setUp(() => SharedPreferences.setMockInitialValues({}));

  test(
    'all 291 catalog images are bundled square WebP files within the cap',
    () async {
      final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
      final bundled = manifest
          .listAssets()
          .where(
            (path) => RegExp(
              r'^assets/images/(smile|sad|health|bad|vegetables|badfood)_',
            ).hasMatch(path),
          )
          .toSet();
      expect(catalog, hasLength(291));
      expect(bundled, catalog.map((name) => 'assets/images/$name').toSet());
      for (final name in catalog) {
        expect(name, endsWith('.webp'));
        final data = await rootBundle.load('assets/images/$name');
        final bytes = data.buffer.asUint8List(
          data.offsetInBytes,
          data.lengthInBytes,
        );
        expect(ascii.decode(bytes.sublist(0, 4)), 'RIFF', reason: name);
        expect(ascii.decode(bytes.sublist(8, 12)), 'WEBP', reason: name);
        final codec = await ui.instantiateImageCodec(bytes);
        final frame = await codec.getNextFrame();
        expect(frame.image.width, frame.image.height, reason: name);
        expect(frame.image.width, 512, reason: name);
        frame.image.dispose();
        codec.dispose();
      }
    },
  );

  test('every old filename resolves to its current asset without affecting custom paths', () {
    for (final name in catalog) {
      final stem = name.replaceFirst(RegExp(r'(_v2)?\.webp$'), '');
      for (final extension in ['jpg', 'jpeg', 'png', 'webp']) {
        expect(
          TrainingImagePolicy.resolveAssetPath(
            'assets/images/$stem.$extension',
          ),
          'assets/images/$name',
        );
      }
      expect(
        TrainingImagePolicy.resolveAssetPath('assets/images/$name'),
        'assets/images/$name',
      );
    }
    for (final path in [
      '/photos/smile_01.jpg',
      'assets/images/app_icon.png',
      'assets/images/unknown.jpg',
    ]) {
      expect(TrainingImagePolicy.resolveAssetPath(path), path);
    }
  });

  test(
    'hidden preferences migrate and remain excluded from every selection route',
    () async {
      final old = [
        'smile_09.jpg',
        'sad_24.jpg',
        'health_05.jpg',
        'bad_16.jpg',
        'vegetables_13.jpg',
        'badfood_70.png',
      ];
      SharedPreferences.setMockInitialValues({
        'hidden_images': jsonEncode(
          old.map((name) => 'assets/images/$name').toList(),
        ),
      });
      final expected = old
          .map(
            (name) =>
                TrainingImagePolicy.resolveAssetPath('assets/images/$name'),
          )
          .toSet();
      final hidden = HiddenImageService();
      expect(await hidden.getHiddenImages(), expected);
      final prefs = await SharedPreferences.getInstance();
      expect(
        (jsonDecode(prefs.getString('hidden_images')!) as List).toSet(),
        expected,
      );
      final available = await hidden.getAvailableImages();
      expect(available, hasLength(285));
      expect(
        available.every(
          (path) =>
              path.startsWith('assets/images/') && !expected.contains(path),
        ),
        isTrue,
      );
      expect(await hidden.isImageHidden('assets/images/smile_09.jpg'), isTrue);
      for (final group in ImageGroup.values) {
        for (var attempt = 0; attempt < 10; attempt++) {
          final paths = await RandomImageService.selectImagesForGroup(group);
          expect(paths, hasLength(4));
          expect(paths.toSet(), hasLength(4));
          expect(
            paths.every(
              (path) =>
                  catalog.contains(path.split('/').last) &&
                  !expected.contains(path),
            ),
            isTrue,
          );
          expect(
            paths.where(
              (path) => group.goodImageFolders.any(
                (prefix) => path.startsWith('assets/images/${prefix}_'),
              ),
            ),
            hasLength(1),
          );
          expect(
            paths.where(
              (path) => group.badImageFolders.any(
                (prefix) => path.startsWith('assets/images/${prefix}_'),
              ),
            ),
            hasLength(3),
          );
        }
      }
      await hidden.showImage('assets/images/smile_09.jpg');
      expect(await hidden.isImageHidden('assets/images/smile_09.jpg'), isFalse);
    },
  );

  test(
    'decode targets are bounded and bucketed for phone and tablet grids',
    () {
      expect(TrainingImagePolicy.decodeWidth(100, 2), 256);
      expect(TrainingImagePolicy.decodeWidth(126, 2), 256);
      expect(TrainingImagePolicy.decodeWidth(200, 3), 512);
      expect(TrainingImagePolicy.decodeWidth(600, 3), 512);
      expect(TrainingImagePolicy.decodeWidth(double.infinity, 2), 512);
    },
  );

  test(
    'maximum hidden settings still leave complete food and health rounds',
    () async {
      final vegetables = PlaceholderImages.positiveImages
          .where((name) => name.startsWith('vegetables_'))
          .toList();
      expect(vegetables, hasLength(16));
      expect(
        await HiddenImageService().setHiddenImages(
          vegetables.take(15).map((name) => 'assets/images/$name').toSet(),
        ),
        isTrue,
      );
      final food = await RandomImageService.selectImagesForGroup(
        ImageGroup.group2,
      );
      expect(food, hasLength(4));
      expect(
        food.where((path) => path.startsWith('assets/images/vegetables_')),
        ['assets/images/${vegetables.last}'],
      );

      final workImages = PlaceholderImages.negativeImages
          .where((name) => name.startsWith('bad_'))
          .toList();
      final hidden = workImages
          .take(15)
          .map((name) => 'assets/images/$name')
          .toSet();
      expect(await HiddenImageService().setHiddenImages(hidden), isTrue);
      final health = await RandomImageService.selectImagesForGroup(
        ImageGroup.group3,
      );
      expect(health, hasLength(4));
      expect(
        health.where((path) => path.startsWith('assets/images/bad_')),
        hasLength(3),
      );
      expect(health.any(hidden.contains), isFalse);
    },
  );
}
