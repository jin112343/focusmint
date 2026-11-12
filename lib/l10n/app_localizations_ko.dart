// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => '현재 포인트';

  @override
  String goalLabel(int goal) {
    return '목표: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return '남음: $remaining';
  }

  @override
  String get goalAchieved => '🎉 목표 달성!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => '긍정적인 것을 알아차리는 연습을 해 보세요.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return '남은 시간: $minutes분 $seconds초';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return '남은 시간: $seconds초';
  }

  @override
  String scoreLabel(String score) {
    return '점수: $score 포인트';
  }

  @override
  String get imagePreparationMessage => '이미지를 준비하는 중...';

  @override
  String get noStimuliAvailable => '사용할 수 있는 자극이 없습니다';

  @override
  String get invalidGridSize => '잘못된 그리드 크기';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => '시작하는 중...';

  @override
  String get excellentPerformance => '훌륭한 성과입니다!';

  @override
  String get greatJob => '잘하셨습니다!';

  @override
  String get goodPerformance => '좋은 성과입니다';

  @override
  String get keepPracticingFeedback => '계속 연습해 보세요';

  @override
  String get takeYourTimeFeedback => '천천히 정확하게 해 보세요';

  @override
  String get happy => '기쁨';

  @override
  String get angry => '화남';

  @override
  String get fear => '두려움';

  @override
  String get sad => '슬픔';

  @override
  String get historyPageTitle => '트레이닝 기록';

  @override
  String get dataLoading => '데이터를 불러오는 중...';

  @override
  String get pointsHistory => '포인트 획득 기록';

  @override
  String get weekly => '주간';

  @override
  String get monthly => '월간';

  @override
  String get noDataAvailable => '데이터가 없습니다';

  @override
  String get goalAchievementRate => '목표 달성률';

  @override
  String get scoreStatistics => '점수 통계';

  @override
  String get bestScore => '최고 점수';

  @override
  String get totalScore => '총 점수';

  @override
  String get trainingTime => '트레이닝 시간';

  @override
  String get totalTrainingTime => '누적 트레이닝 시간';

  @override
  String get detailedStatistics => '상세 통계';

  @override
  String get averageScorePerMinute => '분당 평균 점수';

  @override
  String get pointsToGoal => '목표까지 남은 포인트';

  @override
  String get goalSetting => '목표 설정';

  @override
  String get secondsUnit => '초';

  @override
  String get minutesUnit => '분';

  @override
  String get hoursUnit => '시간';

  @override
  String get pointsUnit => '포인트';

  @override
  String get monthSuffix => '월';

  @override
  String get sundayShort => '일';

  @override
  String get mondayShort => '월';

  @override
  String get tuesdayShort => '화';

  @override
  String get wednesdayShort => '수';

  @override
  String get thursdayShort => '목';

  @override
  String get fridayShort => '금';

  @override
  String get saturdayShort => '토';

  @override
  String get settingsTitle => '설정';

  @override
  String get goalPointsSetting => '목표 포인트 설정';

  @override
  String currentGoalPoints(int points) {
    return '현재 목표: $points 포인트';
  }

  @override
  String get newGoalPointsLabel => '새 목표 포인트';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => '포인트';

  @override
  String get saveGoalButton => '목표 저장';

  @override
  String goalSetTo(int points) {
    return '목표를 $points 포인트로 설정했습니다';
  }

  @override
  String get enterGoalPoints => '목표 포인트를 입력해 주세요';

  @override
  String get enterValidNumber => '올바른 숫자를 입력해 주세요 (1~99999999)';

  @override
  String get saveFailed => '일부 설정을 저장하지 못했습니다';

  @override
  String get emailOpenFailed => '메일 앱을 열 수 없습니다';

  @override
  String get pageOpenFailed => '페이지를 열 수 없습니다';

  @override
  String get appInfoSupport => '앱 정보 및 지원';

  @override
  String get contactUs => '문의하기';

  @override
  String get contactUsSubtitle => '의견과 질문을 보내 주세요';

  @override
  String get termsOfService => '이용약관';

  @override
  String get termsSubtitle => '앱 이용약관을 확인하세요';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get privacySubtitle => '개인정보 취급에 관한 안내';

  @override
  String get tutorialTitle => '튜토리얼';

  @override
  String get tutorialSubtitle => '앱 사용 방법 알아보기';

  @override
  String get dataManagement => '데이터 관리';

  @override
  String get deleteHistory => '기록 삭제';

  @override
  String get deleteHistorySubtitle => '트레이닝 기록만 삭제합니다 (목표 포인트는 유지)';

  @override
  String get deleteHistoryAndGoal => '기록 및 목표 삭제';

  @override
  String get deleteHistoryAndGoalSubtitle => '모든 기록과 목표 포인트를 삭제합니다';

  @override
  String get deleteHistoryConfirmTitle => '기록 삭제';

  @override
  String get deleteHistoryConfirmMessage =>
      '모든 트레이닝 기록을 삭제하시겠습니까?\n\n※목표 포인트는 유지됩니다';

  @override
  String get deleteHistoryAndGoalConfirmTitle => '기록 및 목표 삭제';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      '모든 기록과 목표 포인트를 삭제하시겠습니까?\n\n※이 작업은 되돌릴 수 없습니다';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get historyDeleted => '기록을 삭제했습니다';

  @override
  String get historyAndGoalDeleted => '기록과 목표를 삭제했습니다';

  @override
  String get historyDeleteFailed => '기록을 삭제하지 못했습니다';

  @override
  String get historyAndGoalDeleteFailed => '기록과 목표를 삭제하지 못했습니다';

  @override
  String get tutorialDisplayFailed => '튜토리얼을 표시하지 못했습니다';

  @override
  String get tips => '팁';

  @override
  String get tipsContent =>
      '• 목표는 홈 화면 그래프에 표시됩니다\n• 작은 목표부터 시작해 자신의 속도에 맞게 높여 보세요\n• 한 번의 올바른 선택으로 최대 6점을 얻을 수 있습니다';

  @override
  String get backToHome => '홈으로 돌아가기';

  @override
  String get tutorialSkip => '건너뛰기';

  @override
  String get tutorialGoalAndPoints => '목표와 현재 포인트';

  @override
  String get tutorialGoalDescription =>
      '바깥쪽 원은 목표, 안쪽 원은 총 포인트를 나타냅니다. 목표에 가까워질수록 원이 채워집니다.';

  @override
  String get tutorialOneMinuteTraining => '1분 트레이닝';

  @override
  String get tutorialTrainingDescription =>
      '1분 게임을 시작합니다. 4개의 선택지 중에서 긍정적인 이미지나 좋은 습관을 선택하세요.';

  @override
  String get tutorialScoreProgress => '점수 추이';

  @override
  String get tutorialScoreDescription => '획득한 점수의 상세 정보를 확인할 수 있습니다.';

  @override
  String get tutorialSettingsAndData => '설정 및 데이터 관리';

  @override
  String get tutorialSettingsDescription =>
      '목표값 변경, 앱 정보 확인, 데이터 초기화를 할 수 있습니다.';

  @override
  String get appIntroAttentionBiasTitle => '주의 편향에 대하여';

  @override
  String get appIntroAttentionBiasContent =>
      '불안이 높을 때는 무의식적으로 부정적인 것에만 주의가 쏠리기 쉽습니다.';

  @override
  String get appIntroFocusMintRoleTitle => 'FocusMint의 역할';

  @override
  String get appIntroFocusMintRoleContent =>
      '긍정적인 이미지에 주의를 기울이는 연습을 위한 짧은 게임입니다.';

  @override
  String get appIntroScientificEvidenceTitle => '이 연습에 대해';

  @override
  String get appIntroScientificEvidenceContent =>
      '긍정적인 이미지를 찾는 연습입니다. FocusMint는 일상적인 자기 돌봄을 위한 앱이며 의료 행위나 치료를 제공하지 않습니다. 느끼는 변화는 사람마다 다를 수 있습니다.';

  @override
  String get appIntroExpectedEffectsTitle => '연습할 수 있는 것';

  @override
  String get appIntroEffect1 => '긍정적인 이미지 찾기';

  @override
  String get appIntroEffect2 => '주변의 미소 알아차리기';

  @override
  String get appIntroEffect3 => '짧은 일상 습관 만들기';

  @override
  String get appIntroHowToUse => '사용 방법 보기';

  @override
  String get pointsEarned => '포인트 획득!';

  @override
  String get yourScore => '내 점수';

  @override
  String get totalPlayTime => '총 플레이 시간';

  @override
  String get imageManagement => '이미지 관리';

  @override
  String hiddenImagesCount(int count, int max) {
    return '숨긴 이미지: $count/$max';
  }

  @override
  String get unsavedChanges => '저장하지 않은 변경 사항이 있습니다';

  @override
  String unsavedChangesMessage(Object count) {
    return '이미지 표시 설정에 저장하지 않은 변경 사항이 $count건 있습니다.';
  }

  @override
  String get unsavedChangesWarning => '지금 화면을 닫으면 변경 사항이 사라집니다.';

  @override
  String get discardChanges => '변경 사항 버리기';

  @override
  String get saveAndExit => '저장 후 나가기';

  @override
  String settingsSaved(Object count) {
    return '설정 $count건을 저장했습니다';
  }

  @override
  String get saveError => '설정을 저장하는 중 오류가 발생했습니다';

  @override
  String get imageSettingsUpdated => '이미지 설정이 업데이트되었습니다';

  @override
  String get allImages => '전체';

  @override
  String get positiveImages => '긍정';

  @override
  String get negativeImages => '부정';

  @override
  String get smileImages => '미소';

  @override
  String get vegetableImages => '영양이 풍부한 음식';

  @override
  String get healthImages => '운동과 교류';

  @override
  String get sadImages => '분노·슬픔·걱정';

  @override
  String get badFoodImages => '패스트푸드와 단 음식';

  @override
  String get badImages => '건강에 부담이 되는 습관';

  @override
  String get imageManagementHint =>
      '탭하여 이미지 표시 여부를 전환할 수 있습니다. 최대 15장까지 숨길 수 있습니다.';

  @override
  String get unsaved => '저장 안 됨';

  @override
  String get save => '저장';

  @override
  String get hiddenImages => '숨김';

  @override
  String get noHiddenImages => '숨긴 이미지가 없습니다';

  @override
  String get settingsLoadFailed => '설정을 불러오지 못했습니다';

  @override
  String imagesAdded(int count) {
    return '이미지 $count장을 추가했습니다';
  }

  @override
  String get imageAddFailed => '이미지를 추가하지 못했습니다';

  @override
  String get imageSelectionFailed => '이미지를 선택하지 못했습니다';

  @override
  String get settingsChangeFailed => '설정을 변경하지 못했습니다';

  @override
  String groupTitle(String name) {
    return '그룹: $name';
  }

  @override
  String get displayToggle => '표시 전환';

  @override
  String imageCount(int count) {
    return '$count장';
  }

  @override
  String get noticeTitle => '주의 사항';

  @override
  String get notice1 => '커스텀 이미지 기능이 추가되었습니다!';

  @override
  String get notice2 => '설정 화면에서 나만의 이미지를 추가할 수 있습니다';

  @override
  String get notice3 => '자세한 내용은 설정 화면을 확인해 주세요';

  @override
  String get customImageTitle => '커스텀 이미지';

  @override
  String get customImageSubtitle => '나만의 이미지 추가 및 관리';

  @override
  String get addCustomImages => '커스텀 이미지 추가';

  @override
  String get selectImages => '이미지 선택';

  @override
  String get unknownImage => '알 수 없는 이미지';

  @override
  String get customImageSettings => '커스텀 이미지 설정';

  @override
  String get useCustomImages => '커스텀 이미지 사용';

  @override
  String get useCustomImagesDescription =>
      '내 이미지를 연습에 사용합니다. 앱의 기본 이미지도 포함하려면 아래 혼합 옵션을 켜세요.';

  @override
  String get groupSettings => '그룹 설정';

  @override
  String get minOneGroupRequired => '최소 1개의 그룹은 활성화되어 있어야 합니다';

  @override
  String get settingsLoadFailedMessage => '설정을 불러오지 못했습니다';

  @override
  String get customImageNotice1 => '그룹이 활성화되어 있으면 그룹별로 이미지가 무작위로 표시됩니다.';

  @override
  String get customImageNotice2 =>
      '사용자가 업로드해 설정한 이미지는 개발자나 제3자와 공유되지 않으며, 기기 내 앱 영역에만 저장됩니다.';

  @override
  String get customImageNotice3 => '따라서 오프라인에서도 사용할 수 있습니다.';

  @override
  String get customImageNotice4 =>
      '이미지를 많이 추가하면 저장 공간을 사용합니다. 문제가 생기면 설정에서 사용자 이미지를 끄거나 사용하지 않는 이미지를 삭제하세요.';

  @override
  String get customImageNotice5 => '앱을 삭제하면 설정한 이미지도 함께 삭제됩니다.';

  @override
  String get customImageRequirementNotMet =>
      '커스텀 이미지를 사용하려면 활성화된 그룹에 좋은 이미지 1장 이상과 좋지 않은 이미지 3장 이상이 필요합니다.';

  @override
  String get customImageRequirement =>
      '커스텀 이미지를 사용하려면 활성화된 그룹에 좋은 이미지 1장 이상과 좋지 않은 이미지 3장 이상이 필요합니다.';

  @override
  String get sunnyWeather => '좋음';

  @override
  String get rainyWeather => '좋지 않음';

  @override
  String get addImages => '이미지 추가';

  @override
  String get imageDeleted => '이미지를 삭제했습니다';

  @override
  String get imageDeleteFailed => '이미지를 삭제하지 못했습니다';

  @override
  String get deleteImageTitle => '이미지 삭제';

  @override
  String get deleteImageMessage => '이 이미지를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return '그룹 $groupId $weather 이미지';
  }

  @override
  String registeredCount(int count) {
    return '등록됨: $count장';
  }

  @override
  String get noImagesRegistered => '등록된 이미지가 없습니다';

  @override
  String get imagePreview => '이미지 미리보기';

  @override
  String get close => '닫기';

  @override
  String get contactEmailSubject => 'FocusMint - 문의';

  @override
  String get contactEmailBody => '의견이나 문의 사항을 적어 주세요.';

  @override
  String get mixWithBuiltInImages => '기본 이미지와 혼합';

  @override
  String get mixWithBuiltInImagesDescription => '기본 이미지와 내 이미지를 함께 사용합니다';

  @override
  String get supportIntro =>
      '개발자에게 익명으로 문의할 수 있습니다. 질문과 제안을 보내 주세요. 하루에 메시지 3개를 보낼 수 있으며 개발자가 답장할 때마다 전송 가능 횟수가 3개로 회복됩니다.';

  @override
  String get supportReceived => '메시지를 받았습니다. 보통 2~3일 안에 답변드립니다.';

  @override
  String get supportComposer => '메시지 입력';

  @override
  String get supportSend => '보내기';

  @override
  String get supportRetry => '다시 시도';

  @override
  String get supportSent => '전송됨';

  @override
  String get supportUnsent => '미전송 · 이 기기에 저장됨';

  @override
  String get supportAttach => '이미지 첨부';

  @override
  String get supportRemoveImage => '이미지 제거';

  @override
  String get supportImage => '첨부 파일';

  @override
  String get supportClear => '대화 기록 삭제';

  @override
  String get supportClearConfirm =>
      '이 대화를 삭제할까요? 보내지 않은 초안과 서버의 기록도 삭제됩니다. 전송 가능 횟수는 초기화되지 않습니다.';

  @override
  String get supportQuota =>
      '오늘의 메시지 3개를 모두 사용했습니다. 내일 또는 개발자의 답장 후에 다시 보낼 수 있습니다.';

  @override
  String get supportConnectionError => '연결할 수 없습니다. 저장된 초안은 전송되지 않았습니다.';

  @override
  String get supportSendError =>
      '전송하지 못했습니다. 메시지는 이 기기에 저장되어 있습니다. 다시 시도해 주세요.';

  @override
  String get supportStorageError => '저장하지 못했습니다. 다시 시도해 주세요.';

  @override
  String get supportClearError => '기록을 삭제하지 못했습니다. 연결 상태를 확인하고 다시 시도해 주세요.';

  @override
  String get supportImageError => '이미지를 불러올 수 없습니다. 30 MB 미만의 이미지를 선택해 주세요.';

  @override
  String supportRemaining(int count) {
    return '오늘 남은 메시지 수: $count';
  }

  @override
  String supportUnread(int count) {
    return '읽지 않은 답장 수: $count';
  }

  @override
  String get supportGuide => '안내';

  @override
  String get supportDeveloper => '개발자';

  @override
  String get supportPrivacy => '문의 데이터 안내';

  @override
  String get breathingTitle => '잠시 숨을 골라 보세요';

  @override
  String get breathingHint => '편안한 속도로\n폐의 부드러운 움직임에 맞춰 호흡하세요.';

  @override
  String get breathingIn => '천천히 들이쉬세요';

  @override
  String get breathingOut => '천천히 내쉬세요';

  @override
  String get breathingProgress => '호흡 안내 진행 상황';

  @override
  String get breathingResultHint => '끝나면 결과가 자동으로 표시됩니다.';

  @override
  String get breathingSkip => '건너뛰고 결과 보기';
}
