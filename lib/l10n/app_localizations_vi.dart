// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Điểm hiện tại';

  @override
  String goalLabel(int goal) {
    return 'Mục tiêu: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Còn lại: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Đã đạt mục tiêu!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'Luyện cách chú ý đến điều tích cực.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Thời gian còn lại: $minutes phút $seconds giây';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Thời gian còn lại: $seconds giây';
  }

  @override
  String scoreLabel(String score) {
    return 'Điểm số: $score điểm';
  }

  @override
  String get imagePreparationMessage => 'Đang chuẩn bị hình ảnh...';

  @override
  String get noStimuliAvailable => 'Không có kích thích nào khả dụng';

  @override
  String get invalidGridSize => 'Kích thước lưới không hợp lệ';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Đang bắt đầu...';

  @override
  String get excellentPerformance => 'Thành tích xuất sắc!';

  @override
  String get greatJob => 'Làm tốt lắm!';

  @override
  String get goodPerformance => 'Thành tích tốt';

  @override
  String get keepPracticingFeedback => 'Hãy tiếp tục luyện tập';

  @override
  String get takeYourTimeFeedback => 'Cứ từ từ, đừng vội';

  @override
  String get happy => 'Vui vẻ';

  @override
  String get angry => 'Tức giận';

  @override
  String get fear => 'Sợ hãi';

  @override
  String get sad => 'Buồn bã';

  @override
  String get historyPageTitle => 'Lịch sử luyện tập';

  @override
  String get dataLoading => 'Đang tải dữ liệu...';

  @override
  String get pointsHistory => 'Lịch sử điểm';

  @override
  String get weekly => 'Theo tuần';

  @override
  String get monthly => 'Theo tháng';

  @override
  String get noDataAvailable => 'Không có dữ liệu';

  @override
  String get goalAchievementRate => 'Tỷ lệ đạt mục tiêu';

  @override
  String get scoreStatistics => 'Thống kê điểm số';

  @override
  String get bestScore => 'Điểm cao nhất';

  @override
  String get totalScore => 'Tổng điểm';

  @override
  String get trainingTime => 'Thời gian luyện tập';

  @override
  String get totalTrainingTime => 'Tổng thời gian luyện tập';

  @override
  String get detailedStatistics => 'Thống kê chi tiết';

  @override
  String get averageScorePerMinute => 'Điểm trung bình mỗi phút';

  @override
  String get pointsToGoal => 'Số điểm còn thiếu để đạt mục tiêu';

  @override
  String get goalSetting => 'Cài đặt mục tiêu';

  @override
  String get secondsUnit => 'giây';

  @override
  String get minutesUnit => 'phút';

  @override
  String get hoursUnit => 'giờ';

  @override
  String get pointsUnit => 'điểm';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'CN';

  @override
  String get mondayShort => 'T2';

  @override
  String get tuesdayShort => 'T3';

  @override
  String get wednesdayShort => 'T4';

  @override
  String get thursdayShort => 'T5';

  @override
  String get fridayShort => 'T6';

  @override
  String get saturdayShort => 'T7';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get goalPointsSetting => 'Cài đặt điểm mục tiêu';

  @override
  String currentGoalPoints(int points) {
    return 'Mục tiêu hiện tại: $points điểm';
  }

  @override
  String get newGoalPointsLabel => 'Điểm mục tiêu mới';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'điểm';

  @override
  String get saveGoalButton => 'Lưu mục tiêu';

  @override
  String goalSetTo(int points) {
    return 'Đã đặt mục tiêu là $points điểm';
  }

  @override
  String get enterGoalPoints => 'Vui lòng nhập điểm mục tiêu';

  @override
  String get enterValidNumber => 'Vui lòng nhập số hợp lệ (từ 1 đến 99999999)';

  @override
  String get saveFailed => 'Không thể lưu một số cài đặt';

  @override
  String get emailOpenFailed => 'Không thể mở ứng dụng email';

  @override
  String get pageOpenFailed => 'Không thể mở trang';

  @override
  String get appInfoSupport => 'Thông tin ứng dụng & Hỗ trợ';

  @override
  String get contactUs => 'Liên hệ với chúng tôi';

  @override
  String get contactUsSubtitle => 'Chia sẻ ý kiến và câu hỏi của bạn';

  @override
  String get termsOfService => 'Điều khoản dịch vụ';

  @override
  String get termsSubtitle => 'Xem điều khoản dịch vụ của ứng dụng';

  @override
  String get privacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get privacySubtitle => 'Về cách xử lý thông tin cá nhân';

  @override
  String get tutorialTitle => 'Hướng dẫn';

  @override
  String get tutorialSubtitle => 'Tìm hiểu cách sử dụng ứng dụng';

  @override
  String get dataManagement => 'Quản lý dữ liệu';

  @override
  String get deleteHistory => 'Xóa lịch sử';

  @override
  String get deleteHistorySubtitle =>
      'Chỉ xóa lịch sử luyện tập (điểm mục tiêu được giữ lại)';

  @override
  String get deleteHistoryAndGoal => 'Xóa lịch sử & mục tiêu';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Xóa toàn bộ lịch sử và điểm mục tiêu';

  @override
  String get deleteHistoryConfirmTitle => 'Xóa lịch sử';

  @override
  String get deleteHistoryConfirmMessage =>
      'Bạn có chắc muốn xóa toàn bộ lịch sử luyện tập không?\n\n*Điểm mục tiêu sẽ được giữ lại';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Xóa lịch sử & mục tiêu';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Bạn có chắc muốn xóa toàn bộ lịch sử và điểm mục tiêu không?\n\n*Thao tác này không thể hoàn tác';

  @override
  String get cancel => 'Hủy';

  @override
  String get delete => 'Xóa';

  @override
  String get historyDeleted => 'Đã xóa lịch sử';

  @override
  String get historyAndGoalDeleted => 'Đã xóa lịch sử và mục tiêu';

  @override
  String get historyDeleteFailed => 'Xóa lịch sử không thành công';

  @override
  String get historyAndGoalDeleteFailed =>
      'Xóa lịch sử và mục tiêu không thành công';

  @override
  String get tutorialDisplayFailed => 'Không thể hiển thị hướng dẫn';

  @override
  String get tips => 'Mẹo';

  @override
  String get tipsContent =>
      '• Mục tiêu của bạn xuất hiện trên biểu đồ ở màn hình chính\n• Bắt đầu với mục tiêu nhỏ và tăng dần theo nhịp độ của bạn\n• Mỗi lựa chọn đúng mang lại tối đa 6 điểm';

  @override
  String get backToHome => 'Về trang chính';

  @override
  String get tutorialSkip => 'Bỏ qua';

  @override
  String get tutorialGoalAndPoints => 'Mục tiêu và điểm hiện tại';

  @override
  String get tutorialGoalDescription =>
      'Vòng tròn ngoài hiển thị mục tiêu, vòng tròn trong hiển thị tổng điểm. Vòng tròn sẽ đầy dần khi bạn tiến gần đến mục tiêu.';

  @override
  String get tutorialOneMinuteTraining => 'Luyện tập 1 phút';

  @override
  String get tutorialTrainingDescription =>
      'Bắt đầu trò chơi 1 phút. Chọn hình ảnh tích cực hoặc thói quen tốt từ 4 lựa chọn.';

  @override
  String get tutorialScoreProgress => 'Tiến trình điểm số';

  @override
  String get tutorialScoreDescription =>
      'Xem thông tin chi tiết về số điểm bạn đã đạt được.';

  @override
  String get tutorialSettingsAndData => 'Cài đặt và quản lý dữ liệu';

  @override
  String get tutorialSettingsDescription =>
      'Thay đổi mục tiêu, xem thông tin ứng dụng và đặt lại dữ liệu.';

  @override
  String get appIntroAttentionBiasTitle => 'Về thiên kiến chú ý';

  @override
  String get appIntroAttentionBiasContent =>
      'Khi lo âu tăng cao, chúng ta thường vô thức chỉ chú ý đến những điều tiêu cực.';

  @override
  String get appIntroFocusMintRoleTitle => 'Vai trò của FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Một trò chơi ngắn để luyện hướng sự chú ý vào các hình ảnh tích cực.';

  @override
  String get appIntroScientificEvidenceTitle => 'Về bài tập này';

  @override
  String get appIntroScientificEvidenceContent =>
      'Luyện tìm hình ảnh tích cực. FocusMint là công cụ tự chăm sóc bản thân, không phải phương pháp điều trị y tế. Kết quả có thể khác nhau ở mỗi người.';

  @override
  String get appIntroExpectedEffectsTitle => 'Những điều bạn có thể luyện tập';

  @override
  String get appIntroEffect1 => 'Tìm hình ảnh tích cực';

  @override
  String get appIntroEffect2 => 'Chú ý đến những nụ cười quanh bạn';

  @override
  String get appIntroEffect3 => 'Tạo một thói quen ngắn mỗi ngày';

  @override
  String get appIntroHowToUse => 'Xem cách sử dụng';

  @override
  String get pointsEarned => 'Đã nhận điểm!';

  @override
  String get yourScore => 'Điểm của bạn';

  @override
  String get totalPlayTime => 'Tổng thời gian chơi';

  @override
  String get imageManagement => 'Quản lý hình ảnh';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Hình ảnh đã ẩn: $count/$max';
  }

  @override
  String get unsavedChanges => 'Có thay đổi chưa được lưu';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Có $count thay đổi chưa lưu trong cài đặt hiển thị hình ảnh.';
  }

  @override
  String get unsavedChangesWarning =>
      'Nếu đóng màn hình này bây giờ, các thay đổi sẽ bị mất.';

  @override
  String get discardChanges => 'Bỏ thay đổi';

  @override
  String get saveAndExit => 'Lưu và thoát';

  @override
  String settingsSaved(Object count) {
    return 'Đã lưu $count cài đặt';
  }

  @override
  String get saveError => 'Đã xảy ra lỗi khi lưu cài đặt';

  @override
  String get imageSettingsUpdated => 'Đã cập nhật cài đặt hình ảnh';

  @override
  String get allImages => 'Tất cả';

  @override
  String get positiveImages => 'Tích cực';

  @override
  String get negativeImages => 'Tiêu cực';

  @override
  String get smileImages => 'Nụ cười';

  @override
  String get vegetableImages => 'Thực phẩm bổ dưỡng';

  @override
  String get healthImages => 'Vận động và giao lưu';

  @override
  String get sadImages => 'Tức giận, buồn bã và lo lắng';

  @override
  String get badFoodImages => 'Đồ ăn nhanh và đồ ngọt';

  @override
  String get badImages => 'Thói quen không lành mạnh';

  @override
  String get imageManagementHint =>
      'Chạm để bật/tắt hiển thị hình ảnh. Bạn có thể ẩn tối đa 15 hình.';

  @override
  String get unsaved => 'Chưa lưu';

  @override
  String get save => 'Lưu';

  @override
  String get hiddenImages => 'Đã ẩn';

  @override
  String get noHiddenImages => 'Không có hình ảnh nào bị ẩn';

  @override
  String get settingsLoadFailed => 'Không thể tải cài đặt';

  @override
  String imagesAdded(int count) {
    return 'Đã thêm $count hình ảnh';
  }

  @override
  String get imageAddFailed => 'Thêm hình ảnh không thành công';

  @override
  String get imageSelectionFailed => 'Chọn hình ảnh không thành công';

  @override
  String get settingsChangeFailed => 'Thay đổi cài đặt không thành công';

  @override
  String groupTitle(String name) {
    return 'Nhóm: $name';
  }

  @override
  String get displayToggle => 'Bật/tắt hiển thị';

  @override
  String imageCount(int count) {
    return '$count hình ảnh';
  }

  @override
  String get noticeTitle => 'Lưu ý quan trọng';

  @override
  String get notice1 => 'Đã thêm tính năng hình ảnh tùy chỉnh!';

  @override
  String get notice2 =>
      'Bạn có thể thêm hình ảnh của riêng mình từ màn hình cài đặt';

  @override
  String get notice3 => 'Vui lòng xem chi tiết tại màn hình cài đặt';

  @override
  String get customImageTitle => 'Hình ảnh tùy chỉnh';

  @override
  String get customImageSubtitle => 'Thêm và quản lý hình ảnh của riêng bạn';

  @override
  String get addCustomImages => 'Thêm hình ảnh tùy chỉnh';

  @override
  String get selectImages => 'Chọn hình ảnh';

  @override
  String get unknownImage => 'Hình ảnh không xác định';

  @override
  String get customImageSettings => 'Cài đặt hình ảnh tùy chỉnh';

  @override
  String get useCustomImages => 'Sử dụng hình ảnh tùy chỉnh';

  @override
  String get useCustomImagesDescription =>
      'Dùng ảnh của bạn để luyện tập. Bật tùy chọn kết hợp bên dưới để dùng cả ảnh có sẵn trong ứng dụng.';

  @override
  String get groupSettings => 'Cài đặt nhóm';

  @override
  String get minOneGroupRequired => 'Phải bật ít nhất một nhóm';

  @override
  String get settingsLoadFailedMessage => 'Không thể tải cài đặt';

  @override
  String get customImageNotice1 =>
      'Khi nhóm được bật, hình ảnh sẽ được hiển thị ngẫu nhiên theo từng nhóm.';

  @override
  String get customImageNotice2 =>
      'Hình ảnh do người dùng tải lên và thiết lập sẽ không được chia sẻ với nhà phát triển hay bên thứ ba, và chỉ được lưu trong vùng dữ liệu của ứng dụng trên thiết bị.';

  @override
  String get customImageNotice3 => 'Nhờ đó có thể sử dụng ngoại tuyến.';

  @override
  String get customImageNotice4 =>
      'Thêm nhiều ảnh sẽ chiếm dung lượng lưu trữ. Nếu gặp vấn đề, hãy tắt ảnh cá nhân hoặc xóa ảnh không dùng trong phần Cài đặt.';

  @override
  String get customImageNotice5 =>
      'Khi xóa ứng dụng, các hình ảnh đã thiết lập cũng sẽ bị xóa.';

  @override
  String get customImageRequirementNotMet =>
      'Để sử dụng hình ảnh tùy chỉnh, cần có ít nhất 1 hình ảnh tốt và 3 hình ảnh không tốt trong các nhóm được bật.';

  @override
  String get customImageRequirement =>
      'Để sử dụng hình ảnh tùy chỉnh, cần có ít nhất 1 hình ảnh tốt và 3 hình ảnh không tốt trong các nhóm được bật.';

  @override
  String get sunnyWeather => 'Tốt';

  @override
  String get rainyWeather => 'Không tốt';

  @override
  String get addImages => 'Thêm hình ảnh';

  @override
  String get imageDeleted => 'Đã xóa hình ảnh';

  @override
  String get imageDeleteFailed => 'Xóa hình ảnh không thành công';

  @override
  String get deleteImageTitle => 'Xóa hình ảnh';

  @override
  String get deleteImageMessage =>
      'Bạn có muốn xóa hình ảnh này không? Thao tác này không thể hoàn tác.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Nhóm $groupId - Hình ảnh $weather';
  }

  @override
  String registeredCount(int count) {
    return 'Đã đăng ký: $count hình ảnh';
  }

  @override
  String get noImagesRegistered => 'Chưa có hình ảnh nào được đăng ký';

  @override
  String get imagePreview => 'Xem trước hình ảnh';

  @override
  String get close => 'Đóng';

  @override
  String get contactEmailSubject => 'FocusMint - Liên hệ';

  @override
  String get contactEmailBody => 'Vui lòng chia sẻ ý kiến và câu hỏi của bạn.';

  @override
  String get mixWithBuiltInImages => 'Kết hợp với ảnh có sẵn';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Dùng kết hợp ảnh có sẵn và ảnh của bạn';

  @override
  String get supportIntro =>
      'Trò chuyện ẩn danh với nhà phát triển. Bạn có thể gửi câu hỏi và góp ý. Mỗi ngày được gửi 3 tin nhắn. Mỗi phản hồi từ nhà phát triển sẽ khôi phục số tin nhắn còn lại về 3.';

  @override
  String get supportReceived =>
      'Đã nhận tin nhắn. Chúng tôi thường trả lời trong 2–3 ngày.';

  @override
  String get supportComposer => 'Nhập tin nhắn';

  @override
  String get supportSend => 'Gửi';

  @override
  String get supportRetry => 'Thử lại';

  @override
  String get supportSent => 'Đã gửi';

  @override
  String get supportUnsent => 'Chưa gửi · đã lưu trên thiết bị này';

  @override
  String get supportAttach => 'Đính kèm ảnh';

  @override
  String get supportRemoveImage => 'Bỏ ảnh';

  @override
  String get supportImage => 'Tệp đính kèm';

  @override
  String get supportClear => 'Xóa lịch sử';

  @override
  String get supportClearConfirm =>
      'Xóa cuộc trò chuyện này? Bản nháp chưa gửi và lịch sử trên máy chủ cũng sẽ bị xóa. Việc này không khôi phục hạn mức tin nhắn.';

  @override
  String get supportQuota =>
      'Bạn đã dùng hết 3 tin nhắn hôm nay. Hãy gửi tiếp vào ngày mai hoặc sau khi nhà phát triển trả lời.';

  @override
  String get supportConnectionError =>
      'Không thể kết nối. Các bản nháp đã lưu chưa được gửi.';

  @override
  String get supportSendError =>
      'Không thể gửi. Tin nhắn đã được lưu trên thiết bị này. Vui lòng thử lại.';

  @override
  String get supportStorageError => 'Không thể lưu. Vui lòng thử lại.';

  @override
  String get supportClearError =>
      'Không thể xóa lịch sử. Hãy kiểm tra kết nối rồi thử lại.';

  @override
  String get supportImageError => 'Không thể tải ảnh. Hãy chọn ảnh dưới 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Tin nhắn còn lại hôm nay: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Phản hồi chưa đọc: $count';
  }

  @override
  String get supportGuide => 'Thông tin';

  @override
  String get supportDeveloper => 'Nhà phát triển';

  @override
  String get supportPrivacy => 'Dữ liệu yêu cầu hỗ trợ';

  @override
  String get breathingTitle => 'Dành một nhịp để thở';

  @override
  String get breathingHint =>
      'Làm theo chuyển động nhẹ của phổi\nvới nhịp độ bạn thấy thoải mái.';

  @override
  String get breathingIn => 'Hít vào chậm rãi';

  @override
  String get breathingOut => 'Thở ra chậm rãi';

  @override
  String get breathingProgress => 'Tiến trình bài tập thở';

  @override
  String get breathingResultHint => 'Kết quả sẽ tự động hiển thị khi kết thúc.';

  @override
  String get breathingSkip => 'Bỏ qua và xem kết quả';
}
