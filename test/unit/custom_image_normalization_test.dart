import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/models/custom_image_models.dart';
import 'package:focusmint/repositories/custom_image_repository.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory directory;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    directory = await Directory.systemTemp.createTemp('focusmint-import-');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (call) async => directory.path,
        );
  });
  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          null,
        );
    await directory.delete(recursive: true);
  });

  Future<img.Image> import(img.Image image) async {
    final source = File('${directory.path}/input.jpg');
    await source.writeAsBytes(img.encodeJpg(image, quality: 100));
    final result = await CustomImageRepository.instance.addImage(
      1,
      WeatherType.sunny,
      source.path,
    );
    expect(result, isNot(source.path));
    final settings = await CustomImageRepository.instance.getSettings();
    expect(
      settings.getGroup(1)!.imagePaths[WeatherType.sunny],
      contains(result),
    );
    return img.decodeImage(await File(result).readAsBytes())!;
  }

  test(
    'large imports are square and capped, small imports are not enlarged',
    () async {
      final large = await import(img.Image(width: 1200, height: 900));
      expect([large.width, large.height], [512, 512]);
      final small = await import(img.Image(width: 90, height: 60));
      expect([small.width, small.height], [60, 60]);
    },
  );

  test('camera EXIF orientation is applied before the square crop', () async {
    final image = img.Image(width: 120, height: 80);
    for (var y = 0; y < image.height; y++) {
      for (var x = 0; x < image.width; x++) {
        image.setPixelRgb(x, y, x < 60 ? 240 : 0, 0, x < 60 ? 0 : 240);
      }
    }
    image.exif.imageIfd.orientation = 6;
    final result = await import(image);
    expect([result.width, result.height], [80, 80]);
    expect(result.getPixel(40, 10).r, greaterThan(200));
    expect(result.getPixel(40, 70).b, greaterThan(200));
    expect(result.exif.imageIfd.orientation ?? 1, 1);
  });
}
