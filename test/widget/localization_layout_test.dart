import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/l10n/app_localizations.dart';
import 'package:focusmint/pages/breathing_page.dart';
import 'package:focusmint/pages/contact_page.dart';
import 'package:focusmint/pages/history_page.dart';
import 'package:focusmint/pages/home_page.dart';
import 'package:focusmint/pages/result_page.dart';
import 'package:focusmint/pages/settings_page.dart';
import 'package:focusmint/pages/training_page.dart';
import 'package:focusmint/pages/settings/customize_settings_page.dart';
import 'package:focusmint/services/support_service.dart';
import 'package:focusmint/widgets/app_introduction_widget.dart';
import 'package:focusmint/widgets/image_management_widget.dart';

import '../support/support_fixture.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('$locale shipping screens fit a narrow phone', (tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({'tutorial_completed': true});
      final fixture = SupportFixture();
      FlutterErrorDetails? lastError;
      final previousErrorHandler = FlutterError.onError;
      FlutterError.onError = (details) {
        lastError = details;
        previousErrorHandler?.call(details);
      };
      addTearDown(() => FlutterError.onError = previousErrorHandler);
      fixture.storage.identity = {
        'id': SupportFixture.owner,
        'token': List.filled(64, 'a').join(),
      };
      fixture.addReply(
        'bbbbbbbb-bbbb-4bbb-bbbb-bbbbbbbbbbbb',
        'support.received',
      );
      for (final page in <Widget>[
        const HomePage(),
        const SettingsPage(),
        const HistoryPage(),
        const ImageManagementWidget(),
        const CustomizeSettingsPage(),
        const ContactPage(),
        const ResultPage(currentScore: 123.45),
        const TrainingPage(),
        const BreathingPage(currentScore: 123.45),
      ]) {
        await tester.pumpWidget(
          ProviderScope(
            key: UniqueKey(),
            overrides: [supportProvider.overrideWith((_) => fixture.service())],
            child: MaterialApp(
              locale: locale,
              theme: AppTheme.lightTheme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: page is ImageManagementWidget ? Scaffold(body: page) : page,
            ),
          ),
        );
        if (page is BreathingPage || page is TrainingPage) {
          await tester.pump(const Duration(milliseconds: 500));
        } else {
          await tester.pumpAndSettle();
        }
        expect(
          tester.takeException(),
          isNull,
          reason: '$locale ${page.runtimeType}\n$lastError',
        );
        final context = tester.element(find.byType(page.runtimeType));
        expect(
          Directionality.of(context),
          ['ar', 'he'].contains(locale.languageCode)
              ? TextDirection.rtl
              : TextDirection.ltr,
        );
        if (page is ImageManagementWidget) {
          await tester.tap(find.byType(Image).first);
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull,
              reason: '$locale pending image settings\n$lastError');
        }
        if (page is ContactPage) {
          tester.view.viewInsets = const FakeViewPadding(bottom: 260);
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull,
              reason: '$locale contact with keyboard\n$lastError');
          tester.view.resetViewInsets();
        }
        if (page is HomePage) {
          AppIntroductionDialog.show(context, () {});
          await tester.pumpAndSettle();
          expect(
            tester.takeException(),
            isNull,
            reason: '$locale introduction',
          );
        }
      }
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }
}
