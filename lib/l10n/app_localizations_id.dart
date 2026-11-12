// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Poin Saat Ini';

  @override
  String goalLabel(int goal) {
    return 'Target: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Sisa: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Target Tercapai!';

  @override
  String get startButtonText => 'MULAI';

  @override
  String get stressReductionMessage => 'Berlatihlah memperhatikan hal positif.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Sisa waktu: $minutes mnt $seconds dtk';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Sisa waktu: $seconds dtk';
  }

  @override
  String scoreLabel(String score) {
    return 'Skor: $score Poin';
  }

  @override
  String get imagePreparationMessage => 'Menyiapkan gambar...';

  @override
  String get noStimuliAvailable => 'Tidak ada stimulus yang tersedia';

  @override
  String get invalidGridSize => 'Ukuran kisi tidak valid';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Memulai...';

  @override
  String get excellentPerformance => 'Performa luar biasa!';

  @override
  String get greatJob => 'Kerja bagus!';

  @override
  String get goodPerformance => 'Performa baik';

  @override
  String get keepPracticingFeedback => 'Terus berlatih';

  @override
  String get takeYourTimeFeedback => 'Tidak perlu terburu-buru';

  @override
  String get happy => 'Senang';

  @override
  String get angry => 'Marah';

  @override
  String get fear => 'Takut';

  @override
  String get sad => 'Sedih';

  @override
  String get historyPageTitle => 'Riwayat Latihan';

  @override
  String get dataLoading => 'Memuat data...';

  @override
  String get pointsHistory => 'Riwayat Poin';

  @override
  String get weekly => 'Mingguan';

  @override
  String get monthly => 'Bulanan';

  @override
  String get noDataAvailable => 'Tidak ada data';

  @override
  String get goalAchievementRate => 'Tingkat Pencapaian Target';

  @override
  String get scoreStatistics => 'Statistik Skor';

  @override
  String get bestScore => 'Skor Terbaik';

  @override
  String get totalScore => 'Total Skor';

  @override
  String get trainingTime => 'Waktu Latihan';

  @override
  String get totalTrainingTime => 'Total Waktu Latihan';

  @override
  String get detailedStatistics => 'Statistik Terperinci';

  @override
  String get averageScorePerMinute => 'Rata-rata skor per menit';

  @override
  String get pointsToGoal => 'Poin menuju target';

  @override
  String get goalSetting => 'Pengaturan target';

  @override
  String get secondsUnit => 'dtk';

  @override
  String get minutesUnit => 'mnt';

  @override
  String get hoursUnit => 'jam';

  @override
  String get pointsUnit => 'poin';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Min';

  @override
  String get mondayShort => 'Sen';

  @override
  String get tuesdayShort => 'Sel';

  @override
  String get wednesdayShort => 'Rab';

  @override
  String get thursdayShort => 'Kam';

  @override
  String get fridayShort => 'Jum';

  @override
  String get saturdayShort => 'Sab';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get goalPointsSetting => 'Pengaturan Poin Target';

  @override
  String currentGoalPoints(int points) {
    return 'Target saat ini: $points poin';
  }

  @override
  String get newGoalPointsLabel => 'Poin target baru';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'poin';

  @override
  String get saveGoalButton => 'Simpan Target';

  @override
  String goalSetTo(int points) {
    return 'Target diatur ke $points poin';
  }

  @override
  String get enterGoalPoints => 'Silakan masukkan poin target';

  @override
  String get enterValidNumber =>
      'Masukkan angka yang valid (1 hingga 99999999)';

  @override
  String get saveFailed => 'Gagal menyimpan beberapa pengaturan';

  @override
  String get emailOpenFailed => 'Tidak dapat membuka aplikasi email';

  @override
  String get pageOpenFailed => 'Tidak dapat membuka halaman';

  @override
  String get appInfoSupport => 'Info Aplikasi & Dukungan';

  @override
  String get contactUs => 'Hubungi Kami';

  @override
  String get contactUsSubtitle => 'Sampaikan masukan dan pertanyaan Anda';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get termsSubtitle => 'Tinjau ketentuan layanan aplikasi';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get privacySubtitle => 'Tentang penanganan informasi privasi';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Pelajari cara menggunakan aplikasi';

  @override
  String get dataManagement => 'Manajemen Data';

  @override
  String get deleteHistory => 'Hapus Riwayat';

  @override
  String get deleteHistorySubtitle =>
      'Hanya menghapus riwayat latihan (poin target tetap tersimpan)';

  @override
  String get deleteHistoryAndGoal => 'Hapus Riwayat & Target';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Menghapus semua riwayat dan poin target';

  @override
  String get deleteHistoryConfirmTitle => 'Hapus Riwayat';

  @override
  String get deleteHistoryConfirmMessage =>
      'Yakin ingin menghapus semua riwayat latihan?\n\n*Poin target akan tetap tersimpan';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Hapus Riwayat & Target';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Yakin ingin menghapus semua riwayat dan poin target?\n\n*Tindakan ini tidak dapat dibatalkan';

  @override
  String get cancel => 'Batal';

  @override
  String get delete => 'Hapus';

  @override
  String get historyDeleted => 'Riwayat telah dihapus';

  @override
  String get historyAndGoalDeleted => 'Riwayat dan target telah dihapus';

  @override
  String get historyDeleteFailed => 'Gagal menghapus riwayat';

  @override
  String get historyAndGoalDeleteFailed => 'Gagal menghapus riwayat dan target';

  @override
  String get tutorialDisplayFailed => 'Gagal menampilkan tutorial';

  @override
  String get tips => 'Kiat';

  @override
  String get tipsContent =>
      '• Targetmu muncul pada grafik di layar utama\n• Mulai dari target kecil dan tingkatkan sesuai kemampuanmu\n• Setiap pilihan benar memberi hingga 6 poin';

  @override
  String get backToHome => 'Kembali ke Beranda';

  @override
  String get tutorialSkip => 'Lewati';

  @override
  String get tutorialGoalAndPoints => 'Target dan Poin Saat Ini';

  @override
  String get tutorialGoalDescription =>
      'Lingkaran luar menunjukkan target Anda, lingkaran dalam menunjukkan total poin. Lingkaran akan terisi saat Anda mendekati target.';

  @override
  String get tutorialOneMinuteTraining => 'Latihan 1 Menit';

  @override
  String get tutorialTrainingDescription =>
      'Mulai permainan 1 menit. Pilih gambar positif atau kebiasaan baik dari 4 pilihan.';

  @override
  String get tutorialScoreProgress => 'Perkembangan Skor';

  @override
  String get tutorialScoreDescription =>
      'Lihat informasi terperinci tentang skor yang Anda peroleh.';

  @override
  String get tutorialSettingsAndData => 'Pengaturan dan Manajemen Data';

  @override
  String get tutorialSettingsDescription =>
      'Ubah nilai target, lihat informasi aplikasi, dan atur ulang data.';

  @override
  String get appIntroAttentionBiasTitle => 'Tentang Bias Perhatian';

  @override
  String get appIntroAttentionBiasContent =>
      'Saat kecemasan tinggi, kita cenderung tanpa sadar hanya berfokus pada hal-hal negatif.';

  @override
  String get appIntroFocusMintRoleTitle => 'Peran FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Permainan singkat untuk berlatih mengarahkan perhatian pada gambar positif.';

  @override
  String get appIntroScientificEvidenceTitle => 'Tentang latihan ini';

  @override
  String get appIntroScientificEvidenceContent =>
      'Berlatih menemukan gambar positif. FocusMint adalah sarana perawatan diri, bukan pengobatan medis. Hasil dapat berbeda pada setiap orang.';

  @override
  String get appIntroExpectedEffectsTitle => 'Yang dapat kamu latih';

  @override
  String get appIntroEffect1 => 'Mencari gambar positif';

  @override
  String get appIntroEffect2 => 'Memperhatikan senyum di sekitarmu';

  @override
  String get appIntroEffect3 => 'Membangun rutinitas harian yang singkat';

  @override
  String get appIntroHowToUse => 'Lihat Cara Penggunaan';

  @override
  String get pointsEarned => 'Poin Diperoleh!';

  @override
  String get yourScore => 'Skor Anda';

  @override
  String get totalPlayTime => 'Total Waktu Bermain';

  @override
  String get imageManagement => 'Manajemen Gambar';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Gambar tersembunyi: $count/$max';
  }

  @override
  String get unsavedChanges => 'Ada perubahan yang belum disimpan';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Ada $count perubahan pengaturan tampilan gambar yang belum disimpan.';
  }

  @override
  String get unsavedChangesWarning =>
      'Perubahan akan hilang jika Anda menutup layar ini sekarang.';

  @override
  String get discardChanges => 'Buang Perubahan';

  @override
  String get saveAndExit => 'Simpan dan Keluar';

  @override
  String settingsSaved(Object count) {
    return '$count pengaturan disimpan';
  }

  @override
  String get saveError => 'Terjadi kesalahan saat menyimpan pengaturan';

  @override
  String get imageSettingsUpdated => 'Pengaturan gambar telah diperbarui';

  @override
  String get allImages => 'Semua';

  @override
  String get positiveImages => 'Positif';

  @override
  String get negativeImages => 'Negatif';

  @override
  String get smileImages => 'Senyum';

  @override
  String get vegetableImages => 'Makanan bergizi';

  @override
  String get healthImages => 'Gerak dan interaksi';

  @override
  String get sadImages => 'Marah, sedih, dan khawatir';

  @override
  String get badFoodImages => 'Makanan cepat saji dan manisan';

  @override
  String get badImages => 'Kebiasaan tidak sehat';

  @override
  String get imageManagementHint =>
      'Ketuk untuk mengubah visibilitas gambar. Anda dapat menyembunyikan hingga 15 gambar.';

  @override
  String get unsaved => 'Belum disimpan';

  @override
  String get save => 'Simpan';

  @override
  String get hiddenImages => 'Tersembunyi';

  @override
  String get noHiddenImages => 'Tidak ada gambar tersembunyi';

  @override
  String get settingsLoadFailed => 'Gagal memuat pengaturan';

  @override
  String imagesAdded(int count) {
    return '$count gambar ditambahkan';
  }

  @override
  String get imageAddFailed => 'Gagal menambahkan gambar';

  @override
  String get imageSelectionFailed => 'Gagal memilih gambar';

  @override
  String get settingsChangeFailed => 'Gagal mengubah pengaturan';

  @override
  String groupTitle(String name) {
    return 'Grup: $name';
  }

  @override
  String get displayToggle => 'Alihkan Tampilan';

  @override
  String imageCount(int count) {
    return '$count gambar';
  }

  @override
  String get noticeTitle => 'Catatan Penting';

  @override
  String get notice1 => 'Fitur gambar kustom telah ditambahkan!';

  @override
  String get notice2 =>
      'Anda dapat menambahkan gambar sendiri dari layar pengaturan';

  @override
  String get notice3 => 'Silakan periksa layar pengaturan untuk detailnya';

  @override
  String get customImageTitle => 'Gambar Kustom';

  @override
  String get customImageSubtitle => 'Tambahkan dan kelola gambar Anda sendiri';

  @override
  String get addCustomImages => 'Tambah Gambar Kustom';

  @override
  String get selectImages => 'Pilih Gambar';

  @override
  String get unknownImage => 'Gambar Tidak Dikenal';

  @override
  String get customImageSettings => 'Pengaturan Gambar Kustom';

  @override
  String get useCustomImages => 'Gunakan Gambar Kustom';

  @override
  String get useCustomImagesDescription =>
      'Gunakan gambarmu sendiri untuk berlatih. Aktifkan pencampuran di bawah untuk menyertakan gambar bawaan.';

  @override
  String get groupSettings => 'Pengaturan Grup';

  @override
  String get minOneGroupRequired => 'Minimal satu grup harus diaktifkan';

  @override
  String get settingsLoadFailedMessage => 'Gagal memuat pengaturan';

  @override
  String get customImageNotice1 =>
      'Saat grup diaktifkan, gambar ditampilkan secara acak untuk setiap grup.';

  @override
  String get customImageNotice2 =>
      'Gambar yang diunggah dan diatur oleh pengguna tidak dibagikan kepada pengembang atau pihak ketiga, dan hanya disimpan di area aplikasi pada perangkat.';

  @override
  String get customImageNotice3 =>
      'Dengan demikian, aplikasi dapat digunakan secara offline.';

  @override
  String get customImageNotice4 =>
      'Menambahkan banyak gambar memakai ruang penyimpanan. Jika ada masalah, nonaktifkan gambar pribadi atau hapus gambar yang tidak dipakai di Pengaturan.';

  @override
  String get customImageNotice5 =>
      'Saat aplikasi dihapus, gambar yang telah diatur juga akan terhapus.';

  @override
  String get customImageRequirementNotMet =>
      'Untuk menggunakan gambar kustom, diperlukan minimal 1 gambar baik dan 3 gambar tidak baik di grup yang diaktifkan.';

  @override
  String get customImageRequirement =>
      'Untuk menggunakan gambar kustom, diperlukan minimal 1 gambar baik dan 3 gambar tidak baik di grup yang diaktifkan.';

  @override
  String get sunnyWeather => 'Baik';

  @override
  String get rainyWeather => 'Tidak baik';

  @override
  String get addImages => 'Tambah Gambar';

  @override
  String get imageDeleted => 'Gambar telah dihapus';

  @override
  String get imageDeleteFailed => 'Gagal menghapus gambar';

  @override
  String get deleteImageTitle => 'Hapus Gambar';

  @override
  String get deleteImageMessage =>
      'Hapus gambar ini? Tindakan ini tidak dapat dibatalkan.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Gambar $weather Grup $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Terdaftar: $count gambar';
  }

  @override
  String get noImagesRegistered => 'Belum ada gambar yang terdaftar';

  @override
  String get imagePreview => 'Pratinjau Gambar';

  @override
  String get close => 'Tutup';

  @override
  String get contactEmailSubject => 'FocusMint - Pertanyaan';

  @override
  String get contactEmailBody =>
      'Silakan sampaikan masukan dan pertanyaan Anda.';

  @override
  String get mixWithBuiltInImages => 'Campur dengan gambar bawaan';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Gunakan gambar bawaan dan gambarmu sendiri bersama-sama';

  @override
  String get supportIntro =>
      'Hubungi pengembang secara anonim. Pertanyaan dan saran diterima. Kamu dapat mengirim 3 pesan per hari. Setiap balasan pengembang mengembalikan jatah pesanmu menjadi 3.';

  @override
  String get supportReceived =>
      'Pesan diterima. Kami biasanya membalas dalam 2–3 hari.';

  @override
  String get supportComposer => 'Tulis pesan';

  @override
  String get supportSend => 'Kirim';

  @override
  String get supportRetry => 'Coba lagi';

  @override
  String get supportSent => 'Terkirim';

  @override
  String get supportUnsent => 'Belum terkirim · tersimpan di perangkat ini';

  @override
  String get supportAttach => 'Lampirkan gambar';

  @override
  String get supportRemoveImage => 'Hapus gambar';

  @override
  String get supportImage => 'Lampiran';

  @override
  String get supportClear => 'Hapus riwayat';

  @override
  String get supportClearConfirm =>
      'Hapus percakapan ini? Draf yang belum dikirim dan riwayat di server juga akan dihapus. Ini tidak mengatur ulang jatah pesanmu.';

  @override
  String get supportQuota =>
      'Jatah 3 pesan hari ini sudah habis. Kirim lagi besok atau setelah pengembang membalas.';

  @override
  String get supportConnectionError =>
      'Tidak dapat terhubung. Draf yang tersimpan belum dikirim.';

  @override
  String get supportSendError =>
      'Tidak dapat mengirim. Pesanmu tersimpan di perangkat ini. Silakan coba lagi.';

  @override
  String get supportStorageError => 'Tidak dapat menyimpan. Silakan coba lagi.';

  @override
  String get supportClearError =>
      'Tidak dapat menghapus riwayat. Periksa koneksi dan coba lagi.';

  @override
  String get supportImageError =>
      'Tidak dapat memuat gambar. Pilih gambar berukuran di bawah 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Sisa pesan hari ini: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Balasan belum dibaca: $count';
  }

  @override
  String get supportGuide => 'Informasi';

  @override
  String get supportDeveloper => 'Pengembang';

  @override
  String get supportPrivacy => 'Tentang data permintaan bantuan';

  @override
  String get breathingTitle => 'Luangkan waktu untuk bernapas';

  @override
  String get breathingHint =>
      'Ikuti gerakan lembut paru-paru\ndengan ritme yang nyaman.';

  @override
  String get breathingIn => 'Tarik napas perlahan';

  @override
  String get breathingOut => 'Buang napas perlahan';

  @override
  String get breathingProgress => 'Progres latihan pernapasan';

  @override
  String get breathingResultHint => 'Hasilmu akan muncul secara otomatis.';

  @override
  String get breathingSkip => 'Langsung ke hasil';
}
