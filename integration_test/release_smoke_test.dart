import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/main.dart' as app;
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/widgets/stimulus_grid.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'native app loads images, accepts an answer, and saves on close',
    (tester) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('tutorial_completed', true);
      final previousScore = prefs.getDouble('total_score') ?? 0.0;
      await app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('START'));
      await tester.pumpAndSettle();
      expect(find.byType(StimulusGrid), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(4));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.tap(
        find.byWidgetPredicate(
          (widget) =>
              widget is StimulusItem &&
              widget.stimulus.valence == Valence.positive,
        ),
      );
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(prefs.getDouble('total_score'), greaterThan(previousScore));
      expect(find.text('START'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
