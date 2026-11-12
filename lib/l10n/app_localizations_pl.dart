// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Aktualne punkty';

  @override
  String goalLabel(int goal) {
    return 'Cel: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Pozostało: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Cel osiągnięty!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'Ćwicz zauważanie tego, co pozytywne.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Pozostały czas: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Pozostały czas: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Wynik: $score pkt';
  }

  @override
  String get imagePreparationMessage => 'Przygotowywanie obrazów...';

  @override
  String get noStimuliAvailable => 'Brak dostępnych bodźców';

  @override
  String get invalidGridSize => 'Nieprawidłowy rozmiar siatki';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Rozpoczynanie...';

  @override
  String get excellentPerformance => 'Znakomity wynik!';

  @override
  String get greatJob => 'Świetna robota!';

  @override
  String get goodPerformance => 'Dobry wynik';

  @override
  String get keepPracticingFeedback => 'Ćwicz dalej';

  @override
  String get takeYourTimeFeedback => 'Nie spiesz się';

  @override
  String get happy => 'Radość';

  @override
  String get angry => 'Złość';

  @override
  String get fear => 'Strach';

  @override
  String get sad => 'Smutek';

  @override
  String get historyPageTitle => 'Historia treningów';

  @override
  String get dataLoading => 'Wczytywanie danych...';

  @override
  String get pointsHistory => 'Historia punktów';

  @override
  String get weekly => 'Tygodniowo';

  @override
  String get monthly => 'Miesięcznie';

  @override
  String get noDataAvailable => 'Brak danych';

  @override
  String get goalAchievementRate => 'Stopień realizacji celu';

  @override
  String get scoreStatistics => 'Statystyki wyników';

  @override
  String get bestScore => 'Najlepszy wynik';

  @override
  String get totalScore => 'Łączny wynik';

  @override
  String get trainingTime => 'Czas treningu';

  @override
  String get totalTrainingTime => 'Łączny czas treningu';

  @override
  String get detailedStatistics => 'Szczegółowe statystyki';

  @override
  String get averageScorePerMinute => 'Średni wynik na minutę';

  @override
  String get pointsToGoal => 'Punkty do celu';

  @override
  String get goalSetting => 'Ustawienie celu';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'godz.';

  @override
  String get pointsUnit => 'pkt';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'niedz.';

  @override
  String get mondayShort => 'pon.';

  @override
  String get tuesdayShort => 'wt.';

  @override
  String get wednesdayShort => 'śr.';

  @override
  String get thursdayShort => 'czw.';

  @override
  String get fridayShort => 'pt.';

  @override
  String get saturdayShort => 'sob.';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get goalPointsSetting => 'Ustawienie punktów celu';

  @override
  String currentGoalPoints(int points) {
    return 'Aktualny cel: $points pkt';
  }

  @override
  String get newGoalPointsLabel => 'Nowe punkty celu';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'pkt';

  @override
  String get saveGoalButton => 'Zapisz cel';

  @override
  String goalSetTo(int points) {
    return 'Ustawiono cel na $points pkt';
  }

  @override
  String get enterGoalPoints => 'Wprowadź punkty celu';

  @override
  String get enterValidNumber =>
      'Wprowadź prawidłową liczbę (od 1 do 99999999)';

  @override
  String get saveFailed => 'Nie udało się zapisać niektórych ustawień';

  @override
  String get emailOpenFailed => 'Nie udało się otworzyć aplikacji e-mail';

  @override
  String get pageOpenFailed => 'Nie udało się otworzyć strony';

  @override
  String get appInfoSupport => 'Informacje o aplikacji i pomoc';

  @override
  String get contactUs => 'Skontaktuj się z nami';

  @override
  String get contactUsSubtitle => 'Podziel się opinią i pytaniami';

  @override
  String get termsOfService => 'Regulamin';

  @override
  String get termsSubtitle => 'Zapoznaj się z regulaminem aplikacji';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get privacySubtitle => 'Informacje o przetwarzaniu danych osobowych';

  @override
  String get tutorialTitle => 'Samouczek';

  @override
  String get tutorialSubtitle => 'Dowiedz się, jak korzystać z aplikacji';

  @override
  String get dataManagement => 'Zarządzanie danymi';

  @override
  String get deleteHistory => 'Usuń historię';

  @override
  String get deleteHistorySubtitle =>
      'Usuwa tylko historię treningów (punkty celu zostaną zachowane)';

  @override
  String get deleteHistoryAndGoal => 'Usuń historię i cel';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Usuwa całą historię i punkty celu';

  @override
  String get deleteHistoryConfirmTitle => 'Usuń historię';

  @override
  String get deleteHistoryConfirmMessage =>
      'Czy na pewno chcesz usunąć całą historię treningów?\n\n*Punkty celu zostaną zachowane';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Usuń historię i cel';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Czy na pewno chcesz usunąć całą historię i punkty celu?\n\n*Tej operacji nie można cofnąć';

  @override
  String get cancel => 'Anuluj';

  @override
  String get delete => 'Usuń';

  @override
  String get historyDeleted => 'Historia została usunięta';

  @override
  String get historyAndGoalDeleted => 'Historia i cel zostały usunięte';

  @override
  String get historyDeleteFailed => 'Nie udało się usunąć historii';

  @override
  String get historyAndGoalDeleteFailed =>
      'Nie udało się usunąć historii i celu';

  @override
  String get tutorialDisplayFailed => 'Nie udało się wyświetlić samouczka';

  @override
  String get tips => 'Wskazówki';

  @override
  String get tipsContent =>
      '• Twój cel jest widoczny na wykresie na ekranie głównym\n• Zacznij od małego celu i zwiększaj go we własnym tempie\n• Każdy poprawny wybór daje do 6 punktów';

  @override
  String get backToHome => 'Powrót do ekranu głównego';

  @override
  String get tutorialSkip => 'Pomiń';

  @override
  String get tutorialGoalAndPoints => 'Cel i aktualne punkty';

  @override
  String get tutorialGoalDescription =>
      'Zewnętrzny okrąg pokazuje Twój cel, a wewnętrzny — łączną liczbę punktów. Okrąg wypełnia się w miarę zbliżania się do celu.';

  @override
  String get tutorialOneMinuteTraining => 'Trening 1-minutowy';

  @override
  String get tutorialTrainingDescription =>
      'Rozpocznij 1-minutową grę. Wybieraj pozytywne obrazy lub dobre nawyki spośród 4 opcji.';

  @override
  String get tutorialScoreProgress => 'Postępy wyników';

  @override
  String get tutorialScoreDescription =>
      'Zobacz szczegółowe informacje o zdobytych punktach.';

  @override
  String get tutorialSettingsAndData => 'Ustawienia i zarządzanie danymi';

  @override
  String get tutorialSettingsDescription =>
      'Zmieniaj wartości celu, przeglądaj informacje o aplikacji i resetuj dane.';

  @override
  String get appIntroAttentionBiasTitle => 'O tendencyjności uwagi';

  @override
  String get appIntroAttentionBiasContent =>
      'Gdy lęk jest silny, nieświadomie skupiamy się wyłącznie na rzeczach negatywnych.';

  @override
  String get appIntroFocusMintRoleTitle => 'Rola FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Krótka gra do ćwiczenia kierowania uwagi na pozytywne obrazy.';

  @override
  String get appIntroScientificEvidenceTitle => 'O tym ćwiczeniu';

  @override
  String get appIntroScientificEvidenceContent =>
      'Ćwicz znajdowanie pozytywnych obrazów. FocusMint to narzędzie dbania o siebie, a nie leczenie medyczne. Efekty mogą różnić się u poszczególnych osób.';

  @override
  String get appIntroExpectedEffectsTitle => 'Co możesz ćwiczyć';

  @override
  String get appIntroEffect1 => 'Szukanie pozytywnych obrazów';

  @override
  String get appIntroEffect2 => 'Zauważanie uśmiechów wokół siebie';

  @override
  String get appIntroEffect3 => 'Tworzenie krótkiej codziennej rutyny';

  @override
  String get appIntroHowToUse => 'Zobacz, jak korzystać';

  @override
  String get pointsEarned => 'Punkty zdobyte!';

  @override
  String get yourScore => 'Twój wynik';

  @override
  String get totalPlayTime => 'Łączny czas gry';

  @override
  String get imageManagement => 'Zarządzanie obrazami';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Ukryte obrazy: $count/$max';
  }

  @override
  String get unsavedChanges => 'Masz niezapisane zmiany';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Masz $count niezapisanych zmian w ustawieniach wyświetlania obrazów.';
  }

  @override
  String get unsavedChangesWarning =>
      'Jeśli zamkniesz teraz ten ekran, zmiany zostaną utracone.';

  @override
  String get discardChanges => 'Odrzuć zmiany';

  @override
  String get saveAndExit => 'Zapisz i wyjdź';

  @override
  String settingsSaved(Object count) {
    return 'Zapisano ustawienia: $count';
  }

  @override
  String get saveError => 'Wystąpił błąd podczas zapisywania ustawień';

  @override
  String get imageSettingsUpdated =>
      'Ustawienia obrazów zostały zaktualizowane';

  @override
  String get allImages => 'Wszystkie';

  @override
  String get positiveImages => 'Pozytywne';

  @override
  String get negativeImages => 'Negatywne';

  @override
  String get smileImages => 'Uśmiech';

  @override
  String get vegetableImages => 'Pożywne jedzenie';

  @override
  String get healthImages => 'Ruch i kontakty z innymi';

  @override
  String get sadImages => 'Złość, smutek i zmartwienie';

  @override
  String get badFoodImages => 'Fast food i słodycze';

  @override
  String get badImages => 'Niezdrowe nawyki';

  @override
  String get imageManagementHint =>
      'Dotknij, aby pokazać lub ukryć obraz. Możesz ukryć maksymalnie 15 obrazów.';

  @override
  String get unsaved => 'Niezapisane';

  @override
  String get save => 'Zapisz';

  @override
  String get hiddenImages => 'Ukryte';

  @override
  String get noHiddenImages => 'Brak ukrytych obrazów';

  @override
  String get settingsLoadFailed => 'Nie udało się wczytać ustawień';

  @override
  String imagesAdded(int count) {
    return 'Dodano obrazy: $count';
  }

  @override
  String get imageAddFailed => 'Nie udało się dodać obrazów';

  @override
  String get imageSelectionFailed => 'Nie udało się wybrać obrazów';

  @override
  String get settingsChangeFailed => 'Nie udało się zmienić ustawień';

  @override
  String groupTitle(String name) {
    return 'Grupa: $name';
  }

  @override
  String get displayToggle => 'Przełącz widoczność';

  @override
  String imageCount(int count) {
    return 'Obrazy: $count';
  }

  @override
  String get noticeTitle => 'Ważne uwagi';

  @override
  String get notice1 => 'Dodano funkcję własnych obrazów!';

  @override
  String get notice2 => 'Możesz dodać własne obrazy na ekranie ustawień';

  @override
  String get notice3 => 'Szczegóły znajdziesz na ekranie ustawień';

  @override
  String get customImageTitle => 'Własne obrazy';

  @override
  String get customImageSubtitle => 'Dodawaj własne obrazy i zarządzaj nimi';

  @override
  String get addCustomImages => 'Dodaj własne obrazy';

  @override
  String get selectImages => 'Wybierz obrazy';

  @override
  String get unknownImage => 'Nieznany obraz';

  @override
  String get customImageSettings => 'Ustawienia własnych obrazów';

  @override
  String get useCustomImages => 'Używaj własnych obrazów';

  @override
  String get useCustomImagesDescription =>
      'Używaj własnych obrazów do ćwiczeń. Włącz poniżej mieszanie, aby dodać obrazy z aplikacji.';

  @override
  String get groupSettings => 'Ustawienia grup';

  @override
  String get minOneGroupRequired => 'Co najmniej jedna grupa musi być włączona';

  @override
  String get settingsLoadFailedMessage => 'Nie udało się wczytać ustawień';

  @override
  String get customImageNotice1 =>
      'Gdy grupy są włączone, obrazy są wyświetlane losowo w ramach każdej grupy.';

  @override
  String get customImageNotice2 =>
      'Obrazy przesłane i ustawione przez użytkownika nie są udostępniane deweloperom ani osobom trzecim i są przechowywane wyłącznie w obszarze aplikacji na urządzeniu.';

  @override
  String get customImageNotice3 =>
      'Dzięki temu aplikacja działa również offline.';

  @override
  String get customImageNotice4 =>
      'Duża liczba obrazów zajmuje pamięć. W razie problemów wyłącz własne obrazy lub usuń nieużywane w ustawieniach.';

  @override
  String get customImageNotice5 =>
      'Po usunięciu aplikacji ustawione obrazy zostaną usunięte.';

  @override
  String get customImageRequirementNotMet =>
      'Aby korzystać z własnych obrazów, we włączonych grupach musi się znajdować co najmniej 1 dobry obraz i 3 mniej dobre obrazy.';

  @override
  String get customImageRequirement =>
      'Aby korzystać z własnych obrazów, we włączonych grupach musi się znajdować co najmniej 1 dobry obraz i 3 mniej dobre obrazy.';

  @override
  String get sunnyWeather => 'Dobre';

  @override
  String get rainyWeather => 'Mniej dobre';

  @override
  String get addImages => 'Dodaj obrazy';

  @override
  String get imageDeleted => 'Obraz został usunięty';

  @override
  String get imageDeleteFailed => 'Nie udało się usunąć obrazu';

  @override
  String get deleteImageTitle => 'Usuń obraz';

  @override
  String get deleteImageMessage =>
      'Czy chcesz usunąć ten obraz? Tej operacji nie można cofnąć.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Grupa $groupId – obrazy: $weather';
  }

  @override
  String registeredCount(int count) {
    return 'Zarejestrowane obrazy: $count';
  }

  @override
  String get noImagesRegistered => 'Brak zarejestrowanych obrazów';

  @override
  String get imagePreview => 'Podgląd obrazu';

  @override
  String get close => 'Zamknij';

  @override
  String get contactEmailSubject => 'FocusMint – Kontakt';

  @override
  String get contactEmailBody => 'Prosimy o przesłanie opinii i pytań.';

  @override
  String get mixWithBuiltInImages => 'Mieszaj z obrazami aplikacji';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Używaj jednocześnie własnych obrazów i obrazów aplikacji';

  @override
  String get supportIntro =>
      'Pisz anonimowo do twórcy aplikacji. Pytania i sugestie są mile widziane. Możesz wysłać 3 wiadomości dziennie. Każda odpowiedź twórcy przywraca limit do 3.';

  @override
  String get supportReceived =>
      'Wiadomość odebrana. Zwykle odpowiadamy w ciągu 2–3 dni.';

  @override
  String get supportComposer => 'Wpisz wiadomość';

  @override
  String get supportSend => 'Wyślij';

  @override
  String get supportRetry => 'Ponów';

  @override
  String get supportSent => 'Wysłano';

  @override
  String get supportUnsent => 'Niewysłane · zapisane na tym urządzeniu';

  @override
  String get supportAttach => 'Dołącz obraz';

  @override
  String get supportRemoveImage => 'Usuń obraz';

  @override
  String get supportImage => 'Załącznik';

  @override
  String get supportClear => 'Usuń historię';

  @override
  String get supportClearConfirm =>
      'Usunąć tę rozmowę? Niewysłane wersje robocze i historia na serwerze też zostaną usunięte. Limit wiadomości nie zostanie przywrócony.';

  @override
  String get supportQuota =>
      'Dzisiejszy limit 3 wiadomości został wykorzystany. Wyślij kolejną jutro lub po odpowiedzi twórcy.';

  @override
  String get supportConnectionError =>
      'Nie udało się połączyć. Zapisane wersje robocze nie zostały wysłane.';

  @override
  String get supportSendError =>
      'Nie udało się wysłać. Wiadomość jest zapisana na tym urządzeniu. Spróbuj ponownie.';

  @override
  String get supportStorageError => 'Nie udało się zapisać. Spróbuj ponownie.';

  @override
  String get supportClearError =>
      'Nie udało się usunąć historii. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String get supportImageError =>
      'Nie udało się wczytać obrazu. Wybierz obraz mniejszy niż 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Pozostałe wiadomości na dziś: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Nieprzeczytane odpowiedzi: $count';
  }

  @override
  String get supportGuide => 'Informacje';

  @override
  String get supportDeveloper => 'Twórca aplikacji';

  @override
  String get supportPrivacy => 'O danych kontaktu z pomocą';

  @override
  String get breathingTitle => 'Weź spokojny oddech';

  @override
  String get breathingHint =>
      'Podążaj za łagodnym ruchem płuc\nw wygodnym dla siebie tempie.';

  @override
  String get breathingIn => 'Powoli wdychaj';

  @override
  String get breathingOut => 'Powoli wydychaj';

  @override
  String get breathingProgress => 'Postęp ćwiczenia oddechowego';

  @override
  String get breathingResultHint => 'Wyniki pojawią się automatycznie.';

  @override
  String get breathingSkip => 'Przejdź do wyników';
}
