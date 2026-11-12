// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'คะแนนปัจจุบัน';

  @override
  String goalLabel(int goal) {
    return 'เป้าหมาย: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'เหลืออีก: $remaining';
  }

  @override
  String get goalAchieved => '🎉 บรรลุเป้าหมายแล้ว!';

  @override
  String get startButtonText => 'START';

  @override
  String get stressReductionMessage => 'ฝึกสังเกตสิ่งดี ๆ รอบตัว';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'เวลาที่เหลือ: $minutes นาที $seconds วินาที';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'เวลาที่เหลือ: $seconds วินาที';
  }

  @override
  String scoreLabel(String score) {
    return 'คะแนน: $score แต้ม';
  }

  @override
  String get imagePreparationMessage => 'กำลังเตรียมรูปภาพ...';

  @override
  String get noStimuliAvailable => 'ไม่มีสิ่งเร้าที่ใช้ได้';

  @override
  String get invalidGridSize => 'ขนาดตารางไม่ถูกต้อง';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'กำลังเริ่ม...';

  @override
  String get excellentPerformance => 'ผลงานยอดเยี่ยม!';

  @override
  String get greatJob => 'เก่งมาก!';

  @override
  String get goodPerformance => 'ผลงานดี';

  @override
  String get keepPracticingFeedback => 'ฝึกฝนต่อไปนะ';

  @override
  String get takeYourTimeFeedback => 'ค่อย ๆ ทำไปนะ';

  @override
  String get happy => 'มีความสุข';

  @override
  String get angry => 'โกรธ';

  @override
  String get fear => 'กลัว';

  @override
  String get sad => 'เศร้า';

  @override
  String get historyPageTitle => 'ประวัติการฝึก';

  @override
  String get dataLoading => 'กำลังโหลดข้อมูล...';

  @override
  String get pointsHistory => 'ประวัติคะแนน';

  @override
  String get weekly => 'รายสัปดาห์';

  @override
  String get monthly => 'รายเดือน';

  @override
  String get noDataAvailable => 'ไม่มีข้อมูล';

  @override
  String get goalAchievementRate => 'อัตราการบรรลุเป้าหมาย';

  @override
  String get scoreStatistics => 'สถิติคะแนน';

  @override
  String get bestScore => 'คะแนนสูงสุด';

  @override
  String get totalScore => 'คะแนนรวม';

  @override
  String get trainingTime => 'เวลาฝึก';

  @override
  String get totalTrainingTime => 'เวลาฝึกทั้งหมด';

  @override
  String get detailedStatistics => 'สถิติโดยละเอียด';

  @override
  String get averageScorePerMinute => 'คะแนนเฉลี่ยต่อนาที';

  @override
  String get pointsToGoal => 'คะแนนที่เหลือถึงเป้าหมาย';

  @override
  String get goalSetting => 'ตั้งค่าเป้าหมาย';

  @override
  String get secondsUnit => 'วิ';

  @override
  String get minutesUnit => 'น.';

  @override
  String get hoursUnit => 'ชม.';

  @override
  String get pointsUnit => 'แต้ม';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'อา.';

  @override
  String get mondayShort => 'จ.';

  @override
  String get tuesdayShort => 'อ.';

  @override
  String get wednesdayShort => 'พ.';

  @override
  String get thursdayShort => 'พฤ.';

  @override
  String get fridayShort => 'ศ.';

  @override
  String get saturdayShort => 'ส.';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get goalPointsSetting => 'ตั้งค่าคะแนนเป้าหมาย';

  @override
  String currentGoalPoints(int points) {
    return 'เป้าหมายปัจจุบัน: $points แต้ม';
  }

  @override
  String get newGoalPointsLabel => 'คะแนนเป้าหมายใหม่';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'แต้ม';

  @override
  String get saveGoalButton => 'บันทึกเป้าหมาย';

  @override
  String goalSetTo(int points) {
    return 'ตั้งเป้าหมายเป็น $points แต้มแล้ว';
  }

  @override
  String get enterGoalPoints => 'กรุณากรอกคะแนนเป้าหมาย';

  @override
  String get enterValidNumber => 'กรุณากรอกตัวเลขที่ถูกต้อง (1 ถึง 99999999)';

  @override
  String get saveFailed => 'บันทึกการตั้งค่าบางรายการไม่สำเร็จ';

  @override
  String get emailOpenFailed => 'ไม่สามารถเปิดแอปอีเมลได้';

  @override
  String get pageOpenFailed => 'ไม่สามารถเปิดหน้าเว็บได้';

  @override
  String get appInfoSupport => 'ข้อมูลแอปและการสนับสนุน';

  @override
  String get contactUs => 'ติดต่อเรา';

  @override
  String get contactUsSubtitle => 'แจ้งความคิดเห็นและข้อสงสัยของคุณ';

  @override
  String get termsOfService => 'ข้อกำหนดการใช้งาน';

  @override
  String get termsSubtitle => 'ดูข้อกำหนดการใช้งานของแอป';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get privacySubtitle => 'เกี่ยวกับการจัดการข้อมูลส่วนบุคคล';

  @override
  String get tutorialTitle => 'บทแนะนำ';

  @override
  String get tutorialSubtitle => 'เรียนรู้วิธีใช้แอป';

  @override
  String get dataManagement => 'การจัดการข้อมูล';

  @override
  String get deleteHistory => 'ลบประวัติ';

  @override
  String get deleteHistorySubtitle =>
      'ลบเฉพาะประวัติการฝึก (คะแนนเป้าหมายจะยังคงอยู่)';

  @override
  String get deleteHistoryAndGoal => 'ลบประวัติและเป้าหมาย';

  @override
  String get deleteHistoryAndGoalSubtitle => 'ลบประวัติทั้งหมดและคะแนนเป้าหมาย';

  @override
  String get deleteHistoryConfirmTitle => 'ลบประวัติ';

  @override
  String get deleteHistoryConfirmMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบประวัติการฝึกทั้งหมด?\n\n*คะแนนเป้าหมายจะยังคงอยู่';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'ลบประวัติและเป้าหมาย';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบประวัติทั้งหมดและคะแนนเป้าหมาย?\n\n*การดำเนินการนี้ไม่สามารถย้อนกลับได้';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get delete => 'ลบ';

  @override
  String get historyDeleted => 'ลบประวัติแล้ว';

  @override
  String get historyAndGoalDeleted => 'ลบประวัติและเป้าหมายแล้ว';

  @override
  String get historyDeleteFailed => 'ลบประวัติไม่สำเร็จ';

  @override
  String get historyAndGoalDeleteFailed => 'ลบประวัติและเป้าหมายไม่สำเร็จ';

  @override
  String get tutorialDisplayFailed => 'แสดงบทแนะนำไม่สำเร็จ';

  @override
  String get tips => 'เคล็ดลับ';

  @override
  String get tipsContent =>
      '• เป้าหมายจะแสดงในกราฟบนหน้าหลัก\n• เริ่มจากเป้าหมายเล็ก ๆ แล้วค่อยเพิ่มตามจังหวะของคุณ\n• การเลือกถูกแต่ละครั้งได้สูงสุด 6 คะแนน';

  @override
  String get backToHome => 'กลับหน้าหลัก';

  @override
  String get tutorialSkip => 'ข้าม';

  @override
  String get tutorialGoalAndPoints => 'เป้าหมายและคะแนนปัจจุบัน';

  @override
  String get tutorialGoalDescription =>
      'วงกลมด้านนอกแสดงเป้าหมาย วงกลมด้านในแสดงคะแนนรวม วงกลมจะเต็มขึ้นเมื่อคุณเข้าใกล้เป้าหมาย';

  @override
  String get tutorialOneMinuteTraining => 'การฝึก 1 นาที';

  @override
  String get tutorialTrainingDescription =>
      'เริ่มเกม 1 นาที เลือกรูปภาพเชิงบวกหรือนิสัยที่ดีจาก 4 ตัวเลือก';

  @override
  String get tutorialScoreProgress => 'ความคืบหน้าของคะแนน';

  @override
  String get tutorialScoreDescription => 'ดูรายละเอียดคะแนนที่คุณได้รับ';

  @override
  String get tutorialSettingsAndData => 'การตั้งค่าและการจัดการข้อมูล';

  @override
  String get tutorialSettingsDescription =>
      'เปลี่ยนเป้าหมาย ดูข้อมูลแอป และรีเซ็ตข้อมูล';

  @override
  String get appIntroAttentionBiasTitle => 'เกี่ยวกับอคติทางความสนใจ';

  @override
  String get appIntroAttentionBiasContent =>
      'เมื่อมีความวิตกกังวลสูง เรามักจะจดจ่ออยู่กับสิ่งเชิงลบโดยไม่รู้ตัว';

  @override
  String get appIntroFocusMintRoleTitle => 'บทบาทของ FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'เกมสั้น ๆ สำหรับฝึกหันความสนใจไปยังภาพเชิงบวก';

  @override
  String get appIntroScientificEvidenceTitle => 'เกี่ยวกับแบบฝึกนี้';

  @override
  String get appIntroScientificEvidenceContent =>
      'ฝึกค้นหาภาพเชิงบวก FocusMint เป็นเครื่องมือดูแลตัวเอง ไม่ใช่การรักษาทางการแพทย์ ผลที่ได้รับแตกต่างกันในแต่ละคน';

  @override
  String get appIntroExpectedEffectsTitle => 'สิ่งที่ฝึกได้';

  @override
  String get appIntroEffect1 => 'ค้นหาภาพเชิงบวก';

  @override
  String get appIntroEffect2 => 'สังเกตรอยยิ้มรอบตัว';

  @override
  String get appIntroEffect3 => 'สร้างกิจวัตรสั้น ๆ ในแต่ละวัน';

  @override
  String get appIntroHowToUse => 'ดูวิธีใช้งาน';

  @override
  String get pointsEarned => 'ได้รับคะแนนแล้ว!';

  @override
  String get yourScore => 'คะแนนของคุณ';

  @override
  String get totalPlayTime => 'เวลาเล่นทั้งหมด';

  @override
  String get imageManagement => 'การจัดการรูปภาพ';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'รูปภาพที่ซ่อน: $count/$max';
  }

  @override
  String get unsavedChanges => 'มีการเปลี่ยนแปลงที่ยังไม่ได้บันทึก';

  @override
  String unsavedChangesMessage(Object count) {
    return 'มีการเปลี่ยนแปลงการตั้งค่าการแสดงรูปภาพ $count รายการที่ยังไม่ได้บันทึก';
  }

  @override
  String get unsavedChangesWarning =>
      'หากปิดหน้านี้ตอนนี้ การเปลี่ยนแปลงจะหายไป';

  @override
  String get discardChanges => 'ละทิ้งการเปลี่ยนแปลง';

  @override
  String get saveAndExit => 'บันทึกและออก';

  @override
  String settingsSaved(Object count) {
    return 'บันทึกการตั้งค่า $count รายการแล้ว';
  }

  @override
  String get saveError => 'เกิดข้อผิดพลาดขณะบันทึกการตั้งค่า';

  @override
  String get imageSettingsUpdated => 'อัปเดตการตั้งค่ารูปภาพแล้ว';

  @override
  String get allImages => 'ทั้งหมด';

  @override
  String get positiveImages => 'เชิงบวก';

  @override
  String get negativeImages => 'เชิงลบ';

  @override
  String get smileImages => 'รอยยิ้ม';

  @override
  String get vegetableImages => 'อาหารที่มีคุณค่าทางโภชนาการ';

  @override
  String get healthImages => 'การเคลื่อนไหวและการพบปะ';

  @override
  String get sadImages => 'โกรธ เศร้า และกังวล';

  @override
  String get badFoodImages => 'อาหารจานด่วนและขนมหวาน';

  @override
  String get badImages => 'พฤติกรรมที่ไม่ดีต่อสุขภาพ';

  @override
  String get imageManagementHint =>
      'แตะเพื่อสลับการแสดง/ซ่อนรูปภาพ ซ่อนได้สูงสุด 15 รูป';

  @override
  String get unsaved => 'ยังไม่ได้บันทึก';

  @override
  String get save => 'บันทึก';

  @override
  String get hiddenImages => 'ซ่อนอยู่';

  @override
  String get noHiddenImages => 'ไม่มีรูปภาพที่ซ่อน';

  @override
  String get settingsLoadFailed => 'โหลดการตั้งค่าไม่สำเร็จ';

  @override
  String imagesAdded(int count) {
    return 'เพิ่มรูปภาพแล้ว $count รูป';
  }

  @override
  String get imageAddFailed => 'เพิ่มรูปภาพไม่สำเร็จ';

  @override
  String get imageSelectionFailed => 'เลือกรูปภาพไม่สำเร็จ';

  @override
  String get settingsChangeFailed => 'เปลี่ยนการตั้งค่าไม่สำเร็จ';

  @override
  String groupTitle(String name) {
    return 'กลุ่ม: $name';
  }

  @override
  String get displayToggle => 'สลับการแสดงผล';

  @override
  String imageCount(int count) {
    return '$count รูป';
  }

  @override
  String get noticeTitle => 'ข้อควรทราบ';

  @override
  String get notice1 => 'เพิ่มฟีเจอร์รูปภาพกำหนดเองแล้ว!';

  @override
  String get notice2 => 'คุณสามารถเพิ่มรูปภาพของตัวเองได้จากหน้าการตั้งค่า';

  @override
  String get notice3 => 'กรุณาดูรายละเอียดที่หน้าการตั้งค่า';

  @override
  String get customImageTitle => 'รูปภาพกำหนดเอง';

  @override
  String get customImageSubtitle => 'เพิ่มและจัดการรูปภาพของคุณเอง';

  @override
  String get addCustomImages => 'เพิ่มรูปภาพกำหนดเอง';

  @override
  String get selectImages => 'เลือกรูปภาพ';

  @override
  String get unknownImage => 'รูปภาพไม่ทราบชื่อ';

  @override
  String get customImageSettings => 'การตั้งค่ารูปภาพกำหนดเอง';

  @override
  String get useCustomImages => 'ใช้รูปภาพกำหนดเอง';

  @override
  String get useCustomImagesDescription =>
      'ใช้ภาพของคุณเองในการฝึก เปิดตัวเลือกผสมด้านล่างเพื่อใช้ภาพในแอปด้วย';

  @override
  String get groupSettings => 'การตั้งค่ากลุ่ม';

  @override
  String get minOneGroupRequired => 'ต้องเปิดใช้งานอย่างน้อยหนึ่งกลุ่ม';

  @override
  String get settingsLoadFailedMessage => 'โหลดการตั้งค่าไม่สำเร็จ';

  @override
  String get customImageNotice1 =>
      'เมื่อเปิดใช้งานกลุ่ม รูปภาพจะแสดงแบบสุ่มตามแต่ละกลุ่ม';

  @override
  String get customImageNotice2 =>
      'รูปภาพที่ผู้ใช้อัปโหลดและตั้งค่าไว้จะไม่ถูกแชร์กับผู้พัฒนาหรือบุคคลที่สาม และจะถูกเก็บไว้เฉพาะในพื้นที่ของแอปบนอุปกรณ์เท่านั้น';

  @override
  String get customImageNotice3 => 'จึงสามารถใช้งานแบบออฟไลน์ได้';

  @override
  String get customImageNotice4 =>
      'การเพิ่มภาพจำนวนมากใช้พื้นที่จัดเก็บ หากพบปัญหา ให้ปิดการใช้ภาพส่วนตัวหรือลบภาพที่ไม่ใช้ในการตั้งค่า';

  @override
  String get customImageNotice5 =>
      'เมื่อลบแอป รูปภาพที่ตั้งค่าไว้จะถูกลบไปด้วย';

  @override
  String get customImageRequirementNotMet =>
      'หากต้องการใช้รูปภาพกำหนดเอง ต้องมีรูปภาพที่ดีอย่างน้อย 1 รูป และรูปภาพที่ไม่ดีอย่างน้อย 3 รูปในกลุ่มที่เปิดใช้งาน';

  @override
  String get customImageRequirement =>
      'หากต้องการใช้รูปภาพกำหนดเอง ต้องมีรูปภาพที่ดีอย่างน้อย 1 รูป และรูปภาพที่ไม่ดีอย่างน้อย 3 รูปในกลุ่มที่เปิดใช้งาน';

  @override
  String get sunnyWeather => 'ดี';

  @override
  String get rainyWeather => 'ไม่ดี';

  @override
  String get addImages => 'เพิ่มรูปภาพ';

  @override
  String get imageDeleted => 'ลบรูปภาพแล้ว';

  @override
  String get imageDeleteFailed => 'ลบรูปภาพไม่สำเร็จ';

  @override
  String get deleteImageTitle => 'ลบรูปภาพ';

  @override
  String get deleteImageMessage =>
      'ต้องการลบรูปภาพนี้หรือไม่? การดำเนินการนี้ไม่สามารถย้อนกลับได้';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'กลุ่ม $groupId รูปภาพ$weather';
  }

  @override
  String registeredCount(int count) {
    return 'ลงทะเบียนแล้ว: $count รูป';
  }

  @override
  String get noImagesRegistered => 'ยังไม่มีรูปภาพที่ลงทะเบียน';

  @override
  String get imagePreview => 'ดูตัวอย่างรูปภาพ';

  @override
  String get close => 'ปิด';

  @override
  String get contactEmailSubject => 'FocusMint - ติดต่อสอบถาม';

  @override
  String get contactEmailBody => 'กรุณาแจ้งความคิดเห็นและข้อสงสัยของคุณ';

  @override
  String get mixWithBuiltInImages => 'ผสมกับภาพในแอป';

  @override
  String get mixWithBuiltInImagesDescription =>
      'ใช้ภาพในแอปและภาพของคุณร่วมกัน';

  @override
  String get supportIntro =>
      'คุยกับผู้พัฒนาโดยไม่เปิดเผยตัวตน ส่งคำถามหรือข้อเสนอแนะได้ คุณส่งได้วันละ 3 ข้อความ และทุกครั้งที่ผู้พัฒนาตอบ จำนวนข้อความที่ส่งได้จะกลับเป็น 3';

  @override
  String get supportReceived =>
      'ได้รับข้อความแล้ว โดยปกติเราจะตอบกลับภายใน 2–3 วัน';

  @override
  String get supportComposer => 'พิมพ์ข้อความ';

  @override
  String get supportSend => 'ส่ง';

  @override
  String get supportRetry => 'ลองอีกครั้ง';

  @override
  String get supportSent => 'ส่งแล้ว';

  @override
  String get supportUnsent => 'ยังไม่ได้ส่ง · บันทึกในอุปกรณ์นี้แล้ว';

  @override
  String get supportAttach => 'แนบภาพ';

  @override
  String get supportRemoveImage => 'นำภาพออก';

  @override
  String get supportImage => 'ไฟล์แนบ';

  @override
  String get supportClear => 'ลบประวัติ';

  @override
  String get supportClearConfirm =>
      'ลบการสนทนานี้หรือไม่? ร่างที่ยังไม่ได้ส่งและประวัติบนเซิร์ฟเวอร์จะถูกลบด้วย การลบจะไม่คืนจำนวนข้อความที่ส่งได้';

  @override
  String get supportQuota =>
      'คุณใช้ครบ 3 ข้อความของวันนี้แล้ว ส่งอีกครั้งได้ในวันพรุ่งนี้หรือหลังจากผู้พัฒนาตอบกลับ';

  @override
  String get supportConnectionError =>
      'เชื่อมต่อไม่ได้ ร่างที่บันทึกไว้ยังไม่ได้ถูกส่ง';

  @override
  String get supportSendError =>
      'ส่งไม่ได้ ข้อความบันทึกอยู่ในอุปกรณ์นี้แล้ว โปรดลองอีกครั้ง';

  @override
  String get supportStorageError => 'บันทึกไม่ได้ โปรดลองอีกครั้ง';

  @override
  String get supportClearError =>
      'ลบประวัติไม่ได้ โปรดตรวจสอบการเชื่อมต่อแล้วลองอีกครั้ง';

  @override
  String get supportImageError =>
      'โหลดภาพไม่ได้ โปรดเลือกภาพที่มีขนาดต่ำกว่า 30 MB';

  @override
  String supportRemaining(int count) {
    return 'จำนวนข้อความที่เหลือวันนี้: $count';
  }

  @override
  String supportUnread(int count) {
    return 'คำตอบที่ยังไม่ได้อ่าน: $count';
  }

  @override
  String get supportGuide => 'ข้อมูล';

  @override
  String get supportDeveloper => 'ผู้พัฒนา';

  @override
  String get supportPrivacy => 'ข้อมูลการติดต่อฝ่ายช่วยเหลือ';

  @override
  String get breathingTitle => 'พักหายใจสักครู่';

  @override
  String get breathingHint =>
      'หายใจตามการเคลื่อนไหวเบา ๆ ของปอด\nในจังหวะที่คุณสบาย';

  @override
  String get breathingIn => 'หายใจเข้าช้า ๆ';

  @override
  String get breathingOut => 'หายใจออกช้า ๆ';

  @override
  String get breathingProgress => 'ความคืบหน้าการฝึกหายใจ';

  @override
  String get breathingResultHint => 'เมื่อจบแล้วจะแสดงผลโดยอัตโนมัติ';

  @override
  String get breathingSkip => 'ข้ามไปดูผล';
}
