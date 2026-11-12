// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Mevcut Puan';

  @override
  String goalLabel(int goal) {
    return 'Hedef: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Kalan: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Hedefe Ulaşıldı!';

  @override
  String get startButtonText => 'BAŞLA';

  @override
  String get stressReductionMessage => 'Olumlu şeyleri fark etmeyi çalışın.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Kalan süre: $minutes dk $seconds sn';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Kalan süre: $seconds sn';
  }

  @override
  String scoreLabel(String score) {
    return 'Skor: $score Puan';
  }

  @override
  String get imagePreparationMessage => 'Görseller hazırlanıyor...';

  @override
  String get noStimuliAvailable => 'Kullanılabilir uyaran yok';

  @override
  String get invalidGridSize => 'Geçersiz ızgara boyutu';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Başlıyor...';

  @override
  String get excellentPerformance => 'Mükemmel performans!';

  @override
  String get greatJob => 'Harika iş!';

  @override
  String get goodPerformance => 'İyi performans';

  @override
  String get keepPracticingFeedback => 'Pratik yapmaya devam edin';

  @override
  String get takeYourTimeFeedback => 'Acele etmeyin';

  @override
  String get happy => 'Mutlu';

  @override
  String get angry => 'Kızgın';

  @override
  String get fear => 'Korku';

  @override
  String get sad => 'Üzgün';

  @override
  String get historyPageTitle => 'Antrenman Geçmişi';

  @override
  String get dataLoading => 'Veriler yükleniyor...';

  @override
  String get pointsHistory => 'Puan Geçmişi';

  @override
  String get weekly => 'Haftalık';

  @override
  String get monthly => 'Aylık';

  @override
  String get noDataAvailable => 'Veri yok';

  @override
  String get goalAchievementRate => 'Hedefe Ulaşma Oranı';

  @override
  String get scoreStatistics => 'Skor İstatistikleri';

  @override
  String get bestScore => 'En İyi Skor';

  @override
  String get totalScore => 'Toplam Skor';

  @override
  String get trainingTime => 'Antrenman Süresi';

  @override
  String get totalTrainingTime => 'Toplam Antrenman Süresi';

  @override
  String get detailedStatistics => 'Ayrıntılı İstatistikler';

  @override
  String get averageScorePerMinute => 'Dakika başına ortalama skor';

  @override
  String get pointsToGoal => 'Hedefe kalan puan';

  @override
  String get goalSetting => 'Hedef belirleme';

  @override
  String get secondsUnit => 'sn';

  @override
  String get minutesUnit => 'dk';

  @override
  String get hoursUnit => 'sa';

  @override
  String get pointsUnit => 'puan';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Paz';

  @override
  String get mondayShort => 'Pzt';

  @override
  String get tuesdayShort => 'Sal';

  @override
  String get wednesdayShort => 'Çar';

  @override
  String get thursdayShort => 'Per';

  @override
  String get fridayShort => 'Cum';

  @override
  String get saturdayShort => 'Cmt';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get goalPointsSetting => 'Hedef Puan Ayarı';

  @override
  String currentGoalPoints(int points) {
    return 'Mevcut hedef: $points puan';
  }

  @override
  String get newGoalPointsLabel => 'Yeni hedef puanı';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'puan';

  @override
  String get saveGoalButton => 'Hedefi Kaydet';

  @override
  String goalSetTo(int points) {
    return 'Hedef $points puan olarak ayarlandı';
  }

  @override
  String get enterGoalPoints => 'Lütfen hedef puanı girin';

  @override
  String get enterValidNumber =>
      'Lütfen geçerli bir sayı girin (1 ile 99999999 arası)';

  @override
  String get saveFailed => 'Bazı ayarlar kaydedilemedi';

  @override
  String get emailOpenFailed => 'E-posta uygulaması açılamadı';

  @override
  String get pageOpenFailed => 'Sayfa açılamadı';

  @override
  String get appInfoSupport => 'Uygulama Bilgisi ve Destek';

  @override
  String get contactUs => 'Bize Ulaşın';

  @override
  String get contactUsSubtitle => 'Görüş ve sorularınızı bizimle paylaşın';

  @override
  String get termsOfService => 'Kullanım Koşulları';

  @override
  String get termsSubtitle => 'Uygulamanın kullanım koşullarını inceleyin';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get privacySubtitle => 'Gizlilik bilgilerinin işlenmesi hakkında';

  @override
  String get tutorialTitle => 'Eğitim';

  @override
  String get tutorialSubtitle => 'Uygulamanın nasıl kullanılacağını öğrenin';

  @override
  String get dataManagement => 'Veri Yönetimi';

  @override
  String get deleteHistory => 'Geçmişi Sil';

  @override
  String get deleteHistorySubtitle =>
      'Yalnızca antrenman geçmişini siler (hedef puan korunur)';

  @override
  String get deleteHistoryAndGoal => 'Geçmişi ve Hedefi Sil';

  @override
  String get deleteHistoryAndGoalSubtitle => 'Tüm geçmişi ve hedef puanı siler';

  @override
  String get deleteHistoryConfirmTitle => 'Geçmişi Sil';

  @override
  String get deleteHistoryConfirmMessage =>
      'Tüm antrenman geçmişini silmek istediğinizden emin misiniz?\n\n*Hedef puan korunacaktır';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Geçmişi ve Hedefi Sil';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Tüm geçmişi ve hedef puanı silmek istediğinizden emin misiniz?\n\n*Bu işlem geri alınamaz';

  @override
  String get cancel => 'İptal';

  @override
  String get delete => 'Sil';

  @override
  String get historyDeleted => 'Geçmiş silindi';

  @override
  String get historyAndGoalDeleted => 'Geçmiş ve hedef silindi';

  @override
  String get historyDeleteFailed => 'Geçmiş silinemedi';

  @override
  String get historyAndGoalDeleteFailed => 'Geçmiş ve hedef silinemedi';

  @override
  String get tutorialDisplayFailed => 'Eğitim görüntülenemedi';

  @override
  String get tips => 'İpuçları';

  @override
  String get tipsContent =>
      '• Hedefiniz ana ekrandaki grafikte görünür\n• Küçük bir hedefle başlayın ve kendi hızınızda artırın\n• Her doğru seçim en fazla 6 puan kazandırır';

  @override
  String get backToHome => 'Ana Ekrana Dön';

  @override
  String get tutorialSkip => 'Atla';

  @override
  String get tutorialGoalAndPoints => 'Hedef ve Mevcut Puan';

  @override
  String get tutorialGoalDescription =>
      'Dış daire hedefinizi, iç daire toplam puanınızı gösterir. Hedefinize yaklaştıkça daire dolar.';

  @override
  String get tutorialOneMinuteTraining => '1 Dakikalık Antrenman';

  @override
  String get tutorialTrainingDescription =>
      '1 dakikalık bir oyun başlatın. 4 seçenek arasından pozitif görselleri veya iyi alışkanlıkları seçin.';

  @override
  String get tutorialScoreProgress => 'Skor Gelişimi';

  @override
  String get tutorialScoreDescription =>
      'Kazandığınız skorlarla ilgili ayrıntılı bilgileri görüntüleyin.';

  @override
  String get tutorialSettingsAndData => 'Ayarlar ve Veri Yönetimi';

  @override
  String get tutorialSettingsDescription =>
      'Hedef değerlerini değiştirin, uygulama bilgilerini görüntüleyin ve verileri sıfırlayın.';

  @override
  String get appIntroAttentionBiasTitle => 'Dikkat Yanlılığı Hakkında';

  @override
  String get appIntroAttentionBiasContent =>
      'Kaygı yüksek olduğunda, farkında olmadan yalnızca olumsuz şeylere odaklanma eğilimi gösteririz.';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMint\'in Rolü';

  @override
  String get appIntroFocusMintRoleContent =>
      'Dikkatinizi olumlu görsellere yöneltmeyi çalışmak için kısa bir oyun.';

  @override
  String get appIntroScientificEvidenceTitle => 'Bu alıştırma hakkında';

  @override
  String get appIntroScientificEvidenceContent =>
      'Olumlu görselleri bulmayı çalışın. FocusMint bir kişisel bakım aracıdır, tıbbi tedavi değildir. Sonuçlar kişiden kişiye değişebilir.';

  @override
  String get appIntroExpectedEffectsTitle => 'Neleri çalışabilirsiniz?';

  @override
  String get appIntroEffect1 => 'Olumlu görseller aramak';

  @override
  String get appIntroEffect2 => 'Çevrenizdeki gülümsemeleri fark etmek';

  @override
  String get appIntroEffect3 => 'Kısa bir günlük alışkanlık oluşturmak';

  @override
  String get appIntroHowToUse => 'Nasıl Kullanılır';

  @override
  String get pointsEarned => 'Puan Kazanıldı!';

  @override
  String get yourScore => 'Skorunuz';

  @override
  String get totalPlayTime => 'Toplam Oyun Süresi';

  @override
  String get imageManagement => 'Görsel Yönetimi';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Gizlenen görseller: $count/$max';
  }

  @override
  String get unsavedChanges => 'Kaydedilmemiş değişiklikleriniz var';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Görsel görüntüleme ayarlarında $count kaydedilmemiş değişiklik var.';
  }

  @override
  String get unsavedChangesWarning =>
      'Bu ekranı şimdi kapatırsanız değişiklikler kaybolur.';

  @override
  String get discardChanges => 'Değişiklikleri Yoksay';

  @override
  String get saveAndExit => 'Kaydet ve Çık';

  @override
  String settingsSaved(Object count) {
    return '$count ayar kaydedildi';
  }

  @override
  String get saveError => 'Ayarlar kaydedilirken bir hata oluştu';

  @override
  String get imageSettingsUpdated => 'Görsel ayarları güncellendi';

  @override
  String get allImages => 'Tümü';

  @override
  String get positiveImages => 'Pozitif';

  @override
  String get negativeImages => 'Negatif';

  @override
  String get smileImages => 'Gülümseme';

  @override
  String get vegetableImages => 'Besleyici yiyecekler';

  @override
  String get healthImages => 'Hareket ve sosyal bağlar';

  @override
  String get sadImages => 'Öfke, üzüntü ve kaygı';

  @override
  String get badFoodImages => 'Fast food ve tatlılar';

  @override
  String get badImages => 'Sağlıksız alışkanlıklar';

  @override
  String get imageManagementHint =>
      'Görselin görünürlüğünü değiştirmek için dokunun. En fazla 15 görseli gizleyebilirsiniz.';

  @override
  String get unsaved => 'Kaydedilmedi';

  @override
  String get save => 'Kaydet';

  @override
  String get hiddenImages => 'Gizli';

  @override
  String get noHiddenImages => 'Gizlenen görsel yok';

  @override
  String get settingsLoadFailed => 'Ayarlar yüklenemedi';

  @override
  String imagesAdded(int count) {
    return '$count görsel eklendi';
  }

  @override
  String get imageAddFailed => 'Görseller eklenemedi';

  @override
  String get imageSelectionFailed => 'Görseller seçilemedi';

  @override
  String get settingsChangeFailed => 'Ayarlar değiştirilemedi';

  @override
  String groupTitle(String name) {
    return 'Grup: $name';
  }

  @override
  String get displayToggle => 'Görünürlük Değiştirme';

  @override
  String imageCount(int count) {
    return '$count görsel';
  }

  @override
  String get noticeTitle => 'Önemli Notlar';

  @override
  String get notice1 => 'Özel görsel özelliği eklendi!';

  @override
  String get notice2 =>
      'Ayarlar ekranından kendi görsellerinizi ekleyebilirsiniz';

  @override
  String get notice3 => 'Ayrıntılar için lütfen ayarlar ekranını kontrol edin';

  @override
  String get customImageTitle => 'Özel Görseller';

  @override
  String get customImageSubtitle => 'Kendi görsellerinizi ekleyin ve yönetin';

  @override
  String get addCustomImages => 'Özel Görsel Ekle';

  @override
  String get selectImages => 'Görsel Seç';

  @override
  String get unknownImage => 'Bilinmeyen Görsel';

  @override
  String get customImageSettings => 'Özel Görsel Ayarları';

  @override
  String get useCustomImages => 'Özel Görselleri Kullan';

  @override
  String get useCustomImagesDescription =>
      'Alıştırmada kendi görsellerinizi kullanın. Uygulamanın görsellerini de eklemek için aşağıdaki karıştırma seçeneğini açın.';

  @override
  String get groupSettings => 'Grup Ayarları';

  @override
  String get minOneGroupRequired => 'En az bir grup etkin olmalıdır';

  @override
  String get settingsLoadFailedMessage => 'Ayarlar yüklenemedi';

  @override
  String get customImageNotice1 =>
      'Gruplar etkinleştirildiğinde görseller her grup için rastgele görüntülenir.';

  @override
  String get customImageNotice2 =>
      'Kullanıcıların yüklediği ve ayarladığı görseller geliştiricilerle veya üçüncü taraflarla paylaşılmaz; yalnızca cihazdaki uygulama alanında saklanır.';

  @override
  String get customImageNotice3 => 'Bu sayede çevrimdışı kullanım mümkündür.';

  @override
  String get customImageNotice4 =>
      'Çok sayıda görsel eklemek depolama alanı kullanır. Sorun yaşarsanız ayarlardan özel görselleri kapatın veya kullanılmayanları kaldırın.';

  @override
  String get customImageNotice5 =>
      'Uygulamayı sildiğinizde ayarlanan görseller de silinir.';

  @override
  String get customImageRequirementNotMet =>
      'Özel görselleri kullanmak için etkin gruplarda en az 1 iyi görsel ve 3 iyi olmayan görsel gerekir.';

  @override
  String get customImageRequirement =>
      'Özel görselleri kullanmak için etkin gruplarda en az 1 iyi görsel ve 3 iyi olmayan görsel gerekir.';

  @override
  String get sunnyWeather => 'İyi';

  @override
  String get rainyWeather => 'İyi değil';

  @override
  String get addImages => 'Görsel Ekle';

  @override
  String get imageDeleted => 'Görsel silindi';

  @override
  String get imageDeleteFailed => 'Görsel silinemedi';

  @override
  String get deleteImageTitle => 'Görseli Sil';

  @override
  String get deleteImageMessage =>
      'Bu görseli silmek istiyor musunuz? Bu işlem geri alınamaz.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Grup $groupId $weather Görselleri';
  }

  @override
  String registeredCount(int count) {
    return 'Kayıtlı: $count görsel';
  }

  @override
  String get noImagesRegistered => 'Kayıtlı görsel yok';

  @override
  String get imagePreview => 'Görsel Önizleme';

  @override
  String get close => 'Kapat';

  @override
  String get contactEmailSubject => 'FocusMint - İletişim';

  @override
  String get contactEmailBody => 'Lütfen görüş ve sorularınızı paylaşın.';

  @override
  String get mixWithBuiltInImages => 'Uygulamanın görselleriyle karıştır';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Kendi görsellerinizi ve uygulamanın görsellerini birlikte kullanın';

  @override
  String get supportIntro =>
      'Geliştiriciyle anonim olarak görüşün. Soru ve önerilerinizi gönderebilirsiniz. Günde 3 mesaj gönderebilirsiniz. Geliştiricinin her yanıtı kullanılabilir mesaj hakkını 3’e çıkarır.';

  @override
  String get supportReceived =>
      'Mesaj alındı. Genellikle 2–3 gün içinde yanıt veririz.';

  @override
  String get supportComposer => 'Bir mesaj yazın';

  @override
  String get supportSend => 'Gönder';

  @override
  String get supportRetry => 'Yeniden dene';

  @override
  String get supportSent => 'Gönderildi';

  @override
  String get supportUnsent => 'Gönderilmedi · bu cihazda kayıtlı';

  @override
  String get supportAttach => 'Görsel ekle';

  @override
  String get supportRemoveImage => 'Görseli kaldır';

  @override
  String get supportImage => 'Ek';

  @override
  String get supportClear => 'Geçmişi sil';

  @override
  String get supportClearConfirm =>
      'Bu görüşme silinsin mi? Gönderilmemiş taslaklar ve sunucudaki geçmiş de silinir. Bu işlem mesaj hakkınızı yenilemez.';

  @override
  String get supportQuota =>
      'Bugünkü 3 mesaj hakkınızı kullandınız. Yarın veya geliştiricinin yanıtından sonra yeniden gönderebilirsiniz.';

  @override
  String get supportConnectionError =>
      'Bağlanılamadı. Kayıtlı taslaklar gönderilmedi.';

  @override
  String get supportSendError =>
      'Gönderilemedi. Mesajınız bu cihazda kayıtlı. Lütfen yeniden deneyin.';

  @override
  String get supportStorageError => 'Kaydedilemedi. Lütfen yeniden deneyin.';

  @override
  String get supportClearError =>
      'Geçmiş silinemedi. Bağlantınızı kontrol edip yeniden deneyin.';

  @override
  String get supportImageError =>
      'Görsel yüklenemedi. 30 MB’tan küçük bir görsel seçin.';

  @override
  String supportRemaining(int count) {
    return 'Bugün kalan mesaj hakkı: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Okunmamış yanıtlar: $count';
  }

  @override
  String get supportGuide => 'Bilgi';

  @override
  String get supportDeveloper => 'Geliştirici';

  @override
  String get supportPrivacy => 'Destek verileri hakkında';

  @override
  String get breathingTitle => 'Sakin bir nefes alın';

  @override
  String get breathingHint =>
      'Akciğerlerin yumuşak hareketini\nrahat ettiğiniz bir hızda izleyin.';

  @override
  String get breathingIn => 'Yavaşça nefes alın';

  @override
  String get breathingOut => 'Yavaşça nefes verin';

  @override
  String get breathingProgress => 'Nefes alıştırmasının ilerlemesi';

  @override
  String get breathingResultHint =>
      'Sonuçlarınız otomatik olarak gösterilecek.';

  @override
  String get breathingSkip => 'Sonuçlara geç';
}
