import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/services/image_service.dart';

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
      test('builds a 4-image set from bundled assets for ${group.name}', () async {
        final stimuli = await ImageService().getRandomStimuliSet(group);

        expect(stimuli, hasLength(4));
        expect(stimuli.where((s) => s.valence == Valence.positive), hasLength(1));
        expect(stimuli.where((s) => s.valence == Valence.negative), hasLength(3));
        for (final stimulus in stimuli) {
          expect(stimulus.assetPath, startsWith('assets/images/'));
          expect(stimulus.isCustomImage, isFalse);
        }
      });
    }
  });
}
