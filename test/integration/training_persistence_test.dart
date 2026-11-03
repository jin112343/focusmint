import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/pages/result_page.dart';
import 'package:focusmint/widgets/stimulus_grid.dart';

import 'training_flow_test.dart' show launch;

Future<void> startTraining(WidgetTester tester) async {
  await launch(tester);
  await tester.tap(find.text('START'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
  expect(find.byType(StimulusGrid), findsOneWidget);
}

Future<void> answerCorrectly(WidgetTester tester) async {
  final positive = find.byWidgetPredicate(
    (widget) =>
        widget is StimulusItem && widget.stimulus.valence == Valence.positive,
  );
  await tester.tap(positive);
}

void main() {
  testWidgets('completed training adds score and time exactly once', (
    tester,
  ) async {
    await startTraining(tester);
    await answerCorrectly(tester);
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pump(const Duration(seconds: 60));
    await tester.pumpAndSettle();
    final result = tester.widget<ResultPage>(find.byType(ResultPage));
    final prefs = await SharedPreferences.getInstance();
    expect(result.currentScore, greaterThan(0));
    expect(prefs.getDouble('total_score'), result.currentScore);
    expect(prefs.getInt('total_time_seconds'), 60);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('closing before the score animation still saves the answer', (
    tester,
  ) async {
    await startTraining(tester);
    await answerCorrectly(tester);
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getDouble('total_score'), greaterThan(0));
    expect(prefs.getDouble('total_score'), prefs.getDouble('best_score'));
  });

  testWidgets('closing early does not add elapsed time twice', (tester) async {
    await startTraining(tester);
    await tester.pump(const Duration(seconds: 5));
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getInt('total_time_seconds'), inInclusiveRange(5, 6));
  });
}
