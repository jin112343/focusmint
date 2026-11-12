import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/widgets/image_management_widget.dart';
import 'package:focusmint/services/hidden_image_service.dart';

Future<void> openImages(WidgetTester tester) async {
  SharedPreferences.setMockInitialValues({});
  await tester.pumpWidget(
    MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
      home: Builder(
        builder: (context) => Scaffold(
          body: TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => Scaffold(
                  appBar: AppBar(),
                  body: const ImageManagementWidget(),
                ),
              ),
            ),
            child: const Text('Open images'),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  await tester.tap(find.text('Open images'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('toggling the same image twice leaves no unsaved change', (
    tester,
  ) async {
    await openImages(tester);
    await tester.tap(find.byType(Image).first);
    await tester.pump();
    expect(find.text('Unsaved'), findsOneWidget);
    await tester.tap(find.byType(Image).first);
    await tester.pump();
    expect(find.text('Unsaved'), findsNothing);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(ImageManagementWidget), findsNothing);
    expect(await HiddenImageService().getHiddenImages(), isEmpty);
  });

  testWidgets('discarding changes does not save them', (tester) async {
    await openImages(tester);
    await tester.tap(find.byType(Image).first);
    await tester.pump();
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Discard Changes'));
    await tester.pumpAndSettle();
    expect(find.byType(ImageManagementWidget), findsNothing);
    expect(await HiddenImageService().getHiddenImages(), isEmpty);
  });

  testWidgets('save and exit persists the selected hidden image', (
    tester,
  ) async {
    await openImages(tester);
    final image = tester.widget<Image>(find.byType(Image).first);
    final resized = image.image as ResizeImage;
    final asset = (resized.imageProvider as AssetImage).assetName;
    await tester.tap(find.byType(Image).first);
    await tester.pump();
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save and Exit'));
    await tester.pumpAndSettle();
    expect(find.byType(ImageManagementWidget), findsNothing);
    expect(await HiddenImageService().getHiddenImages(), {asset});
  });

  test(
    'replacing a full hidden list is atomic and enforces the limit',
    () async {
      final old = List.generate(15, (i) => 'old-$i');
      SharedPreferences.setMockInitialValues({
        'hidden_images': jsonEncode(old),
      });
      final replacement = {...old.skip(1), 'replacement'};
      expect(await HiddenImageService().setHiddenImages(replacement), isTrue);
      expect(await HiddenImageService().getHiddenImages(), replacement);
      expect(
        await HiddenImageService().setHiddenImages({...replacement, 'extra'}),
        isFalse,
      );
      expect(await HiddenImageService().getHiddenImages(), replacement);
    },
  );
}
