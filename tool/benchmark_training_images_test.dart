import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/constants/placeholder_images.dart';
import 'package:focusmint/constants/training_image_policy.dart';

// Run explicitly with flutter test and FOCUSMINT_BASELINE_ASSETS / REPORT defines.
// This measures cold native decoding on the test host, not phone frame times.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'measure original full decode and bounded training-tile decode',
    () async {
      const baseline = String.fromEnvironment('FOCUSMINT_BASELINE_ASSETS');
      const reportPath = String.fromEnvironment('FOCUSMINT_DECODE_REPORT');
      const candidate = String.fromEnvironment('FOCUSMINT_CANDIDATE_ASSETS');
      expect(baseline, isNotEmpty);
      expect(reportPath, isNotEmpty);
      final originals = {
        for (final file in Directory(baseline).listSync().whereType<File>())
          file.uri.pathSegments.last.replaceFirst(RegExp(r'\.[^.]+$'), ''):
              file,
      };
      final target = TrainingImagePolicy.decodeWidth(175, 3);
      final rows = <Map<String, Object>>[];
      Future<Map<String, int>> decode(Uint8List bytes, int? width) async {
        final watch = Stopwatch()..start();
        final codec = await ui.instantiateImageCodec(
          bytes,
          targetWidth: width,
          allowUpscaling: false,
        );
        final frame = await codec.getNextFrame();
        watch.stop();
        final result = {
          'microseconds': watch.elapsedMicroseconds,
          'width': frame.image.width,
          'height': frame.image.height,
          'rgbaBytes': frame.image.width * frame.image.height * 4,
        };
        frame.image.dispose();
        codec.dispose();
        return result;
      }

      for (final name in [
        ...PlaceholderImages.positiveImages,
        ...PlaceholderImages.negativeImages,
      ]) {
        final stem = name.replaceFirst(RegExp(r'(_v2)?\.webp$'), '');
        final oldBytes = await originals[stem]!.readAsBytes();
        final Uint8List newBytes;
        if (candidate.isNotEmpty) {
          newBytes = await File('$candidate/$name').readAsBytes();
        } else {
          final data = await rootBundle.load('assets/images/$name');
          newBytes = data.buffer.asUint8List(
            data.offsetInBytes,
            data.lengthInBytes,
          );
        }
        rows.add({
          'filename': name,
          'original': await decode(oldBytes, null),
          'optimized': await decode(newBytes, target),
        });
      }
      Map<String, Object> summarize(String key) {
        final measurements = rows
            .map((row) => row[key] as Map<String, int>)
            .toList();
        final times = measurements.map((row) => row['microseconds']!).toList()
          ..sort();
        int percentile(double p) => times[((times.length - 1) * p).round()];
        return {
          'totalDecodeMicroseconds': times.fold<int>(0, (sum, n) => sum + n),
          'p50Microseconds': percentile(.50),
          'p95Microseconds': percentile(.95),
          'p99Microseconds': percentile(.99),
          'maxMicroseconds': times.last,
          'totalDecodedRgbaBytes': measurements.fold<int>(
            0,
            (sum, row) => sum + row['rgbaBytes']!,
          ),
          'maxDecodedRgbaBytes': measurements
              .map((row) => row['rgbaBytes']!)
              .reduce((a, b) => a > b ? a : b),
        };
      }

      final report = {
        'count': rows.length,
        'targetWidth': target,
        'method': 'One alternating cold-codec pass, excluding file reads; original full size versus new tile decode. Test-host timing only.',
        'original': summarize('original'),
        'optimized': summarize('optimized'),
        'images': rows,
      };
      await File(reportPath).writeAsString(
        '${const JsonEncoder.withIndent('  ').convert(report)}\n',
      );
      expect(rows, hasLength(291));
    },
  );
}
