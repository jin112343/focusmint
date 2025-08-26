import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusmint/widgets/fixation_point.dart';
import 'package:focusmint/widgets/session_timer.dart';
import 'package:focusmint/widgets/stimulus_grid.dart';
import 'package:focusmint/models/image_stimulus.dart';

void main() {
  group('FixationPoint Widget', () {
    testWidgets('should render with default properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FixationPoint(),
          ),
        ),
      );

      expect(find.byType(FixationPoint), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should render with custom size and color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FixationPoint(
              size: 30.0,
              color: Colors.red,
              animate: false,
            ),
          ),
        ),
      );

      expect(find.byType(FixationPoint), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(FixationPoint),
          matching: find.byType(Container),
        ).first,
      );
      
      expect(container.constraints?.maxWidth, equals(30.0));
      expect(container.constraints?.maxHeight, equals(30.0));
    });

    testWidgets('should animate when animate is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FixationPoint(animate: true),
          ),
        ),
      );

      expect(find.byType(AnimatedBuilder), findsOneWidget);
      
      // Trigger animation
      await tester.pump(const Duration(milliseconds: 400));
      
      expect(find.byType(FixationPoint), findsOneWidget);
    });
  });

  group('SessionTimer Widget', () {
    testWidgets('should display remaining time correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SessionTimer(
              remainingSeconds: 125, // 2:05
              progressPercent: 0.5,
            ),
          ),
        ),
      );

      expect(find.text('2:05'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('should show red color when time is low', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SessionTimer(
              remainingSeconds: 30, // Low time
              progressPercent: 0.9,
            ),
          ),
        ),
      );

      expect(find.text('0:30'), findsOneWidget);
      
      final textWidget = tester.widget<Text>(find.text('0:30'));
      expect(textWidget.style?.color, equals(Colors.red));
    });

    testWidgets('should hide progress bar when showProgress is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SessionTimer(
              remainingSeconds: 125,
              progressPercent: 0.5,
              showProgress: false,
            ),
          ),
        ),
      );

      expect(find.text('2:05'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
    });
  });

  group('CircularSessionTimer Widget', () {
    testWidgets('should display circular progress and time', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CircularSessionTimer(
              remainingSeconds: 65,
              progressPercent: 0.3,
            ),
          ),
        ),
      );

      expect(find.text('1:05'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should hide digital time when showDigitalTime is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CircularSessionTimer(
              remainingSeconds: 65,
              progressPercent: 0.3,
              showDigitalTime: false,
            ),
          ),
        ),
      );

      expect(find.text('1:05'), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('StimulusGrid Widget', () {
    late List<ImageStimulus> testStimuli;

    setUp(() {
      testStimuli = [
        const ImageStimulus(
          id: 'happy1',
          assetPath: 'assets/test/happy1.png',
          valence: Valence.positive,
          emotion: Emotion.happiness,
        ),
        const ImageStimulus(
          id: 'angry1',
          assetPath: 'assets/test/angry1.png',
          valence: Valence.negative,
          emotion: Emotion.anger,
        ),
        const ImageStimulus(
          id: 'fear1',
          assetPath: 'assets/test/fear1.png',
          valence: Valence.negative,
          emotion: Emotion.fear,
        ),
        const ImageStimulus(
          id: 'sad1',
          assetPath: 'assets/test/sad1.png',
          valence: Valence.negative,
          emotion: Emotion.sadness,
        ),
      ];
    });

    testWidgets('should render grid with correct number of items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StimulusGrid(
              stimuli: testStimuli,
            ),
          ),
        ),
      );

      expect(find.byType(StimulusGrid), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(StimulusItem), findsNWidgets(4));
    });

    testWidgets('should display empty state when no stimuli', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StimulusGrid(
              stimuli: [],
            ),
          ),
        ),
      );

      expect(find.text('No stimuli available'), findsOneWidget);
    });

    testWidgets('should handle tap on stimulus item', (WidgetTester tester) async {
      String? selectedId;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StimulusGrid(
              stimuli: testStimuli,
              onStimulusSelected: (id) {
                selectedId = id;
              },
            ),
          ),
        ),
      );

      // Tap on first stimulus
      await tester.tap(find.byType(StimulusItem).first);
      await tester.pumpAndSettle();

      expect(selectedId, equals('happy1'));
    });

    testWidgets('should show placeholder faces when showPlaceholders is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StimulusGrid(
              stimuli: testStimuli,
              showPlaceholders: true,
            ),
          ),
        ),
      );

      // Should find emotion icons as placeholders
      expect(find.byIcon(Icons.sentiment_very_satisfied), findsOneWidget);
      expect(find.byIcon(Icons.sentiment_very_dissatisfied), findsNWidgets(2));
      expect(find.byIcon(Icons.sentiment_dissatisfied), findsOneWidget);
    });
  });

  group('StimulusItem Widget', () {
    late ImageStimulus testStimulus;

    setUp(() {
      testStimulus = const ImageStimulus(
        id: 'happy1',
        assetPath: 'assets/test/happy1.png',
        valence: Valence.positive,
        emotion: Emotion.happiness,
      );
    });

    testWidgets('should render positive stimulus with correct icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StimulusItem(
              stimulus: testStimulus,
              showPlaceholder: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.sentiment_very_satisfied), findsOneWidget);
      expect(find.text('Happy'), findsOneWidget);
    });

    testWidgets('should render negative stimulus with correct icon', (WidgetTester tester) async {
      final negativeStimulus = testStimulus.copyWith(
        valence: Valence.negative,
        emotion: Emotion.anger,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StimulusItem(
              stimulus: negativeStimulus,
              showPlaceholder: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.sentiment_very_dissatisfied), findsOneWidget);
      expect(find.text('Angry'), findsOneWidget);
    });

    testWidgets('should animate on tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StimulusItem(
              stimulus: testStimulus,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(StimulusItem));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });
  });

  group('GridPreview Widget', () {
    testWidgets('should display preview for 2x2 grid', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GridPreview(gridSize: 4), // 2x2
          ),
        ),
      );

      expect(find.byType(GridPreview), findsOneWidget);
      expect(find.byIcon(Icons.sentiment_very_satisfied), findsOneWidget);
      expect(find.byIcon(Icons.sentiment_very_dissatisfied), findsNWidgets(3));
    });

    testWidgets('should display preview for 3x3 grid', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GridPreview(gridSize: 9), // 3x3
          ),
        ),
      );

      expect(find.byType(GridPreview), findsOneWidget);
      expect(find.byIcon(Icons.sentiment_very_satisfied), findsOneWidget);
      expect(find.byIcon(Icons.sentiment_very_dissatisfied), findsNWidgets(8));
    });

    testWidgets('should show error state for invalid grid size', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GridPreview(gridSize: 999), // Invalid size
          ),
        ),
      );

      expect(find.text('?'), findsOneWidget);
    });
  });
}