// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Mata Semasa';

  @override
  String goalLabel(int goal) {
    return 'Sasaran: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Baki: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Sasaran Tercapai!';

  @override
  String get startButtonText => 'MULA';

  @override
  String get stressReductionMessage =>
      'Berlatih memberi perhatian kepada perkara positif.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Masa berbaki: $minutes min $seconds s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Masa berbaki: $seconds s';
  }

  @override
  String scoreLabel(String score) {
    return 'Skor: $score Mata';
  }

  @override
  String get imagePreparationMessage => 'Menyediakan imej...';

  @override
  String get noStimuliAvailable => 'Tiada rangsangan tersedia';

  @override
  String get invalidGridSize => 'Saiz grid tidak sah';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Memulakan...';

  @override
  String get excellentPerformance => 'Prestasi cemerlang!';

  @override
  String get greatJob => 'Syabas!';

  @override
  String get goodPerformance => 'Prestasi baik';

  @override
  String get keepPracticingFeedback => 'Teruskan berlatih';

  @override
  String get takeYourTimeFeedback => 'Jangan tergesa-gesa';

  @override
  String get happy => 'Gembira';

  @override
  String get angry => 'Marah';

  @override
  String get fear => 'Takut';

  @override
  String get sad => 'Sedih';

  @override
  String get historyPageTitle => 'Sejarah Latihan';

  @override
  String get dataLoading => 'Memuatkan data...';

  @override
  String get pointsHistory => 'Sejarah Mata';

  @override
  String get weekly => 'Mingguan';

  @override
  String get monthly => 'Bulanan';

  @override
  String get noDataAvailable => 'Tiada data tersedia';

  @override
  String get goalAchievementRate => 'Kadar Pencapaian Sasaran';

  @override
  String get scoreStatistics => 'Statistik Skor';

  @override
  String get bestScore => 'Skor Terbaik';

  @override
  String get totalScore => 'Jumlah Skor';

  @override
  String get trainingTime => 'Masa Latihan';

  @override
  String get totalTrainingTime => 'Jumlah Masa Latihan';

  @override
  String get detailedStatistics => 'Statistik Terperinci';

  @override
  String get averageScorePerMinute => 'Purata skor seminit';

  @override
  String get pointsToGoal => 'Mata ke sasaran';

  @override
  String get goalSetting => 'Tetapan sasaran';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'j';

  @override
  String get pointsUnit => 'mata';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Ahd';

  @override
  String get mondayShort => 'Isn';

  @override
  String get tuesdayShort => 'Sel';

  @override
  String get wednesdayShort => 'Rab';

  @override
  String get thursdayShort => 'Kha';

  @override
  String get fridayShort => 'Jum';

  @override
  String get saturdayShort => 'Sab';

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get goalPointsSetting => 'Tetapan Mata Sasaran';

  @override
  String currentGoalPoints(int points) {
    return 'Sasaran semasa: $points mata';
  }

  @override
  String get newGoalPointsLabel => 'Mata sasaran baharu';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'mata';

  @override
  String get saveGoalButton => 'Simpan Sasaran';

  @override
  String goalSetTo(int points) {
    return 'Sasaran ditetapkan kepada $points mata';
  }

  @override
  String get enterGoalPoints => 'Sila masukkan mata sasaran';

  @override
  String get enterValidNumber =>
      'Sila masukkan nombor yang sah (1 hingga 99999999)';

  @override
  String get saveFailed => 'Gagal menyimpan sesetengah tetapan';

  @override
  String get emailOpenFailed => 'Tidak dapat membuka aplikasi e-mel';

  @override
  String get pageOpenFailed => 'Tidak dapat membuka halaman';

  @override
  String get appInfoSupport => 'Maklumat Aplikasi & Sokongan';

  @override
  String get contactUs => 'Hubungi Kami';

  @override
  String get contactUsSubtitle => 'Kongsikan maklum balas dan pertanyaan anda';

  @override
  String get termsOfService => 'Terma Perkhidmatan';

  @override
  String get termsSubtitle => 'Semak terma perkhidmatan aplikasi';

  @override
  String get privacyPolicy => 'Dasar Privasi';

  @override
  String get privacySubtitle => 'Mengenai pengendalian maklumat privasi';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Ketahui cara menggunakan aplikasi';

  @override
  String get dataManagement => 'Pengurusan Data';

  @override
  String get deleteHistory => 'Padam Sejarah';

  @override
  String get deleteHistorySubtitle =>
      'Padam sejarah latihan sahaja (mata sasaran dikekalkan)';

  @override
  String get deleteHistoryAndGoal => 'Padam Sejarah & Sasaran';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Padam semua sejarah dan mata sasaran';

  @override
  String get deleteHistoryConfirmTitle => 'Padam Sejarah';

  @override
  String get deleteHistoryConfirmMessage =>
      'Adakah anda pasti mahu memadamkan semua sejarah latihan?\n\n*Mata sasaran akan dikekalkan';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Padam Sejarah & Sasaran';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Adakah anda pasti mahu memadamkan semua sejarah dan mata sasaran?\n\n*Tindakan ini tidak boleh dibuat asal';

  @override
  String get cancel => 'Batal';

  @override
  String get delete => 'Padam';

  @override
  String get historyDeleted => 'Sejarah telah dipadamkan';

  @override
  String get historyAndGoalDeleted => 'Sejarah dan sasaran telah dipadamkan';

  @override
  String get historyDeleteFailed => 'Gagal memadamkan sejarah';

  @override
  String get historyAndGoalDeleteFailed =>
      'Gagal memadamkan sejarah dan sasaran';

  @override
  String get tutorialDisplayFailed => 'Gagal memaparkan tutorial';

  @override
  String get tips => 'Petua';

  @override
  String get tipsContent =>
      '• Sasaran anda dipaparkan pada carta di skrin utama\n• Mulakan dengan sasaran kecil dan tingkatkannya mengikut rentak anda\n• Setiap pilihan yang betul memberikan sehingga 6 mata';

  @override
  String get backToHome => 'Kembali ke Skrin Utama';

  @override
  String get tutorialSkip => 'Langkau';

  @override
  String get tutorialGoalAndPoints => 'Sasaran dan Mata Semasa';

  @override
  String get tutorialGoalDescription =>
      'Bulatan luar menunjukkan sasaran anda, bulatan dalam menunjukkan jumlah mata. Bulatan akan terisi apabila anda menghampiri sasaran.';

  @override
  String get tutorialOneMinuteTraining => 'Latihan 1 Minit';

  @override
  String get tutorialTrainingDescription =>
      'Mulakan permainan 1 minit. Pilih imej positif atau tabiat baik daripada 4 pilihan.';

  @override
  String get tutorialScoreProgress => 'Perkembangan Skor';

  @override
  String get tutorialScoreDescription =>
      'Lihat maklumat terperinci tentang skor yang diperoleh.';

  @override
  String get tutorialSettingsAndData => 'Tetapan dan Pengurusan Data';

  @override
  String get tutorialSettingsDescription =>
      'Ubah nilai sasaran, lihat maklumat aplikasi dan tetapkan semula data.';

  @override
  String get appIntroAttentionBiasTitle => 'Mengenai Bias Perhatian';

  @override
  String get appIntroAttentionBiasContent =>
      'Apabila kebimbangan tinggi, kita cenderung menumpukan perhatian hanya pada perkara negatif tanpa disedari.';

  @override
  String get appIntroFocusMintRoleTitle => 'Peranan FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Permainan ringkas untuk berlatih mengarahkan perhatian kepada imej positif.';

  @override
  String get appIntroScientificEvidenceTitle => 'Tentang latihan ini';

  @override
  String get appIntroScientificEvidenceContent =>
      'Berlatih mencari imej positif. FocusMint ialah alat penjagaan diri, bukan rawatan perubatan. Hasil berbeza mengikut individu.';

  @override
  String get appIntroExpectedEffectsTitle => 'Perkara yang boleh anda latih';

  @override
  String get appIntroEffect1 => 'Mencari imej positif';

  @override
  String get appIntroEffect2 => 'Menyedari senyuman di sekeliling anda';

  @override
  String get appIntroEffect3 => 'Membina rutin harian yang ringkas';

  @override
  String get appIntroHowToUse => 'Lihat Cara Penggunaan';

  @override
  String get pointsEarned => 'Mata Diperoleh!';

  @override
  String get yourScore => 'Skor Anda';

  @override
  String get totalPlayTime => 'Jumlah Masa Bermain';

  @override
  String get imageManagement => 'Pengurusan Imej';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Imej tersembunyi: $count/$max';
  }

  @override
  String get unsavedChanges => 'Anda mempunyai perubahan yang belum disimpan';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Anda mempunyai $count perubahan tetapan paparan imej yang belum disimpan.';
  }

  @override
  String get unsavedChangesWarning =>
      'Perubahan akan hilang jika anda menutup skrin ini sekarang.';

  @override
  String get discardChanges => 'Buang Perubahan';

  @override
  String get saveAndExit => 'Simpan dan Keluar';

  @override
  String settingsSaved(Object count) {
    return '$count tetapan disimpan';
  }

  @override
  String get saveError => 'Ralat berlaku semasa menyimpan tetapan';

  @override
  String get imageSettingsUpdated => 'Tetapan imej telah dikemas kini';

  @override
  String get allImages => 'Semua';

  @override
  String get positiveImages => 'Positif';

  @override
  String get negativeImages => 'Negatif';

  @override
  String get smileImages => 'Senyuman';

  @override
  String get vegetableImages => 'Makanan berkhasiat';

  @override
  String get healthImages => 'Pergerakan dan pergaulan';

  @override
  String get sadImages => 'Marah, sedih dan bimbang';

  @override
  String get badFoodImages => 'Makanan segera dan manisan';

  @override
  String get badImages => 'Tabiat tidak sihat';

  @override
  String get imageManagementHint =>
      'Ketik untuk menogol keterlihatan imej. Anda boleh menyembunyikan sehingga 15 imej.';

  @override
  String get unsaved => 'Belum disimpan';

  @override
  String get save => 'Simpan';

  @override
  String get hiddenImages => 'Tersembunyi';

  @override
  String get noHiddenImages => 'Tiada imej tersembunyi';

  @override
  String get settingsLoadFailed => 'Gagal memuatkan tetapan';

  @override
  String imagesAdded(int count) {
    return '$count imej ditambah';
  }

  @override
  String get imageAddFailed => 'Gagal menambah imej';

  @override
  String get imageSelectionFailed => 'Gagal memilih imej';

  @override
  String get settingsChangeFailed => 'Gagal menukar tetapan';

  @override
  String groupTitle(String name) {
    return 'Kumpulan: $name';
  }

  @override
  String get displayToggle => 'Togol Paparan';

  @override
  String imageCount(int count) {
    return '$count imej';
  }

  @override
  String get noticeTitle => 'Nota Penting';

  @override
  String get notice1 => 'Ciri imej tersuai telah ditambah!';

  @override
  String get notice2 =>
      'Anda boleh menambah imej sendiri daripada skrin tetapan';

  @override
  String get notice3 => 'Sila semak skrin tetapan untuk butiran lanjut';

  @override
  String get customImageTitle => 'Imej Tersuai';

  @override
  String get customImageSubtitle => 'Tambah dan urus imej anda sendiri';

  @override
  String get addCustomImages => 'Tambah Imej Tersuai';

  @override
  String get selectImages => 'Pilih Imej';

  @override
  String get unknownImage => 'Imej Tidak Dikenali';

  @override
  String get customImageSettings => 'Tetapan Imej Tersuai';

  @override
  String get useCustomImages => 'Guna Imej Tersuai';

  @override
  String get useCustomImagesDescription =>
      'Gunakan imej anda sendiri untuk latihan. Hidupkan pilihan campuran di bawah untuk menyertakan imej terbina dalam.';

  @override
  String get groupSettings => 'Tetapan Kumpulan';

  @override
  String get minOneGroupRequired =>
      'Sekurang-kurangnya satu kumpulan mesti diaktifkan';

  @override
  String get settingsLoadFailedMessage => 'Gagal memuatkan tetapan';

  @override
  String get customImageNotice1 =>
      'Apabila kumpulan diaktifkan, imej dipaparkan secara rawak untuk setiap kumpulan.';

  @override
  String get customImageNotice2 =>
      'Imej yang dimuat naik dan ditetapkan oleh pengguna tidak dikongsi dengan pembangun atau pihak ketiga dan hanya disimpan dalam ruang aplikasi pada peranti.';

  @override
  String get customImageNotice3 =>
      'Oleh itu, aplikasi boleh digunakan secara luar talian.';

  @override
  String get customImageNotice4 =>
      'Menambah banyak imej menggunakan ruang storan. Jika timbul masalah, matikan imej peribadi atau padam imej yang tidak digunakan dalam Tetapan.';

  @override
  String get customImageNotice5 =>
      'Apabila anda memadamkan aplikasi, imej yang ditetapkan akan turut dipadamkan.';

  @override
  String get customImageRequirementNotMet =>
      'Untuk menggunakan imej tersuai, anda memerlukan sekurang-kurangnya 1 imej baik dan 3 imej tidak baik dalam kumpulan yang diaktifkan.';

  @override
  String get customImageRequirement =>
      'Untuk menggunakan imej tersuai, anda memerlukan sekurang-kurangnya 1 imej baik dan 3 imej tidak baik dalam kumpulan yang diaktifkan.';

  @override
  String get sunnyWeather => 'Baik';

  @override
  String get rainyWeather => 'Tidak baik';

  @override
  String get addImages => 'Tambah Imej';

  @override
  String get imageDeleted => 'Imej telah dipadamkan';

  @override
  String get imageDeleteFailed => 'Gagal memadamkan imej';

  @override
  String get deleteImageTitle => 'Padam Imej';

  @override
  String get deleteImageMessage =>
      'Padam imej ini? Tindakan ini tidak boleh dibuat asal.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Imej $weather Kumpulan $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Didaftarkan: $count imej';
  }

  @override
  String get noImagesRegistered => 'Tiada imej didaftarkan';

  @override
  String get imagePreview => 'Pratonton Imej';

  @override
  String get close => 'Tutup';

  @override
  String get contactEmailSubject => 'FocusMint - Pertanyaan';

  @override
  String get contactEmailBody =>
      'Sila kongsikan maklum balas dan pertanyaan anda.';

  @override
  String get mixWithBuiltInImages => 'Campur dengan imej terbina dalam';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Gunakan imej anda dan imej terbina dalam bersama-sama';

  @override
  String get supportIntro =>
      'Berbual dengan pembangun tanpa mendedahkan identiti. Soalan dan cadangan dialu-alukan. Anda boleh menghantar 3 mesej sehari. Setiap balasan pembangun memulihkan kuota mesej anda kepada 3.';

  @override
  String get supportReceived =>
      'Mesej diterima. Kami biasanya membalas dalam masa 2–3 hari.';

  @override
  String get supportComposer => 'Tulis mesej';

  @override
  String get supportSend => 'Hantar';

  @override
  String get supportRetry => 'Cuba lagi';

  @override
  String get supportSent => 'Dihantar';

  @override
  String get supportUnsent => 'Belum dihantar · disimpan pada peranti ini';

  @override
  String get supportAttach => 'Lampirkan imej';

  @override
  String get supportRemoveImage => 'Alih keluar imej';

  @override
  String get supportImage => 'Lampiran';

  @override
  String get supportClear => 'Padam sejarah';

  @override
  String get supportClearConfirm =>
      'Padam perbualan ini? Draf yang belum dihantar dan sejarah pada pelayan juga akan dipadam. Ini tidak menetapkan semula kuota mesej anda.';

  @override
  String get supportQuota =>
      'Anda telah menggunakan 3 mesej hari ini. Hantar lagi esok atau selepas pembangun membalas.';

  @override
  String get supportConnectionError =>
      'Tidak dapat menyambung. Draf yang disimpan belum dihantar.';

  @override
  String get supportSendError =>
      'Tidak dapat menghantar. Mesej anda disimpan pada peranti ini. Sila cuba lagi.';

  @override
  String get supportStorageError => 'Tidak dapat menyimpan. Sila cuba lagi.';

  @override
  String get supportClearError =>
      'Tidak dapat memadam sejarah. Semak sambungan dan cuba lagi.';

  @override
  String get supportImageError =>
      'Tidak dapat memuatkan imej. Pilih imej yang berukuran kurang daripada 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Baki mesej hari ini: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Balasan belum dibaca: $count';
  }

  @override
  String get supportGuide => 'Maklumat';

  @override
  String get supportDeveloper => 'Pembangun';

  @override
  String get supportPrivacy => 'Tentang data pertanyaan';

  @override
  String get breathingTitle => 'Luangkan masa untuk bernafas';

  @override
  String get breathingHint =>
      'Ikuti gerakan lembut paru-paru\npada rentak yang selesa.';

  @override
  String get breathingIn => 'Tarik nafas perlahan-lahan';

  @override
  String get breathingOut => 'Hembus nafas perlahan-lahan';

  @override
  String get breathingProgress => 'Kemajuan latihan pernafasan';

  @override
  String get breathingResultHint =>
      'Keputusan anda akan dipaparkan secara automatik.';

  @override
  String get breathingSkip => 'Terus ke keputusan';
}
