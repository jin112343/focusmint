import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusmint/pages/result_page.dart';
import 'package:focusmint/constants/app_colors.dart';
import 'package:focusmint/services/image_service.dart';
import 'package:focusmint/services/speed_score_service.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/widgets/stimulus_grid.dart';
import 'package:focusmint/widgets/point_earned_overlay.dart';

class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({super.key});

  @override
  ConsumerState<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends ConsumerState<TrainingPage> {
  bool _isMuted = false;
  int _elapsedSeconds = 0;
  double _currentPoints = 0.0;
  late final ImageService _imageService;
  late final SpeedScoreService _speedScoreService;
  List<ImageStimulus> _currentStimuli = [];
  Timer? _timer;
  bool _showingPointOverlay = false;
  double _lastEarnedPoints = 0.0;
  bool _lastWasCorrect = false;
  static const int maxTrainingTimeSeconds = 60; // 1分 = 60秒
  
  @override
  void initState() {
    super.initState();
    _imageService = ImageService();
    _speedScoreService = SpeedScoreService();
    _generateNewStimuliSet();
    _startTimer();
  }
  
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
      
      // 1分経過で結果画面に遷移
      if (_elapsedSeconds >= maxTrainingTimeSeconds) {
        timer.cancel();
        _saveSessionData().then((_) {
          _navigateToResult();
        });
      }
    });
  }
  
  void _generateNewStimuliSet() async {
    final randomGroup = _imageService.getRandomGroup();
    final stimuli = await _imageService.getRandomStimuliSet(randomGroup);
    setState(() {
      _currentStimuli = stimuli;
    });
    // 新しい刺激が表示されたときに反応時間の測定を開始
    _speedScoreService.startStimulus();
  }

  Future<void> _saveSessionData() async {
    await _speedScoreService.saveBestScore(_currentPoints);
    await _speedScoreService.addTotalTime(_elapsedSeconds);
    await _speedScoreService.addTotalScore(_currentPoints);
  }

  void _navigateToResult() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResultPage(currentScore: _currentPoints),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    // アプリが予期せず終了する場合に備えてデータを保存
    if (_elapsedSeconds > 0) {
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
            _timer?.cancel();
            await _saveSessionData();
            if (mounted) {
              Navigator.of(context).pop();
            }
          },
        ),
        title: const Text('フォーカス・ミント'),
        actions: [
          IconButton(
            icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
            onPressed: () => setState(() => _isMuted = !_isMuted),
          ),
        ],
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
                          onStimulusSelected: _onStimulusSelected,
                          showPlaceholders: false, // 実際の画像を表示
                        )
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 16),
                              Text('画像を準備中...'),
                            ],
                          ),
                        ),
            ),
          ),
          // フッター情報バー
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
              border: Border(
                top: BorderSide(
                  color: AppColors.textDisabled,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '経過時間: ${_elapsedSeconds ~/ 60}分${_elapsedSeconds % 60}秒',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'スコア: ${_currentPoints.toStringAsFixed(2)} ポイント',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onStimulusSelected(String stimulusId) {
    // 現在の刺激リストから選択された画像を見つける
    final selectedStimulus = _currentStimuli.firstWhere(
      (stimulus) => stimulus.id == stimulusId,
      orElse: () => throw Exception('Selected stimulus not found'),
    );
    
    // 良い画像（positive）が選択されたかチェック
    final isCorrect = selectedStimulus.valence == Valence.positive;
    // スピードベースのスコア計算を使用
    final pointsToAdd = _speedScoreService.calculateScore(isCorrect);
    
    // ポイント獲得画面を表示
    setState(() {
      _currentPoints += pointsToAdd;
      _showingPointOverlay = true;
      _lastEarnedPoints = pointsToAdd;
      _lastWasCorrect = isCorrect;
    });
    
    // ポイントオーバーレイの完了はコールバックで処理
  }

  void _onPointOverlayComplete() {
    if (mounted) {
      setState(() {
        _showingPointOverlay = false;
      });
      _generateNewStimuliSet();
    }
  }
}