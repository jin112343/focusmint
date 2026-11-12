import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusmint/pages/breathing_page.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/image_service.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/widgets/stimulus_grid.dart';
import 'package:focusmint/widgets/point_earned_overlay.dart';
import 'package:focusmint/l10n/app_localizations.dart';

class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({super.key});

  @override
  ConsumerState<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends ConsumerState<TrainingPage> {
  int _remainingSeconds = 60;
  double _currentPoints = 0.0;
  late final ImageService _imageService;
  late final SpeedScoreService _speedScoreService;
  List<ImageStimulus> _currentStimuli = [];
  Timer? _timer;
  Timer? _selectionTimer;
  Future<void>? _sessionSave;
  bool _sessionEnded = false;
  bool _imageLoadFailed = false;
  bool _showingPointOverlay = false;
  double _lastEarnedPoints = 0.0;
  bool _lastWasCorrect = false;
  String? _selectedStimulusId; // 選択されたボタンのID
  bool _gameInputLocked = false; // ゲーム入力のロック状態
  static const int maxTrainingTimeSeconds = 60; // 1分 = 60秒

  @override
  void initState() {
    super.initState();
    _imageService = ImageService();
    _imageService.refreshCache();
    _speedScoreService = SpeedScoreService();
    _generateNewStimuliSet();
  }

  void _startTimer() {
    if (_timer != null || _sessionEnded) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;
      });

      // 成績を保存してから呼吸ガイドへ進み、その後で結果を表示する。
      if (_remainingSeconds <= 0) {
        timer.cancel();
        _sessionEnded = true;
        _selectionTimer?.cancel();
        _saveSessionData().then((_) {
          _navigateToBreathing();
        });
      }
    });
  }

  void _generateNewStimuliSet() async {
    final randomGroup = _imageService.getRandomGroup();
    final stimuli = await _imageService.getRandomStimuliSet(randomGroup);
    if (!mounted || _sessionEnded) return;
    setState(() {
      _currentStimuli = stimuli.length == 4 ? stimuli : [];
      _imageLoadFailed = stimuli.length != 4;
      _gameInputLocked = _imageLoadFailed;
    });
    if (_imageLoadFailed) return;
    _startTimer();
    // 新しい刺激が表示されたときに反応時間の測定を開始
    _speedScoreService.startStimulus();
  }

  Future<void> _saveSessionData() => _sessionSave ??= _persistSessionData();

  Future<void> _persistSessionData() async {
    final elapsedSeconds = maxTrainingTimeSeconds - _remainingSeconds;
    await _speedScoreService.saveBestScore(_currentPoints);
    await _speedScoreService.addTotalTime(elapsedSeconds);
    await _speedScoreService.addTotalScore(_currentPoints);
  }

  void _navigateToBreathing() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BreathingPage(currentScore: _currentPoints),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _selectionTimer?.cancel();
    _sessionEnded = true;
    // アプリが予期せず終了する場合に備えてデータを保存
    if (_remainingSeconds < maxTrainingTimeSeconds || _currentPoints > 0) {
      _saveSessionData();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            if (_sessionEnded) return;
            _sessionEnded = true;
            _timer?.cancel();
            _selectionTimer?.cancel();
            await _saveSessionData();
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text(AppLocalizations.of(context)!.focusMintTitle),
      ),
      body: Column(
        children: [
          // メイン画像グリッド（2x2）またはポイント獲得画面
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: _showingPointOverlay
                  ? PointEarnedOverlay(
                      points: _lastEarnedPoints,
                      isCorrect: _lastWasCorrect,
                      onComplete: _onPointOverlayComplete,
                    )
                  : _currentStimuli.isNotEmpty
                  ? StimulusGrid(
                      stimuli: _currentStimuli,
                      onStimulusSelected: _gameInputLocked
                          ? null
                          : _onStimulusSelected, // 入力ロック時はnullを渡す
                      showPlaceholders: false, // 実際の画像を表示
                      selectedStimulusId: _selectedStimulusId, // 選択状態を渡す
                      inputLocked: _gameInputLocked, // 入力ロック状態を渡す
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!_imageLoadFailed)
                            const CircularProgressIndicator(),
                          const SizedBox(height: 16),
                          Text(
                            _imageLoadFailed
                                ? AppLocalizations.of(context)!
                                      .noStimuliAvailable
                                : AppLocalizations.of(context)!
                                      .imagePreparationMessage,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          // フッター情報バー
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
                border: Border(
                  top: BorderSide(color: AppColors.textDisabled, width: 0.5),
                ),
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 16,
                runSpacing: 8,
                children: [
                  Text(
                    _remainingSeconds >= 60
                        ? AppLocalizations.of(context)!.remainingTimeMinutes(
                            _remainingSeconds ~/ 60,
                            _remainingSeconds % 60,
                          )
                        : AppLocalizations.of(context)!
                              .remainingTimeSeconds(_remainingSeconds),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .scoreLabel(_currentPoints.toStringAsFixed(2)),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onStimulusSelected(String stimulusId) {
    // 入力がロックされている場合は何もしない
    if (_gameInputLocked || _sessionEnded) {
      return;
    }

    // 最初のボタンが押された時点で入力をロック
    setState(() {
      _gameInputLocked = true;
    });

    // 現在の刺激リストから選択された画像を見つける
    final selectedStimulus = _currentStimuli.firstWhere(
      (stimulus) => stimulus.id == stimulusId,
      orElse: () => throw Exception('Selected stimulus not found'),
    );

    // 良い画像（positive）が選択されたかチェック
    final isCorrect = selectedStimulus.valence == Valence.positive;
    // スピードベースのスコア計算を使用
    final pointsToAdd = _speedScoreService.calculateScore(isCorrect);

    // まず選択されたボタンを緑色にする
    setState(() {
      _selectedStimulusId = stimulusId;
      // タップの時点で確定し、終了直前の回答も保存する。
      _currentPoints += pointsToAdd;
    });

    // 短時間待ってからポイント獲得画面を表示
    _selectionTimer = Timer(const Duration(milliseconds: 150), () {
      if (mounted && !_sessionEnded) {
        setState(() {
          _showingPointOverlay = true;
          _lastEarnedPoints = pointsToAdd;
          _lastWasCorrect = isCorrect;
          _selectedStimulusId = null; // 選択状態をリセット
        });
      }
    });
  }

  void _onPointOverlayComplete() {
    if (mounted && !_sessionEnded) {
      setState(() {
        _showingPointOverlay = false;
      });
      _generateNewStimuliSet();
    }
  }
}
