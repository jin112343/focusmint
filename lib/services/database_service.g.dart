// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_service.dart';

// ignore_for_file: type=lint
class $TrialLogsTable extends TrialLogs
    with TableInfo<$TrialLogsTable, TrialLogEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrialLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetIdMeta = const VerificationMeta(
    'targetId',
  );
  @override
  late final GeneratedColumn<String> targetId = GeneratedColumn<String>(
    'target_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distractorIdsMeta = const VerificationMeta(
    'distractorIds',
  );
  @override
  late final GeneratedColumn<String> distractorIds = GeneratedColumn<String>(
    'distractor_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setSizeMeta = const VerificationMeta(
    'setSize',
  );
  @override
  late final GeneratedColumn<int> setSize = GeneratedColumn<int>(
    'set_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctMeta = const VerificationMeta(
    'correct',
  );
  @override
  late final GeneratedColumn<bool> correct = GeneratedColumn<bool>(
    'correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _rawRtMsMeta = const VerificationMeta(
    'rawRtMs',
  );
  @override
  late final GeneratedColumn<int> rawRtMs = GeneratedColumn<int>(
    'raw_rt_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _processedRtMsMeta = const VerificationMeta(
    'processedRtMs',
  );
  @override
  late final GeneratedColumn<int> processedRtMs = GeneratedColumn<int>(
    'processed_rt_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyLevelMeta = const VerificationMeta(
    'difficultyLevel',
  );
  @override
  late final GeneratedColumn<int> difficultyLevel = GeneratedColumn<int>(
    'difficulty_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    targetId,
    distractorIds,
    setSize,
    correct,
    rawRtMs,
    processedRtMs,
    difficultyLevel,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trial_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrialLogEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('target_id')) {
      context.handle(
        _targetIdMeta,
        targetId.isAcceptableOrUnknown(data['target_id']!, _targetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_targetIdMeta);
    }
    if (data.containsKey('distractor_ids')) {
      context.handle(
        _distractorIdsMeta,
        distractorIds.isAcceptableOrUnknown(
          data['distractor_ids']!,
          _distractorIdsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distractorIdsMeta);
    }
    if (data.containsKey('set_size')) {
      context.handle(
        _setSizeMeta,
        setSize.isAcceptableOrUnknown(data['set_size']!, _setSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_setSizeMeta);
    }
    if (data.containsKey('correct')) {
      context.handle(
        _correctMeta,
        correct.isAcceptableOrUnknown(data['correct']!, _correctMeta),
      );
    } else if (isInserting) {
      context.missing(_correctMeta);
    }
    if (data.containsKey('raw_rt_ms')) {
      context.handle(
        _rawRtMsMeta,
        rawRtMs.isAcceptableOrUnknown(data['raw_rt_ms']!, _rawRtMsMeta),
      );
    } else if (isInserting) {
      context.missing(_rawRtMsMeta);
    }
    if (data.containsKey('processed_rt_ms')) {
      context.handle(
        _processedRtMsMeta,
        processedRtMs.isAcceptableOrUnknown(
          data['processed_rt_ms']!,
          _processedRtMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_processedRtMsMeta);
    }
    if (data.containsKey('difficulty_level')) {
      context.handle(
        _difficultyLevelMeta,
        difficultyLevel.isAcceptableOrUnknown(
          data['difficulty_level']!,
          _difficultyLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_difficultyLevelMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrialLogEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrialLogEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      targetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_id'],
      )!,
      distractorIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}distractor_ids'],
      )!,
      setSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_size'],
      )!,
      correct: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}correct'],
      )!,
      rawRtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}raw_rt_ms'],
      )!,
      processedRtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}processed_rt_ms'],
      )!,
      difficultyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}difficulty_level'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $TrialLogsTable createAlias(String alias) {
    return $TrialLogsTable(attachedDatabase, alias);
  }
}

class TrialLogEntity extends DataClass implements Insertable<TrialLogEntity> {
  final int id;
  final String sessionId;
  final String targetId;
  final String distractorIds;
  final int setSize;
  final bool correct;
  final int rawRtMs;
  final int processedRtMs;
  final int difficultyLevel;
  final DateTime timestamp;
  const TrialLogEntity({
    required this.id,
    required this.sessionId,
    required this.targetId,
    required this.distractorIds,
    required this.setSize,
    required this.correct,
    required this.rawRtMs,
    required this.processedRtMs,
    required this.difficultyLevel,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['target_id'] = Variable<String>(targetId);
    map['distractor_ids'] = Variable<String>(distractorIds);
    map['set_size'] = Variable<int>(setSize);
    map['correct'] = Variable<bool>(correct);
    map['raw_rt_ms'] = Variable<int>(rawRtMs);
    map['processed_rt_ms'] = Variable<int>(processedRtMs);
    map['difficulty_level'] = Variable<int>(difficultyLevel);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  TrialLogsCompanion toCompanion(bool nullToAbsent) {
    return TrialLogsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      targetId: Value(targetId),
      distractorIds: Value(distractorIds),
      setSize: Value(setSize),
      correct: Value(correct),
      rawRtMs: Value(rawRtMs),
      processedRtMs: Value(processedRtMs),
      difficultyLevel: Value(difficultyLevel),
      timestamp: Value(timestamp),
    );
  }

  factory TrialLogEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrialLogEntity(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      targetId: serializer.fromJson<String>(json['targetId']),
      distractorIds: serializer.fromJson<String>(json['distractorIds']),
      setSize: serializer.fromJson<int>(json['setSize']),
      correct: serializer.fromJson<bool>(json['correct']),
      rawRtMs: serializer.fromJson<int>(json['rawRtMs']),
      processedRtMs: serializer.fromJson<int>(json['processedRtMs']),
      difficultyLevel: serializer.fromJson<int>(json['difficultyLevel']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'targetId': serializer.toJson<String>(targetId),
      'distractorIds': serializer.toJson<String>(distractorIds),
      'setSize': serializer.toJson<int>(setSize),
      'correct': serializer.toJson<bool>(correct),
      'rawRtMs': serializer.toJson<int>(rawRtMs),
      'processedRtMs': serializer.toJson<int>(processedRtMs),
      'difficultyLevel': serializer.toJson<int>(difficultyLevel),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  TrialLogEntity copyWith({
    int? id,
    String? sessionId,
    String? targetId,
    String? distractorIds,
    int? setSize,
    bool? correct,
    int? rawRtMs,
    int? processedRtMs,
    int? difficultyLevel,
    DateTime? timestamp,
  }) => TrialLogEntity(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    targetId: targetId ?? this.targetId,
    distractorIds: distractorIds ?? this.distractorIds,
    setSize: setSize ?? this.setSize,
    correct: correct ?? this.correct,
    rawRtMs: rawRtMs ?? this.rawRtMs,
    processedRtMs: processedRtMs ?? this.processedRtMs,
    difficultyLevel: difficultyLevel ?? this.difficultyLevel,
    timestamp: timestamp ?? this.timestamp,
  );
  TrialLogEntity copyWithCompanion(TrialLogsCompanion data) {
    return TrialLogEntity(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      targetId: data.targetId.present ? data.targetId.value : this.targetId,
      distractorIds: data.distractorIds.present
          ? data.distractorIds.value
          : this.distractorIds,
      setSize: data.setSize.present ? data.setSize.value : this.setSize,
      correct: data.correct.present ? data.correct.value : this.correct,
      rawRtMs: data.rawRtMs.present ? data.rawRtMs.value : this.rawRtMs,
      processedRtMs: data.processedRtMs.present
          ? data.processedRtMs.value
          : this.processedRtMs,
      difficultyLevel: data.difficultyLevel.present
          ? data.difficultyLevel.value
          : this.difficultyLevel,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrialLogEntity(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('targetId: $targetId, ')
          ..write('distractorIds: $distractorIds, ')
          ..write('setSize: $setSize, ')
          ..write('correct: $correct, ')
          ..write('rawRtMs: $rawRtMs, ')
          ..write('processedRtMs: $processedRtMs, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    targetId,
    distractorIds,
    setSize,
    correct,
    rawRtMs,
    processedRtMs,
    difficultyLevel,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrialLogEntity &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.targetId == this.targetId &&
          other.distractorIds == this.distractorIds &&
          other.setSize == this.setSize &&
          other.correct == this.correct &&
          other.rawRtMs == this.rawRtMs &&
          other.processedRtMs == this.processedRtMs &&
          other.difficultyLevel == this.difficultyLevel &&
          other.timestamp == this.timestamp);
}

class TrialLogsCompanion extends UpdateCompanion<TrialLogEntity> {
  final Value<int> id;
  final Value<String> sessionId;
  final Value<String> targetId;
  final Value<String> distractorIds;
  final Value<int> setSize;
  final Value<bool> correct;
  final Value<int> rawRtMs;
  final Value<int> processedRtMs;
  final Value<int> difficultyLevel;
  final Value<DateTime> timestamp;
  const TrialLogsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.targetId = const Value.absent(),
    this.distractorIds = const Value.absent(),
    this.setSize = const Value.absent(),
    this.correct = const Value.absent(),
    this.rawRtMs = const Value.absent(),
    this.processedRtMs = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  TrialLogsCompanion.insert({
    this.id = const Value.absent(),
    required String sessionId,
    required String targetId,
    required String distractorIds,
    required int setSize,
    required bool correct,
    required int rawRtMs,
    required int processedRtMs,
    required int difficultyLevel,
    required DateTime timestamp,
  }) : sessionId = Value(sessionId),
       targetId = Value(targetId),
       distractorIds = Value(distractorIds),
       setSize = Value(setSize),
       correct = Value(correct),
       rawRtMs = Value(rawRtMs),
       processedRtMs = Value(processedRtMs),
       difficultyLevel = Value(difficultyLevel),
       timestamp = Value(timestamp);
  static Insertable<TrialLogEntity> custom({
    Expression<int>? id,
    Expression<String>? sessionId,
    Expression<String>? targetId,
    Expression<String>? distractorIds,
    Expression<int>? setSize,
    Expression<bool>? correct,
    Expression<int>? rawRtMs,
    Expression<int>? processedRtMs,
    Expression<int>? difficultyLevel,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (targetId != null) 'target_id': targetId,
      if (distractorIds != null) 'distractor_ids': distractorIds,
      if (setSize != null) 'set_size': setSize,
      if (correct != null) 'correct': correct,
      if (rawRtMs != null) 'raw_rt_ms': rawRtMs,
      if (processedRtMs != null) 'processed_rt_ms': processedRtMs,
      if (difficultyLevel != null) 'difficulty_level': difficultyLevel,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  TrialLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? sessionId,
    Value<String>? targetId,
    Value<String>? distractorIds,
    Value<int>? setSize,
    Value<bool>? correct,
    Value<int>? rawRtMs,
    Value<int>? processedRtMs,
    Value<int>? difficultyLevel,
    Value<DateTime>? timestamp,
  }) {
    return TrialLogsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      targetId: targetId ?? this.targetId,
      distractorIds: distractorIds ?? this.distractorIds,
      setSize: setSize ?? this.setSize,
      correct: correct ?? this.correct,
      rawRtMs: rawRtMs ?? this.rawRtMs,
      processedRtMs: processedRtMs ?? this.processedRtMs,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (targetId.present) {
      map['target_id'] = Variable<String>(targetId.value);
    }
    if (distractorIds.present) {
      map['distractor_ids'] = Variable<String>(distractorIds.value);
    }
    if (setSize.present) {
      map['set_size'] = Variable<int>(setSize.value);
    }
    if (correct.present) {
      map['correct'] = Variable<bool>(correct.value);
    }
    if (rawRtMs.present) {
      map['raw_rt_ms'] = Variable<int>(rawRtMs.value);
    }
    if (processedRtMs.present) {
      map['processed_rt_ms'] = Variable<int>(processedRtMs.value);
    }
    if (difficultyLevel.present) {
      map['difficulty_level'] = Variable<int>(difficultyLevel.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrialLogsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('targetId: $targetId, ')
          ..write('distractorIds: $distractorIds, ')
          ..write('setSize: $setSize, ')
          ..write('correct: $correct, ')
          ..write('rawRtMs: $rawRtMs, ')
          ..write('processedRtMs: $processedRtMs, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $SessionSummariesTable extends SessionSummaries
    with TableInfo<$SessionSummariesTable, SessionSummaryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionSummariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalTrialsMeta = const VerificationMeta(
    'totalTrials',
  );
  @override
  late final GeneratedColumn<int> totalTrials = GeneratedColumn<int>(
    'total_trials',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctTrialsMeta = const VerificationMeta(
    'correctTrials',
  );
  @override
  late final GeneratedColumn<int> correctTrials = GeneratedColumn<int>(
    'correct_trials',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accuracyMeta = const VerificationMeta(
    'accuracy',
  );
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
    'accuracy',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medianRtMsMeta = const VerificationMeta(
    'medianRtMs',
  );
  @override
  late final GeneratedColumn<int> medianRtMs = GeneratedColumn<int>(
    'median_rt_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _averageRtMsMeta = const VerificationMeta(
    'averageRtMs',
  );
  @override
  late final GeneratedColumn<double> averageRtMs = GeneratedColumn<double>(
    'average_rt_ms',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bisScoreMeta = const VerificationMeta(
    'bisScore',
  );
  @override
  late final GeneratedColumn<double> bisScore = GeneratedColumn<double>(
    'bis_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iesScoreMeta = const VerificationMeta(
    'iesScore',
  );
  @override
  late final GeneratedColumn<double> iesScore = GeneratedColumn<double>(
    'ies_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayScoreMeta = const VerificationMeta(
    'displayScore',
  );
  @override
  late final GeneratedColumn<int> displayScore = GeneratedColumn<int>(
    'display_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dynamicPointsMeta = const VerificationMeta(
    'dynamicPoints',
  );
  @override
  late final GeneratedColumn<double> dynamicPoints = GeneratedColumn<double>(
    'dynamic_points',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxConsecutiveCorrectMeta =
      const VerificationMeta('maxConsecutiveCorrect');
  @override
  late final GeneratedColumn<int> maxConsecutiveCorrect = GeneratedColumn<int>(
    'max_consecutive_correct',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionDurationSecondsMeta =
      const VerificationMeta('sessionDurationSeconds');
  @override
  late final GeneratedColumn<int> sessionDurationSeconds = GeneratedColumn<int>(
    'session_duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trialsByDifficultyLevelMeta =
      const VerificationMeta('trialsByDifficultyLevel');
  @override
  late final GeneratedColumn<String> trialsByDifficultyLevel =
      GeneratedColumn<String>(
        'trials_by_difficulty_level',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    sessionId,
    totalTrials,
    correctTrials,
    accuracy,
    medianRtMs,
    averageRtMs,
    bisScore,
    iesScore,
    displayScore,
    dynamicPoints,
    maxConsecutiveCorrect,
    startTime,
    endTime,
    sessionDurationSeconds,
    trialsByDifficultyLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_summaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionSummaryEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('total_trials')) {
      context.handle(
        _totalTrialsMeta,
        totalTrials.isAcceptableOrUnknown(
          data['total_trials']!,
          _totalTrialsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalTrialsMeta);
    }
    if (data.containsKey('correct_trials')) {
      context.handle(
        _correctTrialsMeta,
        correctTrials.isAcceptableOrUnknown(
          data['correct_trials']!,
          _correctTrialsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctTrialsMeta);
    }
    if (data.containsKey('accuracy')) {
      context.handle(
        _accuracyMeta,
        accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta),
      );
    } else if (isInserting) {
      context.missing(_accuracyMeta);
    }
    if (data.containsKey('median_rt_ms')) {
      context.handle(
        _medianRtMsMeta,
        medianRtMs.isAcceptableOrUnknown(
          data['median_rt_ms']!,
          _medianRtMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medianRtMsMeta);
    }
    if (data.containsKey('average_rt_ms')) {
      context.handle(
        _averageRtMsMeta,
        averageRtMs.isAcceptableOrUnknown(
          data['average_rt_ms']!,
          _averageRtMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_averageRtMsMeta);
    }
    if (data.containsKey('bis_score')) {
      context.handle(
        _bisScoreMeta,
        bisScore.isAcceptableOrUnknown(data['bis_score']!, _bisScoreMeta),
      );
    } else if (isInserting) {
      context.missing(_bisScoreMeta);
    }
    if (data.containsKey('ies_score')) {
      context.handle(
        _iesScoreMeta,
        iesScore.isAcceptableOrUnknown(data['ies_score']!, _iesScoreMeta),
      );
    } else if (isInserting) {
      context.missing(_iesScoreMeta);
    }
    if (data.containsKey('display_score')) {
      context.handle(
        _displayScoreMeta,
        displayScore.isAcceptableOrUnknown(
          data['display_score']!,
          _displayScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayScoreMeta);
    }
    if (data.containsKey('dynamic_points')) {
      context.handle(
        _dynamicPointsMeta,
        dynamicPoints.isAcceptableOrUnknown(
          data['dynamic_points']!,
          _dynamicPointsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dynamicPointsMeta);
    }
    if (data.containsKey('max_consecutive_correct')) {
      context.handle(
        _maxConsecutiveCorrectMeta,
        maxConsecutiveCorrect.isAcceptableOrUnknown(
          data['max_consecutive_correct']!,
          _maxConsecutiveCorrectMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maxConsecutiveCorrectMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('session_duration_seconds')) {
      context.handle(
        _sessionDurationSecondsMeta,
        sessionDurationSeconds.isAcceptableOrUnknown(
          data['session_duration_seconds']!,
          _sessionDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionDurationSecondsMeta);
    }
    if (data.containsKey('trials_by_difficulty_level')) {
      context.handle(
        _trialsByDifficultyLevelMeta,
        trialsByDifficultyLevel.isAcceptableOrUnknown(
          data['trials_by_difficulty_level']!,
          _trialsByDifficultyLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trialsByDifficultyLevelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  SessionSummaryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionSummaryEntity(
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      totalTrials: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_trials'],
      )!,
      correctTrials: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}correct_trials'],
      )!,
      accuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy'],
      )!,
      medianRtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}median_rt_ms'],
      )!,
      averageRtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}average_rt_ms'],
      )!,
      bisScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bis_score'],
      )!,
      iesScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ies_score'],
      )!,
      displayScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_score'],
      )!,
      dynamicPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dynamic_points'],
      )!,
      maxConsecutiveCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_consecutive_correct'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      )!,
      sessionDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_duration_seconds'],
      )!,
      trialsByDifficultyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trials_by_difficulty_level'],
      )!,
    );
  }

  @override
  $SessionSummariesTable createAlias(String alias) {
    return $SessionSummariesTable(attachedDatabase, alias);
  }
}

class SessionSummaryEntity extends DataClass
    implements Insertable<SessionSummaryEntity> {
  final String sessionId;
  final int totalTrials;
  final int correctTrials;
  final double accuracy;
  final int medianRtMs;
  final double averageRtMs;
  final double bisScore;
  final double iesScore;
  final int displayScore;
  final double dynamicPoints;
  final int maxConsecutiveCorrect;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionDurationSeconds;
  final String trialsByDifficultyLevel;
  const SessionSummaryEntity({
    required this.sessionId,
    required this.totalTrials,
    required this.correctTrials,
    required this.accuracy,
    required this.medianRtMs,
    required this.averageRtMs,
    required this.bisScore,
    required this.iesScore,
    required this.displayScore,
    required this.dynamicPoints,
    required this.maxConsecutiveCorrect,
    required this.startTime,
    required this.endTime,
    required this.sessionDurationSeconds,
    required this.trialsByDifficultyLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    map['total_trials'] = Variable<int>(totalTrials);
    map['correct_trials'] = Variable<int>(correctTrials);
    map['accuracy'] = Variable<double>(accuracy);
    map['median_rt_ms'] = Variable<int>(medianRtMs);
    map['average_rt_ms'] = Variable<double>(averageRtMs);
    map['bis_score'] = Variable<double>(bisScore);
    map['ies_score'] = Variable<double>(iesScore);
    map['display_score'] = Variable<int>(displayScore);
    map['dynamic_points'] = Variable<double>(dynamicPoints);
    map['max_consecutive_correct'] = Variable<int>(maxConsecutiveCorrect);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['session_duration_seconds'] = Variable<int>(sessionDurationSeconds);
    map['trials_by_difficulty_level'] = Variable<String>(
      trialsByDifficultyLevel,
    );
    return map;
  }

  SessionSummariesCompanion toCompanion(bool nullToAbsent) {
    return SessionSummariesCompanion(
      sessionId: Value(sessionId),
      totalTrials: Value(totalTrials),
      correctTrials: Value(correctTrials),
      accuracy: Value(accuracy),
      medianRtMs: Value(medianRtMs),
      averageRtMs: Value(averageRtMs),
      bisScore: Value(bisScore),
      iesScore: Value(iesScore),
      displayScore: Value(displayScore),
      dynamicPoints: Value(dynamicPoints),
      maxConsecutiveCorrect: Value(maxConsecutiveCorrect),
      startTime: Value(startTime),
      endTime: Value(endTime),
      sessionDurationSeconds: Value(sessionDurationSeconds),
      trialsByDifficultyLevel: Value(trialsByDifficultyLevel),
    );
  }

  factory SessionSummaryEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionSummaryEntity(
      sessionId: serializer.fromJson<String>(json['sessionId']),
      totalTrials: serializer.fromJson<int>(json['totalTrials']),
      correctTrials: serializer.fromJson<int>(json['correctTrials']),
      accuracy: serializer.fromJson<double>(json['accuracy']),
      medianRtMs: serializer.fromJson<int>(json['medianRtMs']),
      averageRtMs: serializer.fromJson<double>(json['averageRtMs']),
      bisScore: serializer.fromJson<double>(json['bisScore']),
      iesScore: serializer.fromJson<double>(json['iesScore']),
      displayScore: serializer.fromJson<int>(json['displayScore']),
      dynamicPoints: serializer.fromJson<double>(json['dynamicPoints']),
      maxConsecutiveCorrect: serializer.fromJson<int>(
        json['maxConsecutiveCorrect'],
      ),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      sessionDurationSeconds: serializer.fromJson<int>(
        json['sessionDurationSeconds'],
      ),
      trialsByDifficultyLevel: serializer.fromJson<String>(
        json['trialsByDifficultyLevel'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<String>(sessionId),
      'totalTrials': serializer.toJson<int>(totalTrials),
      'correctTrials': serializer.toJson<int>(correctTrials),
      'accuracy': serializer.toJson<double>(accuracy),
      'medianRtMs': serializer.toJson<int>(medianRtMs),
      'averageRtMs': serializer.toJson<double>(averageRtMs),
      'bisScore': serializer.toJson<double>(bisScore),
      'iesScore': serializer.toJson<double>(iesScore),
      'displayScore': serializer.toJson<int>(displayScore),
      'dynamicPoints': serializer.toJson<double>(dynamicPoints),
      'maxConsecutiveCorrect': serializer.toJson<int>(maxConsecutiveCorrect),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'sessionDurationSeconds': serializer.toJson<int>(sessionDurationSeconds),
      'trialsByDifficultyLevel': serializer.toJson<String>(
        trialsByDifficultyLevel,
      ),
    };
  }

  SessionSummaryEntity copyWith({
    String? sessionId,
    int? totalTrials,
    int? correctTrials,
    double? accuracy,
    int? medianRtMs,
    double? averageRtMs,
    double? bisScore,
    double? iesScore,
    int? displayScore,
    double? dynamicPoints,
    int? maxConsecutiveCorrect,
    DateTime? startTime,
    DateTime? endTime,
    int? sessionDurationSeconds,
    String? trialsByDifficultyLevel,
  }) => SessionSummaryEntity(
    sessionId: sessionId ?? this.sessionId,
    totalTrials: totalTrials ?? this.totalTrials,
    correctTrials: correctTrials ?? this.correctTrials,
    accuracy: accuracy ?? this.accuracy,
    medianRtMs: medianRtMs ?? this.medianRtMs,
    averageRtMs: averageRtMs ?? this.averageRtMs,
    bisScore: bisScore ?? this.bisScore,
    iesScore: iesScore ?? this.iesScore,
    displayScore: displayScore ?? this.displayScore,
    dynamicPoints: dynamicPoints ?? this.dynamicPoints,
    maxConsecutiveCorrect: maxConsecutiveCorrect ?? this.maxConsecutiveCorrect,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    sessionDurationSeconds:
        sessionDurationSeconds ?? this.sessionDurationSeconds,
    trialsByDifficultyLevel:
        trialsByDifficultyLevel ?? this.trialsByDifficultyLevel,
  );
  SessionSummaryEntity copyWithCompanion(SessionSummariesCompanion data) {
    return SessionSummaryEntity(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      totalTrials: data.totalTrials.present
          ? data.totalTrials.value
          : this.totalTrials,
      correctTrials: data.correctTrials.present
          ? data.correctTrials.value
          : this.correctTrials,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      medianRtMs: data.medianRtMs.present
          ? data.medianRtMs.value
          : this.medianRtMs,
      averageRtMs: data.averageRtMs.present
          ? data.averageRtMs.value
          : this.averageRtMs,
      bisScore: data.bisScore.present ? data.bisScore.value : this.bisScore,
      iesScore: data.iesScore.present ? data.iesScore.value : this.iesScore,
      displayScore: data.displayScore.present
          ? data.displayScore.value
          : this.displayScore,
      dynamicPoints: data.dynamicPoints.present
          ? data.dynamicPoints.value
          : this.dynamicPoints,
      maxConsecutiveCorrect: data.maxConsecutiveCorrect.present
          ? data.maxConsecutiveCorrect.value
          : this.maxConsecutiveCorrect,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      sessionDurationSeconds: data.sessionDurationSeconds.present
          ? data.sessionDurationSeconds.value
          : this.sessionDurationSeconds,
      trialsByDifficultyLevel: data.trialsByDifficultyLevel.present
          ? data.trialsByDifficultyLevel.value
          : this.trialsByDifficultyLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionSummaryEntity(')
          ..write('sessionId: $sessionId, ')
          ..write('totalTrials: $totalTrials, ')
          ..write('correctTrials: $correctTrials, ')
          ..write('accuracy: $accuracy, ')
          ..write('medianRtMs: $medianRtMs, ')
          ..write('averageRtMs: $averageRtMs, ')
          ..write('bisScore: $bisScore, ')
          ..write('iesScore: $iesScore, ')
          ..write('displayScore: $displayScore, ')
          ..write('dynamicPoints: $dynamicPoints, ')
          ..write('maxConsecutiveCorrect: $maxConsecutiveCorrect, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('sessionDurationSeconds: $sessionDurationSeconds, ')
          ..write('trialsByDifficultyLevel: $trialsByDifficultyLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sessionId,
    totalTrials,
    correctTrials,
    accuracy,
    medianRtMs,
    averageRtMs,
    bisScore,
    iesScore,
    displayScore,
    dynamicPoints,
    maxConsecutiveCorrect,
    startTime,
    endTime,
    sessionDurationSeconds,
    trialsByDifficultyLevel,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionSummaryEntity &&
          other.sessionId == this.sessionId &&
          other.totalTrials == this.totalTrials &&
          other.correctTrials == this.correctTrials &&
          other.accuracy == this.accuracy &&
          other.medianRtMs == this.medianRtMs &&
          other.averageRtMs == this.averageRtMs &&
          other.bisScore == this.bisScore &&
          other.iesScore == this.iesScore &&
          other.displayScore == this.displayScore &&
          other.dynamicPoints == this.dynamicPoints &&
          other.maxConsecutiveCorrect == this.maxConsecutiveCorrect &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.sessionDurationSeconds == this.sessionDurationSeconds &&
          other.trialsByDifficultyLevel == this.trialsByDifficultyLevel);
}

class SessionSummariesCompanion extends UpdateCompanion<SessionSummaryEntity> {
  final Value<String> sessionId;
  final Value<int> totalTrials;
  final Value<int> correctTrials;
  final Value<double> accuracy;
  final Value<int> medianRtMs;
  final Value<double> averageRtMs;
  final Value<double> bisScore;
  final Value<double> iesScore;
  final Value<int> displayScore;
  final Value<double> dynamicPoints;
  final Value<int> maxConsecutiveCorrect;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<int> sessionDurationSeconds;
  final Value<String> trialsByDifficultyLevel;
  final Value<int> rowid;
  const SessionSummariesCompanion({
    this.sessionId = const Value.absent(),
    this.totalTrials = const Value.absent(),
    this.correctTrials = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.medianRtMs = const Value.absent(),
    this.averageRtMs = const Value.absent(),
    this.bisScore = const Value.absent(),
    this.iesScore = const Value.absent(),
    this.displayScore = const Value.absent(),
    this.dynamicPoints = const Value.absent(),
    this.maxConsecutiveCorrect = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.sessionDurationSeconds = const Value.absent(),
    this.trialsByDifficultyLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionSummariesCompanion.insert({
    required String sessionId,
    required int totalTrials,
    required int correctTrials,
    required double accuracy,
    required int medianRtMs,
    required double averageRtMs,
    required double bisScore,
    required double iesScore,
    required int displayScore,
    required double dynamicPoints,
    required int maxConsecutiveCorrect,
    required DateTime startTime,
    required DateTime endTime,
    required int sessionDurationSeconds,
    required String trialsByDifficultyLevel,
    this.rowid = const Value.absent(),
  }) : sessionId = Value(sessionId),
       totalTrials = Value(totalTrials),
       correctTrials = Value(correctTrials),
       accuracy = Value(accuracy),
       medianRtMs = Value(medianRtMs),
       averageRtMs = Value(averageRtMs),
       bisScore = Value(bisScore),
       iesScore = Value(iesScore),
       displayScore = Value(displayScore),
       dynamicPoints = Value(dynamicPoints),
       maxConsecutiveCorrect = Value(maxConsecutiveCorrect),
       startTime = Value(startTime),
       endTime = Value(endTime),
       sessionDurationSeconds = Value(sessionDurationSeconds),
       trialsByDifficultyLevel = Value(trialsByDifficultyLevel);
  static Insertable<SessionSummaryEntity> custom({
    Expression<String>? sessionId,
    Expression<int>? totalTrials,
    Expression<int>? correctTrials,
    Expression<double>? accuracy,
    Expression<int>? medianRtMs,
    Expression<double>? averageRtMs,
    Expression<double>? bisScore,
    Expression<double>? iesScore,
    Expression<int>? displayScore,
    Expression<double>? dynamicPoints,
    Expression<int>? maxConsecutiveCorrect,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? sessionDurationSeconds,
    Expression<String>? trialsByDifficultyLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (totalTrials != null) 'total_trials': totalTrials,
      if (correctTrials != null) 'correct_trials': correctTrials,
      if (accuracy != null) 'accuracy': accuracy,
      if (medianRtMs != null) 'median_rt_ms': medianRtMs,
      if (averageRtMs != null) 'average_rt_ms': averageRtMs,
      if (bisScore != null) 'bis_score': bisScore,
      if (iesScore != null) 'ies_score': iesScore,
      if (displayScore != null) 'display_score': displayScore,
      if (dynamicPoints != null) 'dynamic_points': dynamicPoints,
      if (maxConsecutiveCorrect != null)
        'max_consecutive_correct': maxConsecutiveCorrect,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (sessionDurationSeconds != null)
        'session_duration_seconds': sessionDurationSeconds,
      if (trialsByDifficultyLevel != null)
        'trials_by_difficulty_level': trialsByDifficultyLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionSummariesCompanion copyWith({
    Value<String>? sessionId,
    Value<int>? totalTrials,
    Value<int>? correctTrials,
    Value<double>? accuracy,
    Value<int>? medianRtMs,
    Value<double>? averageRtMs,
    Value<double>? bisScore,
    Value<double>? iesScore,
    Value<int>? displayScore,
    Value<double>? dynamicPoints,
    Value<int>? maxConsecutiveCorrect,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<int>? sessionDurationSeconds,
    Value<String>? trialsByDifficultyLevel,
    Value<int>? rowid,
  }) {
    return SessionSummariesCompanion(
      sessionId: sessionId ?? this.sessionId,
      totalTrials: totalTrials ?? this.totalTrials,
      correctTrials: correctTrials ?? this.correctTrials,
      accuracy: accuracy ?? this.accuracy,
      medianRtMs: medianRtMs ?? this.medianRtMs,
      averageRtMs: averageRtMs ?? this.averageRtMs,
      bisScore: bisScore ?? this.bisScore,
      iesScore: iesScore ?? this.iesScore,
      displayScore: displayScore ?? this.displayScore,
      dynamicPoints: dynamicPoints ?? this.dynamicPoints,
      maxConsecutiveCorrect:
          maxConsecutiveCorrect ?? this.maxConsecutiveCorrect,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      sessionDurationSeconds:
          sessionDurationSeconds ?? this.sessionDurationSeconds,
      trialsByDifficultyLevel:
          trialsByDifficultyLevel ?? this.trialsByDifficultyLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (totalTrials.present) {
      map['total_trials'] = Variable<int>(totalTrials.value);
    }
    if (correctTrials.present) {
      map['correct_trials'] = Variable<int>(correctTrials.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (medianRtMs.present) {
      map['median_rt_ms'] = Variable<int>(medianRtMs.value);
    }
    if (averageRtMs.present) {
      map['average_rt_ms'] = Variable<double>(averageRtMs.value);
    }
    if (bisScore.present) {
      map['bis_score'] = Variable<double>(bisScore.value);
    }
    if (iesScore.present) {
      map['ies_score'] = Variable<double>(iesScore.value);
    }
    if (displayScore.present) {
      map['display_score'] = Variable<int>(displayScore.value);
    }
    if (dynamicPoints.present) {
      map['dynamic_points'] = Variable<double>(dynamicPoints.value);
    }
    if (maxConsecutiveCorrect.present) {
      map['max_consecutive_correct'] = Variable<int>(
        maxConsecutiveCorrect.value,
      );
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (sessionDurationSeconds.present) {
      map['session_duration_seconds'] = Variable<int>(
        sessionDurationSeconds.value,
      );
    }
    if (trialsByDifficultyLevel.present) {
      map['trials_by_difficulty_level'] = Variable<String>(
        trialsByDifficultyLevel.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionSummariesCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('totalTrials: $totalTrials, ')
          ..write('correctTrials: $correctTrials, ')
          ..write('accuracy: $accuracy, ')
          ..write('medianRtMs: $medianRtMs, ')
          ..write('averageRtMs: $averageRtMs, ')
          ..write('bisScore: $bisScore, ')
          ..write('iesScore: $iesScore, ')
          ..write('displayScore: $displayScore, ')
          ..write('dynamicPoints: $dynamicPoints, ')
          ..write('maxConsecutiveCorrect: $maxConsecutiveCorrect, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('sessionDurationSeconds: $sessionDurationSeconds, ')
          ..write('trialsByDifficultyLevel: $trialsByDifficultyLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TrialLogsTable trialLogs = $TrialLogsTable(this);
  late final $SessionSummariesTable sessionSummaries = $SessionSummariesTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    trialLogs,
    sessionSummaries,
  ];
}

typedef $$TrialLogsTableCreateCompanionBuilder =
    TrialLogsCompanion Function({
      Value<int> id,
      required String sessionId,
      required String targetId,
      required String distractorIds,
      required int setSize,
      required bool correct,
      required int rawRtMs,
      required int processedRtMs,
      required int difficultyLevel,
      required DateTime timestamp,
    });
typedef $$TrialLogsTableUpdateCompanionBuilder =
    TrialLogsCompanion Function({
      Value<int> id,
      Value<String> sessionId,
      Value<String> targetId,
      Value<String> distractorIds,
      Value<int> setSize,
      Value<bool> correct,
      Value<int> rawRtMs,
      Value<int> processedRtMs,
      Value<int> difficultyLevel,
      Value<DateTime> timestamp,
    });

class $$TrialLogsTableFilterComposer
    extends Composer<_$AppDatabase, $TrialLogsTable> {
  $$TrialLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get distractorIds => $composableBuilder(
    column: $table.distractorIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setSize => $composableBuilder(
    column: $table.setSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rawRtMs => $composableBuilder(
    column: $table.rawRtMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get processedRtMs => $composableBuilder(
    column: $table.processedRtMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrialLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $TrialLogsTable> {
  $$TrialLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetId => $composableBuilder(
    column: $table.targetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distractorIds => $composableBuilder(
    column: $table.distractorIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setSize => $composableBuilder(
    column: $table.setSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get correct => $composableBuilder(
    column: $table.correct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rawRtMs => $composableBuilder(
    column: $table.rawRtMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get processedRtMs => $composableBuilder(
    column: $table.processedRtMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrialLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrialLogsTable> {
  $$TrialLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get targetId =>
      $composableBuilder(column: $table.targetId, builder: (column) => column);

  GeneratedColumn<String> get distractorIds => $composableBuilder(
    column: $table.distractorIds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get setSize =>
      $composableBuilder(column: $table.setSize, builder: (column) => column);

  GeneratedColumn<bool> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  GeneratedColumn<int> get rawRtMs =>
      $composableBuilder(column: $table.rawRtMs, builder: (column) => column);

  GeneratedColumn<int> get processedRtMs => $composableBuilder(
    column: $table.processedRtMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get difficultyLevel => $composableBuilder(
    column: $table.difficultyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$TrialLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrialLogsTable,
          TrialLogEntity,
          $$TrialLogsTableFilterComposer,
          $$TrialLogsTableOrderingComposer,
          $$TrialLogsTableAnnotationComposer,
          $$TrialLogsTableCreateCompanionBuilder,
          $$TrialLogsTableUpdateCompanionBuilder,
          (
            TrialLogEntity,
            BaseReferences<_$AppDatabase, $TrialLogsTable, TrialLogEntity>,
          ),
          TrialLogEntity,
          PrefetchHooks Function()
        > {
  $$TrialLogsTableTableManager(_$AppDatabase db, $TrialLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrialLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrialLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrialLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> targetId = const Value.absent(),
                Value<String> distractorIds = const Value.absent(),
                Value<int> setSize = const Value.absent(),
                Value<bool> correct = const Value.absent(),
                Value<int> rawRtMs = const Value.absent(),
                Value<int> processedRtMs = const Value.absent(),
                Value<int> difficultyLevel = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => TrialLogsCompanion(
                id: id,
                sessionId: sessionId,
                targetId: targetId,
                distractorIds: distractorIds,
                setSize: setSize,
                correct: correct,
                rawRtMs: rawRtMs,
                processedRtMs: processedRtMs,
                difficultyLevel: difficultyLevel,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sessionId,
                required String targetId,
                required String distractorIds,
                required int setSize,
                required bool correct,
                required int rawRtMs,
                required int processedRtMs,
                required int difficultyLevel,
                required DateTime timestamp,
              }) => TrialLogsCompanion.insert(
                id: id,
                sessionId: sessionId,
                targetId: targetId,
                distractorIds: distractorIds,
                setSize: setSize,
                correct: correct,
                rawRtMs: rawRtMs,
                processedRtMs: processedRtMs,
                difficultyLevel: difficultyLevel,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrialLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrialLogsTable,
      TrialLogEntity,
      $$TrialLogsTableFilterComposer,
      $$TrialLogsTableOrderingComposer,
      $$TrialLogsTableAnnotationComposer,
      $$TrialLogsTableCreateCompanionBuilder,
      $$TrialLogsTableUpdateCompanionBuilder,
      (
        TrialLogEntity,
        BaseReferences<_$AppDatabase, $TrialLogsTable, TrialLogEntity>,
      ),
      TrialLogEntity,
      PrefetchHooks Function()
    >;
typedef $$SessionSummariesTableCreateCompanionBuilder =
    SessionSummariesCompanion Function({
      required String sessionId,
      required int totalTrials,
      required int correctTrials,
      required double accuracy,
      required int medianRtMs,
      required double averageRtMs,
      required double bisScore,
      required double iesScore,
      required int displayScore,
      required double dynamicPoints,
      required int maxConsecutiveCorrect,
      required DateTime startTime,
      required DateTime endTime,
      required int sessionDurationSeconds,
      required String trialsByDifficultyLevel,
      Value<int> rowid,
    });
typedef $$SessionSummariesTableUpdateCompanionBuilder =
    SessionSummariesCompanion Function({
      Value<String> sessionId,
      Value<int> totalTrials,
      Value<int> correctTrials,
      Value<double> accuracy,
      Value<int> medianRtMs,
      Value<double> averageRtMs,
      Value<double> bisScore,
      Value<double> iesScore,
      Value<int> displayScore,
      Value<double> dynamicPoints,
      Value<int> maxConsecutiveCorrect,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<int> sessionDurationSeconds,
      Value<String> trialsByDifficultyLevel,
      Value<int> rowid,
    });

class $$SessionSummariesTableFilterComposer
    extends Composer<_$AppDatabase, $SessionSummariesTable> {
  $$SessionSummariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalTrials => $composableBuilder(
    column: $table.totalTrials,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get correctTrials => $composableBuilder(
    column: $table.correctTrials,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get medianRtMs => $composableBuilder(
    column: $table.medianRtMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get averageRtMs => $composableBuilder(
    column: $table.averageRtMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bisScore => $composableBuilder(
    column: $table.bisScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get iesScore => $composableBuilder(
    column: $table.iesScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayScore => $composableBuilder(
    column: $table.displayScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dynamicPoints => $composableBuilder(
    column: $table.dynamicPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxConsecutiveCorrect => $composableBuilder(
    column: $table.maxConsecutiveCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sessionDurationSeconds => $composableBuilder(
    column: $table.sessionDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trialsByDifficultyLevel => $composableBuilder(
    column: $table.trialsByDifficultyLevel,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionSummariesTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionSummariesTable> {
  $$SessionSummariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalTrials => $composableBuilder(
    column: $table.totalTrials,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correctTrials => $composableBuilder(
    column: $table.correctTrials,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get medianRtMs => $composableBuilder(
    column: $table.medianRtMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get averageRtMs => $composableBuilder(
    column: $table.averageRtMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bisScore => $composableBuilder(
    column: $table.bisScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get iesScore => $composableBuilder(
    column: $table.iesScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayScore => $composableBuilder(
    column: $table.displayScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dynamicPoints => $composableBuilder(
    column: $table.dynamicPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxConsecutiveCorrect => $composableBuilder(
    column: $table.maxConsecutiveCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sessionDurationSeconds => $composableBuilder(
    column: $table.sessionDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trialsByDifficultyLevel => $composableBuilder(
    column: $table.trialsByDifficultyLevel,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionSummariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionSummariesTable> {
  $$SessionSummariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<int> get totalTrials => $composableBuilder(
    column: $table.totalTrials,
    builder: (column) => column,
  );

  GeneratedColumn<int> get correctTrials => $composableBuilder(
    column: $table.correctTrials,
    builder: (column) => column,
  );

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<int> get medianRtMs => $composableBuilder(
    column: $table.medianRtMs,
    builder: (column) => column,
  );

  GeneratedColumn<double> get averageRtMs => $composableBuilder(
    column: $table.averageRtMs,
    builder: (column) => column,
  );

  GeneratedColumn<double> get bisScore =>
      $composableBuilder(column: $table.bisScore, builder: (column) => column);

  GeneratedColumn<double> get iesScore =>
      $composableBuilder(column: $table.iesScore, builder: (column) => column);

  GeneratedColumn<int> get displayScore => $composableBuilder(
    column: $table.displayScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get dynamicPoints => $composableBuilder(
    column: $table.dynamicPoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxConsecutiveCorrect => $composableBuilder(
    column: $table.maxConsecutiveCorrect,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get sessionDurationSeconds => $composableBuilder(
    column: $table.sessionDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trialsByDifficultyLevel => $composableBuilder(
    column: $table.trialsByDifficultyLevel,
    builder: (column) => column,
  );
}

class $$SessionSummariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionSummariesTable,
          SessionSummaryEntity,
          $$SessionSummariesTableFilterComposer,
          $$SessionSummariesTableOrderingComposer,
          $$SessionSummariesTableAnnotationComposer,
          $$SessionSummariesTableCreateCompanionBuilder,
          $$SessionSummariesTableUpdateCompanionBuilder,
          (
            SessionSummaryEntity,
            BaseReferences<
              _$AppDatabase,
              $SessionSummariesTable,
              SessionSummaryEntity
            >,
          ),
          SessionSummaryEntity,
          PrefetchHooks Function()
        > {
  $$SessionSummariesTableTableManager(
    _$AppDatabase db,
    $SessionSummariesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionSummariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionSummariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionSummariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sessionId = const Value.absent(),
                Value<int> totalTrials = const Value.absent(),
                Value<int> correctTrials = const Value.absent(),
                Value<double> accuracy = const Value.absent(),
                Value<int> medianRtMs = const Value.absent(),
                Value<double> averageRtMs = const Value.absent(),
                Value<double> bisScore = const Value.absent(),
                Value<double> iesScore = const Value.absent(),
                Value<int> displayScore = const Value.absent(),
                Value<double> dynamicPoints = const Value.absent(),
                Value<int> maxConsecutiveCorrect = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
                Value<int> sessionDurationSeconds = const Value.absent(),
                Value<String> trialsByDifficultyLevel = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionSummariesCompanion(
                sessionId: sessionId,
                totalTrials: totalTrials,
                correctTrials: correctTrials,
                accuracy: accuracy,
                medianRtMs: medianRtMs,
                averageRtMs: averageRtMs,
                bisScore: bisScore,
                iesScore: iesScore,
                displayScore: displayScore,
                dynamicPoints: dynamicPoints,
                maxConsecutiveCorrect: maxConsecutiveCorrect,
                startTime: startTime,
                endTime: endTime,
                sessionDurationSeconds: sessionDurationSeconds,
                trialsByDifficultyLevel: trialsByDifficultyLevel,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sessionId,
                required int totalTrials,
                required int correctTrials,
                required double accuracy,
                required int medianRtMs,
                required double averageRtMs,
                required double bisScore,
                required double iesScore,
                required int displayScore,
                required double dynamicPoints,
                required int maxConsecutiveCorrect,
                required DateTime startTime,
                required DateTime endTime,
                required int sessionDurationSeconds,
                required String trialsByDifficultyLevel,
                Value<int> rowid = const Value.absent(),
              }) => SessionSummariesCompanion.insert(
                sessionId: sessionId,
                totalTrials: totalTrials,
                correctTrials: correctTrials,
                accuracy: accuracy,
                medianRtMs: medianRtMs,
                averageRtMs: averageRtMs,
                bisScore: bisScore,
                iesScore: iesScore,
                displayScore: displayScore,
                dynamicPoints: dynamicPoints,
                maxConsecutiveCorrect: maxConsecutiveCorrect,
                startTime: startTime,
                endTime: endTime,
                sessionDurationSeconds: sessionDurationSeconds,
                trialsByDifficultyLevel: trialsByDifficultyLevel,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionSummariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionSummariesTable,
      SessionSummaryEntity,
      $$SessionSummariesTableFilterComposer,
      $$SessionSummariesTableOrderingComposer,
      $$SessionSummariesTableAnnotationComposer,
      $$SessionSummariesTableCreateCompanionBuilder,
      $$SessionSummariesTableUpdateCompanionBuilder,
      (
        SessionSummaryEntity,
        BaseReferences<
          _$AppDatabase,
          $SessionSummariesTable,
          SessionSummaryEntity
        >,
      ),
      SessionSummaryEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TrialLogsTableTableManager get trialLogs =>
      $$TrialLogsTableTableManager(_db, _db.trialLogs);
  $$SessionSummariesTableTableManager get sessionSummaries =>
      $$SessionSummariesTableTableManager(_db, _db.sessionSummaries);
}
