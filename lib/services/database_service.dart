import 'dart:io';
import 'dart:math' as math;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:focusmint/models/trial_log.dart' as trial_models;
import 'package:focusmint/models/session_summary.dart' as session_models;
import 'package:focusmint/models/image_stimulus.dart';
import 'package:focusmint/constants/training_constants.dart';

part 'database_service.g.dart';

@DataClassName('TrialLogEntity')
class TrialLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sessionId => text()();
  TextColumn get targetId => text()();
  TextColumn get distractorIds => text()();
  IntColumn get setSize => integer()();
  BoolColumn get correct => boolean()();
  IntColumn get rawRtMs => integer()();
  IntColumn get processedRtMs => integer()();
  IntColumn get difficultyLevel => integer()();
  DateTimeColumn get timestamp => dateTime()();
}

@DataClassName('SessionSummaryEntity')
class SessionSummaries extends Table {
  TextColumn get sessionId => text().withLength(min: 1, max: 50)();
  IntColumn get totalTrials => integer()();
  IntColumn get correctTrials => integer()();
  RealColumn get accuracy => real()();
  IntColumn get medianRtMs => integer()();
  RealColumn get averageRtMs => real()();
  RealColumn get bisScore => real()();
  RealColumn get iesScore => real()();
  IntColumn get displayScore => integer()();
  RealColumn get dynamicPoints => real()();
  IntColumn get maxConsecutiveCorrect => integer()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  IntColumn get sessionDurationSeconds => integer()();
  TextColumn get trialsByDifficultyLevel => text()();

  @override
  Set<Column> get primaryKey => {sessionId};
}

@DriftDatabase(tables: [TrialLogs, SessionSummaries])
class AppDatabase extends _$AppDatabase {
  static final Logger _logger = Logger();
  static AppDatabase? _instance;
  
  AppDatabase._internal() : super(_openConnection());
  
  factory AppDatabase() {
    _instance ??= AppDatabase._internal();
    return _instance!;
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      _logger.i('Database created with schema version $schemaVersion');
    },
    onUpgrade: (Migrator m, int from, int to) async {
      _logger.i('Database migration from version $from to $to');
      if (from < 2) {
        // Add dynamicPoints column with default value 0.0
        await customStatement('ALTER TABLE "session_summaries" ADD COLUMN "dynamic_points" REAL NOT NULL DEFAULT 0.0;');
      }
    },
  );

  // Trial operations
  Future<int> insertTrial(trial_models.TrialLog trial) async {
    try {
      final companion = TrialLogsCompanion.insert(
        sessionId: trial.sessionId,
        targetId: trial.targetId,
        distractorIds: trial.distractorIds.join(','),
        setSize: trial.setSize,
        correct: trial.correct,
        rawRtMs: trial.rawRtMs,
        processedRtMs: trial.processedRtMs,
        difficultyLevel: trial.difficultyLevel,
        timestamp: trial.timestamp,
      );

      final id = await into(trialLogs).insert(companion);
      _logger.d('Inserted trial with id $id for session ${trial.sessionId}');
      return id;
    } catch (e) {
      _logger.e('Failed to insert trial: $e');
      rethrow;
    }
  }

  Future<List<trial_models.TrialLog>> getTrialsForSession(String sessionId) async {
    try {
      final query = select(trialLogs)..where((tbl) => tbl.sessionId.equals(sessionId));
      final entities = await query.get();
      
      return entities.map(_convertTrialEntityToModel).toList();
    } catch (e) {
      _logger.e('Failed to get trials for session $sessionId: $e');
      return [];
    }
  }

  Future<List<trial_models.TrialLog>> getAllTrials() async {
    try {
      final entities = await select(trialLogs).get();
      return entities.map(_convertTrialEntityToModel).toList();
    } catch (e) {
      _logger.e('Failed to get all trials: $e');
      return [];
    }
  }

  // Session operations
  Future<void> insertOrUpdateSessionSummary(session_models.SessionSummary summary) async {
    try {
      final companion = SessionSummariesCompanion.insert(
        sessionId: summary.sessionId,
        totalTrials: summary.totalTrials,
        correctTrials: summary.correctTrials,
        accuracy: summary.accuracy,
        medianRtMs: summary.medianRtMs,
        averageRtMs: summary.averageRtMs,
        bisScore: summary.bisScore,
        iesScore: summary.iesScore,
        displayScore: summary.displayScore,
        dynamicPoints: summary.dynamicPoints,
        maxConsecutiveCorrect: summary.maxConsecutiveCorrect,
        startTime: summary.startTime,
        endTime: summary.endTime,
        sessionDurationSeconds: summary.sessionDurationSeconds,
        trialsByDifficultyLevel: _encodeIntMap(summary.trialsByDifficultyLevel),
      );

      await into(sessionSummaries).insertOnConflictUpdate(companion);
      _logger.i('Inserted/updated session summary for ${summary.sessionId}');
    } catch (e) {
      _logger.e('Failed to insert/update session summary: $e');
      rethrow;
    }
  }

  Future<session_models.SessionSummary?> getSessionSummary(String sessionId) async {
    try {
      final query = select(sessionSummaries)
        ..where((tbl) => tbl.sessionId.equals(sessionId));
      
      final entity = await query.getSingleOrNull();
      return entity != null ? _convertSessionEntityToModel(entity) : null;
    } catch (e) {
      _logger.e('Failed to get session summary for $sessionId: $e');
      return null;
    }
  }

  Future<List<session_models.SessionSummary>> getAllSessionSummaries({
    int? limit,
    bool orderByDescending = true,
  }) async {
    try {
      var query = select(sessionSummaries);
      
      if (orderByDescending) {
        query = query..orderBy([(tbl) => OrderingTerm(expression: tbl.startTime, mode: OrderingMode.desc)]);
      } else {
        query = query..orderBy([(tbl) => OrderingTerm(expression: tbl.startTime, mode: OrderingMode.asc)]);
      }
      
      if (limit != null) {
        query = query..limit(limit);
      }

      final entities = await query.get();
      return entities.map(_convertSessionEntityToModel).toList();
    } catch (e) {
      _logger.e('Failed to get session summaries: $e');
      return [];
    }
  }

  Future<List<session_models.SessionSummary>> getRecentSessionSummaries(int count) async {
    return await getAllSessionSummaries(limit: count, orderByDescending: true);
  }

  // Statistics and analytics
  
  /// ベストスコア（dynamicPoints）を取得する
  Future<double> getBestScore() async {
    try {
      final query = select(sessionSummaries);
      final sessions = await query.get();
      
      if (sessions.isEmpty) return 0.0;
      
      final bestScore = sessions
          .map((s) => s.dynamicPoints)
          .reduce((a, b) => math.max(a, b));
      
      _logger.d('Best score retrieved: ${bestScore.toStringAsFixed(2)}');
      return bestScore;
    } catch (e) {
      _logger.e('Failed to get best score', error: e);
      return 0.0;
    }
  }
  
  /// トータル学習時間（秒）を取得する
  Future<int> getTotalTrainingTimeSeconds() async {
    try {
      final query = select(sessionSummaries);
      final sessions = await query.get();
      
      if (sessions.isEmpty) return 0;
      
      final totalSeconds = sessions
          .map((s) => s.sessionDurationSeconds)
          .reduce((a, b) => a + b);
      
      _logger.d('Total training time: $totalSeconds seconds (${(totalSeconds / 60).toStringAsFixed(1)} minutes)');
      return totalSeconds;
    } catch (e) {
      _logger.e('Failed to get total training time', error: e);
      return 0;
    }
  }
  
  /// トータル学習時間（分）を取得する
  Future<double> getTotalTrainingTimeMinutes() async {
    final seconds = await getTotalTrainingTimeSeconds();
    return seconds / 60.0;
  }
  
  /// セッション数を取得する
  Future<int> getTotalSessionCount() async {
    try {
      final countQuery = select(sessionSummaries);
      final sessions = await countQuery.get();
      
      final count = sessions.length;
      _logger.d('Total session count: $count');
      return count;
    } catch (e) {
      _logger.e('Failed to get total session count', error: e);
      return 0;
    }
  }

  Future<Map<String, double>> calculateHistoricalStats() async {
    try {
      final sessions = await getAllSessionSummaries();
      
      if (sessions.isEmpty) {
        return {
          'meanAccuracy': 0.0,
          'stdAccuracy': 0.0,
          'meanRt': 0.0,
          'stdRt': 0.0,
        };
      }

      final accuracies = sessions.map((s) => s.accuracy).toList();
      final rts = sessions.map((s) => s.medianRtMs.toDouble()).toList();

      return {
        'meanAccuracy': _calculateMean(accuracies),
        'stdAccuracy': _calculateStdDev(accuracies),
        'meanRt': _calculateMean(rts),
        'stdRt': _calculateStdDev(rts),
      };
    } catch (e) {
      _logger.e('Failed to calculate historical stats: $e');
      return {
        'meanAccuracy': 0.0,
        'stdAccuracy': 0.0,
        'meanRt': 0.0,
        'stdRt': 0.0,
      };
    }
  }

  // Cleanup operations
  Future<void> cleanupOldSessions() async {
    try {
      final allSessions = await getAllSessionSummaries(orderByDescending: true);
      
      if (allSessions.length <= TrainingConstants.maxSessionsToRetain) {
        return;
      }

      final sessionsToDelete = allSessions.skip(TrainingConstants.maxSessionsToRetain);
      final sessionIdsToDelete = sessionsToDelete.map((s) => s.sessionId).toList();

      // Delete trials first (foreign key constraint)
      await (delete(trialLogs)..where((tbl) => tbl.sessionId.isIn(sessionIdsToDelete))).go();
      
      // Delete session summaries
      await (delete(sessionSummaries)..where((tbl) => tbl.sessionId.isIn(sessionIdsToDelete))).go();

      _logger.i('Cleaned up ${sessionIdsToDelete.length} old sessions');
    } catch (e) {
      _logger.e('Failed to cleanup old sessions: $e');
    }
  }

  // Helper methods
  trial_models.TrialLog _convertTrialEntityToModel(TrialLogEntity entity) {
    return trial_models.TrialLog(
      id: entity.id,
      sessionId: entity.sessionId,
      targetId: entity.targetId,
      distractorIds: entity.distractorIds.split(','),
      setSize: entity.setSize,
      correct: entity.correct,
      rawRtMs: entity.rawRtMs,
      processedRtMs: entity.processedRtMs,
      difficultyLevel: entity.difficultyLevel,
      timestamp: entity.timestamp,
      targetStimulus: _createPlaceholderStimulus(entity.targetId, true),
      distractorStimuli: entity.distractorIds.split(',')
          .map((id) => _createPlaceholderStimulus(id, false))
          .toList(),
    );
  }

  session_models.SessionSummary _convertSessionEntityToModel(SessionSummaryEntity entity) {
    return session_models.SessionSummary(
      sessionId: entity.sessionId,
      totalTrials: entity.totalTrials,
      correctTrials: entity.correctTrials,
      accuracy: entity.accuracy,
      medianRtMs: entity.medianRtMs,
      averageRtMs: entity.averageRtMs,
      bisScore: entity.bisScore,
      iesScore: entity.iesScore,
      displayScore: entity.displayScore,
      dynamicPoints: entity.dynamicPoints,
      maxConsecutiveCorrect: entity.maxConsecutiveCorrect,
      startTime: entity.startTime,
      endTime: entity.endTime,
      sessionDurationSeconds: entity.sessionDurationSeconds,
      trialsByDifficultyLevel: _decodeIntMap(entity.trialsByDifficultyLevel),
    );
  }

  ImageStimulus _createPlaceholderStimulus(String id, bool isPositive) {
    return ImageStimulus(
      id: id,
      assetPath: 'assets/images/placeholders/$id.png',
      valence: isPositive ? Valence.positive : Valence.negative,
      emotion: isPositive ? Emotion.happiness : Emotion.anger,
    );
  }

  String _encodeIntMap(Map<int, int> map) {
    return map.entries.map((e) => '${e.key}:${e.value}').join(',');
  }

  Map<int, int> _decodeIntMap(String encoded) {
    if (encoded.isEmpty) return {};
    
    try {
      final Map<int, int> result = {};
      for (final pair in encoded.split(',')) {
        final parts = pair.split(':');
        if (parts.length == 2) {
          result[int.parse(parts[0])] = int.parse(parts[1]);
        }
      }
      return result;
    } catch (e) {
      _logger.e('Failed to decode int map: $encoded, error: $e');
      return {};
    }
  }

  double _calculateMean(List<double> values) {
    if (values.isEmpty) return 0.0;
    return values.reduce((a, b) => a + b) / values.length;
  }

  double _calculateStdDev(List<double> values) {
    if (values.length <= 1) return 0.0;
    
    final mean = _calculateMean(values);
    final sumSquaredDifferences = values
        .map((value) => (value - mean) * (value - mean))
        .reduce((a, b) => a + b);
    
    return math.sqrt(sumSquaredDifferences / (values.length - 1));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'focusmint_db.sqlite'));
    
    return NativeDatabase.createInBackground(file);
  });
}

// DatabaseService wrapper class
class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static DatabaseService get instance => _instance;
  
  final AppDatabase _database = AppDatabase();
  static final Logger _logger = Logger();
  
  DatabaseService._internal();

  Future<void> clearAllData() async {
    try {
      await _database.delete(_database.trialLogs).go();
      await _database.delete(_database.sessionSummaries).go();
      
      _logger.i('All data cleared from database');
    } catch (e, stackTrace) {
      _logger.e('Failed to clear all data', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

// Riverpod Provider for AppDatabase
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});