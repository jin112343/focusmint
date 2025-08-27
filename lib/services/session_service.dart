import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/models/trial_log.dart' as models;
import 'package:focusmint/constants/training_constants.dart';
import 'package:focusmint/constants/placeholder_images.dart';
import 'package:focusmint/services/difficulty_manager.dart';
import 'package:focusmint/services/score_calculator.dart';
import 'package:focusmint/services/database_service.dart';

enum SessionState {
  idle,
  preparing,
  fixation,
  stimulus,
  interTrial,
  completed,
  aborted,
}

class SessionService extends StateNotifier<SessionState> {
  static final Logger _logger = Logger();
  
  final AppDatabase _database;
  final Random _random = Random();
  
  String _sessionId = '';
  DateTime _sessionStartTime = DateTime.now();
  DateTime _sessionEndTime = DateTime.now();
  
  late DifficultyManager _difficultyManager;
  
  Timer? _sessionTimer;
  Timer? _trialTimer;
  int _remainingTimeMs = TrainingConstants.sessionDurationSeconds * 1000;
  
  final List<models.TrialLog> _trials = [];
  int _trialCount = 0;
  int _currentTrialId = 0;
  
  List<ImageStimulus> _currentStimuli = [];
  ImageStimulus? _currentTarget;
  List<ImageStimulus> _currentDistractors = [];
  DateTime? _trialStartTime;
  
  SessionService(this._database) : super(SessionState.idle) {
    _difficultyManager = DifficultyManager();
  }

  // Getters
  String get sessionId => _sessionId;
  int get remainingTimeMs => _remainingTimeMs;
  int get remainingTimeSeconds => (_remainingTimeMs / 1000).ceil();
  int get trialCount => _trialCount;
  List<ImageStimulus> get currentStimuli => _currentStimuli;
  ImageStimulus? get currentTarget => _currentTarget;
  DifficultyManager get difficultyManager => _difficultyManager;
  double get sessionProgressPercent => 
      1.0 - (_remainingTimeMs / (TrainingConstants.sessionDurationSeconds * 1000));

  // Session lifecycle
  Future<void> startSession() async {
    if (state != SessionState.idle) {
      _logger.w('Attempted to start session but state is $state');
      return;
    }

    try {
      _sessionId = _generateSessionId();
      _sessionStartTime = DateTime.now();
      _remainingTimeMs = TrainingConstants.sessionDurationSeconds * 1000;
      _trials.clear();
      _trialCount = 0;
      _currentTrialId = 0;
      
      _difficultyManager.reset();
      
      _logger.i('Starting training session $_sessionId');
      
      state = SessionState.preparing;
      
      // Start session timer
      _startSessionTimer();
      
      // Start first trial
      await _startNextTrial();
      
    } catch (e) {
      _logger.e('Failed to start session: $e');
      await abortSession();
    }
  }

  Future<void> abortSession() async {
    _logger.i('Aborting session $_sessionId');
    
    _cancelTimers();
    
    if (_trials.isNotEmpty) {
      // Save incomplete session
      _sessionEndTime = DateTime.now();
      await _saveSession();
    }
    
    state = SessionState.aborted;
  }

  Future<void> _completeSession() async {
    _logger.i('Completing session $_sessionId with ${_trials.length} trials');
    
    _cancelTimers();
    _sessionEndTime = DateTime.now();
    
    await _saveSession();
    
    state = SessionState.completed;
  }

  // Trial management
  Future<void> _startNextTrial() async {
    if (state == SessionState.aborted || _remainingTimeMs <= 0) {
      await _completeSession();
      return;
    }

    _trialCount++;
    _currentTrialId++;
    
    state = SessionState.fixation;
    
    // Generate trial stimuli
    _generateTrialStimuli();
    
    // Show fixation point
    final fixationDuration = _getFixationDuration();
    _trialTimer = Timer(Duration(milliseconds: fixationDuration), () {
      _presentStimulus();
    });
  }

  void _presentStimulus() {
    if (state == SessionState.aborted) return;
    
    state = SessionState.stimulus;
    _trialStartTime = DateTime.now();
    
    // Set stimulus presentation timeout
    final stimulusTimeout = _difficultyManager.stimulusTimeLimit;
    _trialTimer = Timer(Duration(milliseconds: stimulusTimeout), () {
      _handleTrialTimeout();
    });
  }

  Future<void> handleStimulusSelection(String stimulusId) async {
    if (state != SessionState.stimulus || _trialStartTime == null) {
      return;
    }

    _trialTimer?.cancel();
    
    final reactionTime = DateTime.now().difference(_trialStartTime!).inMilliseconds;
    final correct = stimulusId == _currentTarget?.id;
    
    await _recordTrial(correct, reactionTime);
    await _endTrial();
  }

  Future<void> _handleTrialTimeout() async {
    if (state != SessionState.stimulus) return;
    
    _logger.d('Trial $_currentTrialId timed out');
    
    final reactionTime = _difficultyManager.stimulusTimeLimit;
    await _recordTrial(false, reactionTime);
    await _endTrial();
  }

  Future<void> _recordTrial(bool correct, int reactionTimeMs) async {
    try {
      final processedRt = ScoreCalculator.processRt(
        rawRtMs: reactionTimeMs,
        correct: correct,
      );

      final trial = models.TrialLog(
        id: _currentTrialId,
        sessionId: _sessionId,
        targetId: _currentTarget!.id,
        distractorIds: _currentDistractors.map((d) => d.id).toList(),
        setSize: _difficultyManager.gridSize,
        correct: correct,
        rawRtMs: reactionTimeMs,
        processedRtMs: processedRt,
        difficultyLevel: _difficultyManager.currentLevel.index,
        timestamp: DateTime.now(),
        targetStimulus: _currentTarget!,
        distractorStimuli: _currentDistractors,
      );

      _trials.add(trial);
      
      // Save trial to database
      await _database.insertTrial(trial);
      
      // Update difficulty
      _difficultyManager.recordTrialResult(correct);
      
      _logger.d('Trial $_currentTrialId recorded: correct=$correct, rt=${reactionTimeMs}ms, '
                'processed=${processedRt}ms, level=${_difficultyManager.currentLevel.label}');
      
    } catch (e) {
      _logger.e('Failed to record trial: $e');
    }
  }

  Future<void> _endTrial() async {
    state = SessionState.interTrial;
    
    // Inter-trial interval
    final itiDuration = _getInterTrialInterval();
    _trialTimer = Timer(Duration(milliseconds: itiDuration), () {
      _startNextTrial();
    });
  }

  // Stimulus generation
  void _generateTrialStimuli() {
    final gridSize = _difficultyManager.gridSize;
    final distractorCount = _difficultyManager.distractorCount;
    
    // Select target (always positive)
    final positiveStimuli = _getPositiveStimuli();
    _currentTarget = positiveStimuli[_random.nextInt(positiveStimuli.length)];
    
    // Select distractors (always negative)
    final negativeStimuli = _getNegativeStimuli();
    _currentDistractors = [];
    
    for (int i = 0; i < distractorCount; i++) {
      final distractor = negativeStimuli[_random.nextInt(negativeStimuli.length)];
      _currentDistractors.add(distractor);
    }
    
    // Combine and shuffle
    _currentStimuli = [_currentTarget!, ..._currentDistractors];
    _currentStimuli.shuffle(_random);
    
    _logger.d('Generated trial stimuli: grid=$gridSize, target=${_currentTarget!.id}, '
              'distractors=${_currentDistractors.map((d) => d.id).join(',')}');
  }

  List<ImageStimulus> _getPositiveStimuli() {
    return PlaceholderImages.positiveImages.map((filename) {
      return ImageStimulus(
        id: filename.replaceAll('.png', ''),
        assetPath: '${PlaceholderImages.facesPath}$filename',
        valence: Valence.positive,
        emotion: Emotion.happiness,
      );
    }).toList();
  }

  List<ImageStimulus> _getNegativeStimuli() {
    return PlaceholderImages.negativeImages.map((filename) {
      return ImageStimulus(
        id: filename.replaceAll('.png', ''),
        assetPath: '${PlaceholderImages.facesPath}$filename',
        valence: Valence.negative,
        emotion: filename.contains('angry') ? Emotion.anger :
               filename.contains('fear') ? Emotion.fear : Emotion.sadness,
      );
    }).toList();
  }

  // Timing helpers
  int _getFixationDuration() {
    return TrainingConstants.fixationPointMinMs + 
           _random.nextInt(TrainingConstants.fixationPointMaxMs - 
                          TrainingConstants.fixationPointMinMs);
  }

  int _getInterTrialInterval() {
    return TrainingConstants.interTrialIntervalMinMs + 
           _random.nextInt(TrainingConstants.interTrialIntervalMaxMs - 
                          TrainingConstants.interTrialIntervalMinMs);
  }

  // Session timer
  void _startSessionTimer() {
    _sessionTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _remainingTimeMs -= 100;
      
      if (_remainingTimeMs <= 0) {
        _completeSession();
        timer.cancel();
      }
    });
  }

  void _cancelTimers() {
    _sessionTimer?.cancel();
    _sessionTimer = null;
    _trialTimer?.cancel();
    _trialTimer = null;
  }

  // Data persistence
  Future<void> _saveSession() async {
    try {
      if (_trials.isEmpty) {
        _logger.w('No trials to save for session $_sessionId');
        return;
      }

      // Calculate historical stats for BIS normalization
      final historicalStats = await _database.calculateHistoricalStats();
      
      final sessionSummary = ScoreCalculator.calculateSessionSummary(
        sessionId: _sessionId,
        trials: _trials,
        startTime: _sessionStartTime,
        endTime: _sessionEndTime,
        referenceMeanAccuracy: historicalStats['meanAccuracy'],
        referenceStdAccuracy: historicalStats['stdAccuracy'],
        referenceMeanRt: historicalStats['meanRt'],
        referenceStdRt: historicalStats['stdRt'],
      );

      await _database.insertOrUpdateSessionSummary(sessionSummary);
      
      // Cleanup old sessions
      await _database.cleanupOldSessions();
      
      _logger.i('Session $_sessionId saved with ${_trials.length} trials, '
                'score: ${sessionSummary.displayScore}');
      
    } catch (e) {
      _logger.e('Failed to save session: $e');
    }
  }

  String _generateSessionId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = _random.nextInt(1000).toString().padLeft(3, '0');
    return 'session_${timestamp}_$random';
  }

  // Cleanup
  @override
  void dispose() {
    _cancelTimers();
    super.dispose();
  }
}

// Provider
final sessionServiceProvider = StateNotifierProvider<SessionService, SessionState>((ref) {
  final database = ref.watch(databaseProvider);
  return SessionService(database);
});