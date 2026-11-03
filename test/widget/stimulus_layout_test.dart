import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/widgets/stimulus_grid.dart';

void main() {
  testWidgets('all four images fit in a short landscape area', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 600,
              height: 220,
              child: StimulusGrid(
                showPlaceholders: false,
                stimuli: List.generate(
                  4,
                  (i) => ImageStimulus(
                    id: '$i',
                    assetPath: 'assets/images/smile_01.jpg',
                    valence: Valence.positive,
                    emotion: Emotion.happiness,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsNWidgets(4));
    for (final element in find.byType(Image).evaluate()) {
      final rect = tester.getRect(find.byWidget(element.widget));
      expect(rect.bottom, lessThanOrEqualTo(220));
      expect(rect.top, greaterThanOrEqualTo(0));
    }
    expect(tester.takeException(), isNull);
  });
}
