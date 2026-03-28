// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AgeRange, String> ageRange =
      GeneratedColumn<String>(
        'age_range',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AgeRange>($UserProfilesTable.$converterageRange);
  @override
  late final GeneratedColumnWithTypeConverter<DiagnosisLabel, String>
  diagnosisLabel = GeneratedColumn<String>(
    'diagnosis_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<DiagnosisLabel>($UserProfilesTable.$converterdiagnosisLabel);
  @override
  late final GeneratedColumnWithTypeConverter<PrimaryGoal, String> primaryGoal =
      GeneratedColumn<String>(
        'primary_goal',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PrimaryGoal>($UserProfilesTable.$converterprimaryGoal);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    ageRange,
    diagnosisLabel,
    primaryGoal,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      ageRange: $UserProfilesTable.$converterageRange.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}age_range'],
        )!,
      ),
      diagnosisLabel: $UserProfilesTable.$converterdiagnosisLabel.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}diagnosis_label'],
        )!,
      ),
      primaryGoal: $UserProfilesTable.$converterprimaryGoal.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}primary_goal'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AgeRange, String, String> $converterageRange =
      const EnumNameConverter<AgeRange>(AgeRange.values);
  static JsonTypeConverter2<DiagnosisLabel, String, String>
  $converterdiagnosisLabel = const EnumNameConverter<DiagnosisLabel>(
    DiagnosisLabel.values,
  );
  static JsonTypeConverter2<PrimaryGoal, String, String> $converterprimaryGoal =
      const EnumNameConverter<PrimaryGoal>(PrimaryGoal.values);
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final String id;
  final String name;
  final AgeRange ageRange;
  final DiagnosisLabel diagnosisLabel;
  final PrimaryGoal primaryGoal;
  final DateTime createdAt;
  const UserProfile({
    required this.id,
    required this.name,
    required this.ageRange,
    required this.diagnosisLabel,
    required this.primaryGoal,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    {
      map['age_range'] = Variable<String>(
        $UserProfilesTable.$converterageRange.toSql(ageRange),
      );
    }
    {
      map['diagnosis_label'] = Variable<String>(
        $UserProfilesTable.$converterdiagnosisLabel.toSql(diagnosisLabel),
      );
    }
    {
      map['primary_goal'] = Variable<String>(
        $UserProfilesTable.$converterprimaryGoal.toSql(primaryGoal),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      name: Value(name),
      ageRange: Value(ageRange),
      diagnosisLabel: Value(diagnosisLabel),
      primaryGoal: Value(primaryGoal),
      createdAt: Value(createdAt),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ageRange: $UserProfilesTable.$converterageRange.fromJson(
        serializer.fromJson<String>(json['ageRange']),
      ),
      diagnosisLabel: $UserProfilesTable.$converterdiagnosisLabel.fromJson(
        serializer.fromJson<String>(json['diagnosisLabel']),
      ),
      primaryGoal: $UserProfilesTable.$converterprimaryGoal.fromJson(
        serializer.fromJson<String>(json['primaryGoal']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'ageRange': serializer.toJson<String>(
        $UserProfilesTable.$converterageRange.toJson(ageRange),
      ),
      'diagnosisLabel': serializer.toJson<String>(
        $UserProfilesTable.$converterdiagnosisLabel.toJson(diagnosisLabel),
      ),
      'primaryGoal': serializer.toJson<String>(
        $UserProfilesTable.$converterprimaryGoal.toJson(primaryGoal),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserProfile copyWith({
    String? id,
    String? name,
    AgeRange? ageRange,
    DiagnosisLabel? diagnosisLabel,
    PrimaryGoal? primaryGoal,
    DateTime? createdAt,
  }) => UserProfile(
    id: id ?? this.id,
    name: name ?? this.name,
    ageRange: ageRange ?? this.ageRange,
    diagnosisLabel: diagnosisLabel ?? this.diagnosisLabel,
    primaryGoal: primaryGoal ?? this.primaryGoal,
    createdAt: createdAt ?? this.createdAt,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      ageRange: data.ageRange.present ? data.ageRange.value : this.ageRange,
      diagnosisLabel: data.diagnosisLabel.present
          ? data.diagnosisLabel.value
          : this.diagnosisLabel,
      primaryGoal: data.primaryGoal.present
          ? data.primaryGoal.value
          : this.primaryGoal,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ageRange: $ageRange, ')
          ..write('diagnosisLabel: $diagnosisLabel, ')
          ..write('primaryGoal: $primaryGoal, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, ageRange, diagnosisLabel, primaryGoal, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.ageRange == this.ageRange &&
          other.diagnosisLabel == this.diagnosisLabel &&
          other.primaryGoal == this.primaryGoal &&
          other.createdAt == this.createdAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<String> id;
  final Value<String> name;
  final Value<AgeRange> ageRange;
  final Value<DiagnosisLabel> diagnosisLabel;
  final Value<PrimaryGoal> primaryGoal;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ageRange = const Value.absent(),
    this.diagnosisLabel = const Value.absent(),
    this.primaryGoal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String id,
    required String name,
    required AgeRange ageRange,
    required DiagnosisLabel diagnosisLabel,
    required PrimaryGoal primaryGoal,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       ageRange = Value(ageRange),
       diagnosisLabel = Value(diagnosisLabel),
       primaryGoal = Value(primaryGoal),
       createdAt = Value(createdAt);
  static Insertable<UserProfile> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? ageRange,
    Expression<String>? diagnosisLabel,
    Expression<String>? primaryGoal,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ageRange != null) 'age_range': ageRange,
      if (diagnosisLabel != null) 'diagnosis_label': diagnosisLabel,
      if (primaryGoal != null) 'primary_goal': primaryGoal,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<AgeRange>? ageRange,
    Value<DiagnosisLabel>? diagnosisLabel,
    Value<PrimaryGoal>? primaryGoal,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ageRange: ageRange ?? this.ageRange,
      diagnosisLabel: diagnosisLabel ?? this.diagnosisLabel,
      primaryGoal: primaryGoal ?? this.primaryGoal,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ageRange.present) {
      map['age_range'] = Variable<String>(
        $UserProfilesTable.$converterageRange.toSql(ageRange.value),
      );
    }
    if (diagnosisLabel.present) {
      map['diagnosis_label'] = Variable<String>(
        $UserProfilesTable.$converterdiagnosisLabel.toSql(diagnosisLabel.value),
      );
    }
    if (primaryGoal.present) {
      map['primary_goal'] = Variable<String>(
        $UserProfilesTable.$converterprimaryGoal.toSql(primaryGoal.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ageRange: $ageRange, ')
          ..write('diagnosisLabel: $diagnosisLabel, ')
          ..write('primaryGoal: $primaryGoal, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
    'dosage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    dosage,
    frequency,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(
        _dosageMeta,
        dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta),
      );
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dosage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dosage'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final String name;
  final String dosage;
  final String frequency;
  final String? notes;
  final DateTime createdAt;
  const Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['dosage'] = Variable<String>(dosage);
    map['frequency'] = Variable<String>(frequency);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      name: Value(name),
      dosage: Value(dosage),
      frequency: Value(frequency),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dosage: serializer.fromJson<String>(json['dosage']),
      frequency: serializer.fromJson<String>(json['frequency']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'dosage': serializer.toJson<String>(dosage),
      'frequency': serializer.toJson<String>(frequency),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Medication copyWith({
    String? id,
    String? name,
    String? dosage,
    String? frequency,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => Medication(
    id: id ?? this.id,
    name: name ?? this.name,
    dosage: dosage ?? this.dosage,
    frequency: frequency ?? this.frequency,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, dosage, frequency, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.name == this.name &&
          other.dosage == this.dosage &&
          other.frequency == this.frequency &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> dosage;
  final Value<String> frequency;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dosage = const Value.absent(),
    this.frequency = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationsCompanion.insert({
    required String id,
    required String name,
    required String dosage,
    required String frequency,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       dosage = Value(dosage),
       frequency = Value(frequency),
       createdAt = Value(createdAt);
  static Insertable<Medication> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? dosage,
    Expression<String>? frequency,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dosage != null) 'dosage': dosage,
      if (frequency != null) 'frequency': frequency,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? dosage,
    Value<String>? frequency,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationLogsTable extends MedicationLogs
    with TableInfo<$MedicationLogsTable, MedicationLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<MedicationLogStatus, String>
  status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MedicationLogStatus>($MedicationLogsTable.$converterstatus);
  static const VerificationMeta _scheduledForMeta = const VerificationMeta(
    'scheduledFor',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
    'scheduled_for',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicationId,
    status,
    scheduledFor,
    loggedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicationLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
        _scheduledForMeta,
        scheduledFor.isAcceptableOrUnknown(
          data['scheduled_for']!,
          _scheduledForMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      )!,
      status: $MedicationLogsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      scheduledFor: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_for'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $MedicationLogsTable createAlias(String alias) {
    return $MedicationLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MedicationLogStatus, String, String>
  $converterstatus = const EnumNameConverter<MedicationLogStatus>(
    MedicationLogStatus.values,
  );
}

class MedicationLog extends DataClass implements Insertable<MedicationLog> {
  final String id;
  final String medicationId;
  final MedicationLogStatus status;
  final DateTime scheduledFor;
  final DateTime loggedAt;
  const MedicationLog({
    required this.id,
    required this.medicationId,
    required this.status,
    required this.scheduledFor,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medication_id'] = Variable<String>(medicationId);
    {
      map['status'] = Variable<String>(
        $MedicationLogsTable.$converterstatus.toSql(status),
      );
    }
    map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  MedicationLogsCompanion toCompanion(bool nullToAbsent) {
    return MedicationLogsCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      status: Value(status),
      scheduledFor: Value(scheduledFor),
      loggedAt: Value(loggedAt),
    );
  }

  factory MedicationLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationLog(
      id: serializer.fromJson<String>(json['id']),
      medicationId: serializer.fromJson<String>(json['medicationId']),
      status: $MedicationLogsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      scheduledFor: serializer.fromJson<DateTime>(json['scheduledFor']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicationId': serializer.toJson<String>(medicationId),
      'status': serializer.toJson<String>(
        $MedicationLogsTable.$converterstatus.toJson(status),
      ),
      'scheduledFor': serializer.toJson<DateTime>(scheduledFor),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  MedicationLog copyWith({
    String? id,
    String? medicationId,
    MedicationLogStatus? status,
    DateTime? scheduledFor,
    DateTime? loggedAt,
  }) => MedicationLog(
    id: id ?? this.id,
    medicationId: medicationId ?? this.medicationId,
    status: status ?? this.status,
    scheduledFor: scheduledFor ?? this.scheduledFor,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  MedicationLog copyWithCompanion(MedicationLogsCompanion data) {
    return MedicationLog(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      status: data.status.present ? data.status.value : this.status,
      scheduledFor: data.scheduledFor.present
          ? data.scheduledFor.value
          : this.scheduledFor,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationLog(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('status: $status, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, medicationId, status, scheduledFor, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationLog &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.status == this.status &&
          other.scheduledFor == this.scheduledFor &&
          other.loggedAt == this.loggedAt);
}

class MedicationLogsCompanion extends UpdateCompanion<MedicationLog> {
  final Value<String> id;
  final Value<String> medicationId;
  final Value<MedicationLogStatus> status;
  final Value<DateTime> scheduledFor;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const MedicationLogsCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.status = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationLogsCompanion.insert({
    required String id,
    required String medicationId,
    required MedicationLogStatus status,
    required DateTime scheduledFor,
    required DateTime loggedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicationId = Value(medicationId),
       status = Value(status),
       scheduledFor = Value(scheduledFor),
       loggedAt = Value(loggedAt);
  static Insertable<MedicationLog> custom({
    Expression<String>? id,
    Expression<String>? medicationId,
    Expression<String>? status,
    Expression<DateTime>? scheduledFor,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (status != null) 'status': status,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? medicationId,
    Value<MedicationLogStatus>? status,
    Value<DateTime>? scheduledFor,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return MedicationLogsCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      status: status ?? this.status,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $MedicationLogsTable.$converterstatus.toSql(status.value),
      );
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationLogsCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('status: $status, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CycleEntriesTable extends CycleEntries
    with TableInfo<$CycleEntriesTable, CycleEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CycleEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FlowLevel?, String> flowLevel =
      GeneratedColumn<String>(
        'flow_level',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<FlowLevel?>($CycleEntriesTable.$converterflowLeveln);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startDate,
    endDate,
    flowLevel,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cycle_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CycleEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CycleEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CycleEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      flowLevel: $CycleEntriesTable.$converterflowLeveln.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}flow_level'],
        ),
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CycleEntriesTable createAlias(String alias) {
    return $CycleEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FlowLevel, String, String> $converterflowLevel =
      const EnumNameConverter<FlowLevel>(FlowLevel.values);
  static JsonTypeConverter2<FlowLevel?, String?, String?> $converterflowLeveln =
      JsonTypeConverter2.asNullable($converterflowLevel);
}

class CycleEntry extends DataClass implements Insertable<CycleEntry> {
  final String id;
  final DateTime startDate;
  final DateTime? endDate;
  final FlowLevel? flowLevel;
  final String? notes;
  const CycleEntry({
    required this.id,
    required this.startDate,
    this.endDate,
    this.flowLevel,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || flowLevel != null) {
      map['flow_level'] = Variable<String>(
        $CycleEntriesTable.$converterflowLeveln.toSql(flowLevel),
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CycleEntriesCompanion toCompanion(bool nullToAbsent) {
    return CycleEntriesCompanion(
      id: Value(id),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      flowLevel: flowLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(flowLevel),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory CycleEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CycleEntry(
      id: serializer.fromJson<String>(json['id']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      flowLevel: $CycleEntriesTable.$converterflowLeveln.fromJson(
        serializer.fromJson<String?>(json['flowLevel']),
      ),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'flowLevel': serializer.toJson<String?>(
        $CycleEntriesTable.$converterflowLeveln.toJson(flowLevel),
      ),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  CycleEntry copyWith({
    String? id,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    Value<FlowLevel?> flowLevel = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => CycleEntry(
    id: id ?? this.id,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    flowLevel: flowLevel.present ? flowLevel.value : this.flowLevel,
    notes: notes.present ? notes.value : this.notes,
  );
  CycleEntry copyWithCompanion(CycleEntriesCompanion data) {
    return CycleEntry(
      id: data.id.present ? data.id.value : this.id,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      flowLevel: data.flowLevel.present ? data.flowLevel.value : this.flowLevel,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CycleEntry(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('flowLevel: $flowLevel, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startDate, endDate, flowLevel, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CycleEntry &&
          other.id == this.id &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.flowLevel == this.flowLevel &&
          other.notes == this.notes);
}

class CycleEntriesCompanion extends UpdateCompanion<CycleEntry> {
  final Value<String> id;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<FlowLevel?> flowLevel;
  final Value<String?> notes;
  final Value<int> rowid;
  const CycleEntriesCompanion({
    this.id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.flowLevel = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CycleEntriesCompanion.insert({
    required String id,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.flowLevel = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startDate = Value(startDate);
  static Insertable<CycleEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? flowLevel,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (flowLevel != null) 'flow_level': flowLevel,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CycleEntriesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<FlowLevel?>? flowLevel,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return CycleEntriesCompanion(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      flowLevel: flowLevel ?? this.flowLevel,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (flowLevel.present) {
      map['flow_level'] = Variable<String>(
        $CycleEntriesTable.$converterflowLeveln.toSql(flowLevel.value),
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CycleEntriesCompanion(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('flowLevel: $flowLevel, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SymptomEntriesTable extends SymptomEntries
    with TableInfo<$SymptomEntriesTable, SymptomEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymptomEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SymptomSeverity, String>
  painSeverity = GeneratedColumn<String>(
    'pain_severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<SymptomSeverity>($SymptomEntriesTable.$converterpainSeverity);
  @override
  late final GeneratedColumnWithTypeConverter<SymptomSeverity, String>
  acneSeverity = GeneratedColumn<String>(
    'acne_severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<SymptomSeverity>($SymptomEntriesTable.$converteracneSeverity);
  @override
  late final GeneratedColumnWithTypeConverter<WellbeingScale, String> mood =
      GeneratedColumn<String>(
        'mood',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<WellbeingScale>($SymptomEntriesTable.$convertermood);
  @override
  late final GeneratedColumnWithTypeConverter<WellbeingScale, String> energy =
      GeneratedColumn<String>(
        'energy',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<WellbeingScale>($SymptomEntriesTable.$converterenergy);
  @override
  late final GeneratedColumnWithTypeConverter<WellbeingScale, String>
  sleepQuality = GeneratedColumn<String>(
    'sleep_quality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<WellbeingScale>($SymptomEntriesTable.$convertersleepQuality);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loggedAt,
    painSeverity,
    acneSeverity,
    mood,
    energy,
    sleepQuality,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symptom_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SymptomEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SymptomEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymptomEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      painSeverity: $SymptomEntriesTable.$converterpainSeverity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}pain_severity'],
        )!,
      ),
      acneSeverity: $SymptomEntriesTable.$converteracneSeverity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}acne_severity'],
        )!,
      ),
      mood: $SymptomEntriesTable.$convertermood.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}mood'],
        )!,
      ),
      energy: $SymptomEntriesTable.$converterenergy.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}energy'],
        )!,
      ),
      sleepQuality: $SymptomEntriesTable.$convertersleepQuality.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sleep_quality'],
        )!,
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $SymptomEntriesTable createAlias(String alias) {
    return $SymptomEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SymptomSeverity, String, String>
  $converterpainSeverity = const EnumNameConverter<SymptomSeverity>(
    SymptomSeverity.values,
  );
  static JsonTypeConverter2<SymptomSeverity, String, String>
  $converteracneSeverity = const EnumNameConverter<SymptomSeverity>(
    SymptomSeverity.values,
  );
  static JsonTypeConverter2<WellbeingScale, String, String> $convertermood =
      const EnumNameConverter<WellbeingScale>(WellbeingScale.values);
  static JsonTypeConverter2<WellbeingScale, String, String> $converterenergy =
      const EnumNameConverter<WellbeingScale>(WellbeingScale.values);
  static JsonTypeConverter2<WellbeingScale, String, String>
  $convertersleepQuality = const EnumNameConverter<WellbeingScale>(
    WellbeingScale.values,
  );
}

class SymptomEntry extends DataClass implements Insertable<SymptomEntry> {
  final String id;
  final DateTime loggedAt;
  final SymptomSeverity painSeverity;
  final SymptomSeverity acneSeverity;
  final WellbeingScale mood;
  final WellbeingScale energy;
  final WellbeingScale sleepQuality;
  final String? notes;
  const SymptomEntry({
    required this.id,
    required this.loggedAt,
    required this.painSeverity,
    required this.acneSeverity,
    required this.mood,
    required this.energy,
    required this.sleepQuality,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    {
      map['pain_severity'] = Variable<String>(
        $SymptomEntriesTable.$converterpainSeverity.toSql(painSeverity),
      );
    }
    {
      map['acne_severity'] = Variable<String>(
        $SymptomEntriesTable.$converteracneSeverity.toSql(acneSeverity),
      );
    }
    {
      map['mood'] = Variable<String>(
        $SymptomEntriesTable.$convertermood.toSql(mood),
      );
    }
    {
      map['energy'] = Variable<String>(
        $SymptomEntriesTable.$converterenergy.toSql(energy),
      );
    }
    {
      map['sleep_quality'] = Variable<String>(
        $SymptomEntriesTable.$convertersleepQuality.toSql(sleepQuality),
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SymptomEntriesCompanion toCompanion(bool nullToAbsent) {
    return SymptomEntriesCompanion(
      id: Value(id),
      loggedAt: Value(loggedAt),
      painSeverity: Value(painSeverity),
      acneSeverity: Value(acneSeverity),
      mood: Value(mood),
      energy: Value(energy),
      sleepQuality: Value(sleepQuality),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory SymptomEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymptomEntry(
      id: serializer.fromJson<String>(json['id']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      painSeverity: $SymptomEntriesTable.$converterpainSeverity.fromJson(
        serializer.fromJson<String>(json['painSeverity']),
      ),
      acneSeverity: $SymptomEntriesTable.$converteracneSeverity.fromJson(
        serializer.fromJson<String>(json['acneSeverity']),
      ),
      mood: $SymptomEntriesTable.$convertermood.fromJson(
        serializer.fromJson<String>(json['mood']),
      ),
      energy: $SymptomEntriesTable.$converterenergy.fromJson(
        serializer.fromJson<String>(json['energy']),
      ),
      sleepQuality: $SymptomEntriesTable.$convertersleepQuality.fromJson(
        serializer.fromJson<String>(json['sleepQuality']),
      ),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'painSeverity': serializer.toJson<String>(
        $SymptomEntriesTable.$converterpainSeverity.toJson(painSeverity),
      ),
      'acneSeverity': serializer.toJson<String>(
        $SymptomEntriesTable.$converteracneSeverity.toJson(acneSeverity),
      ),
      'mood': serializer.toJson<String>(
        $SymptomEntriesTable.$convertermood.toJson(mood),
      ),
      'energy': serializer.toJson<String>(
        $SymptomEntriesTable.$converterenergy.toJson(energy),
      ),
      'sleepQuality': serializer.toJson<String>(
        $SymptomEntriesTable.$convertersleepQuality.toJson(sleepQuality),
      ),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SymptomEntry copyWith({
    String? id,
    DateTime? loggedAt,
    SymptomSeverity? painSeverity,
    SymptomSeverity? acneSeverity,
    WellbeingScale? mood,
    WellbeingScale? energy,
    WellbeingScale? sleepQuality,
    Value<String?> notes = const Value.absent(),
  }) => SymptomEntry(
    id: id ?? this.id,
    loggedAt: loggedAt ?? this.loggedAt,
    painSeverity: painSeverity ?? this.painSeverity,
    acneSeverity: acneSeverity ?? this.acneSeverity,
    mood: mood ?? this.mood,
    energy: energy ?? this.energy,
    sleepQuality: sleepQuality ?? this.sleepQuality,
    notes: notes.present ? notes.value : this.notes,
  );
  SymptomEntry copyWithCompanion(SymptomEntriesCompanion data) {
    return SymptomEntry(
      id: data.id.present ? data.id.value : this.id,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      painSeverity: data.painSeverity.present
          ? data.painSeverity.value
          : this.painSeverity,
      acneSeverity: data.acneSeverity.present
          ? data.acneSeverity.value
          : this.acneSeverity,
      mood: data.mood.present ? data.mood.value : this.mood,
      energy: data.energy.present ? data.energy.value : this.energy,
      sleepQuality: data.sleepQuality.present
          ? data.sleepQuality.value
          : this.sleepQuality,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymptomEntry(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('painSeverity: $painSeverity, ')
          ..write('acneSeverity: $acneSeverity, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('sleepQuality: $sleepQuality, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    loggedAt,
    painSeverity,
    acneSeverity,
    mood,
    energy,
    sleepQuality,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymptomEntry &&
          other.id == this.id &&
          other.loggedAt == this.loggedAt &&
          other.painSeverity == this.painSeverity &&
          other.acneSeverity == this.acneSeverity &&
          other.mood == this.mood &&
          other.energy == this.energy &&
          other.sleepQuality == this.sleepQuality &&
          other.notes == this.notes);
}

class SymptomEntriesCompanion extends UpdateCompanion<SymptomEntry> {
  final Value<String> id;
  final Value<DateTime> loggedAt;
  final Value<SymptomSeverity> painSeverity;
  final Value<SymptomSeverity> acneSeverity;
  final Value<WellbeingScale> mood;
  final Value<WellbeingScale> energy;
  final Value<WellbeingScale> sleepQuality;
  final Value<String?> notes;
  final Value<int> rowid;
  const SymptomEntriesCompanion({
    this.id = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.painSeverity = const Value.absent(),
    this.acneSeverity = const Value.absent(),
    this.mood = const Value.absent(),
    this.energy = const Value.absent(),
    this.sleepQuality = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SymptomEntriesCompanion.insert({
    required String id,
    required DateTime loggedAt,
    required SymptomSeverity painSeverity,
    required SymptomSeverity acneSeverity,
    required WellbeingScale mood,
    required WellbeingScale energy,
    required WellbeingScale sleepQuality,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loggedAt = Value(loggedAt),
       painSeverity = Value(painSeverity),
       acneSeverity = Value(acneSeverity),
       mood = Value(mood),
       energy = Value(energy),
       sleepQuality = Value(sleepQuality);
  static Insertable<SymptomEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? loggedAt,
    Expression<String>? painSeverity,
    Expression<String>? acneSeverity,
    Expression<String>? mood,
    Expression<String>? energy,
    Expression<String>? sleepQuality,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (painSeverity != null) 'pain_severity': painSeverity,
      if (acneSeverity != null) 'acne_severity': acneSeverity,
      if (mood != null) 'mood': mood,
      if (energy != null) 'energy': energy,
      if (sleepQuality != null) 'sleep_quality': sleepQuality,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SymptomEntriesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? loggedAt,
    Value<SymptomSeverity>? painSeverity,
    Value<SymptomSeverity>? acneSeverity,
    Value<WellbeingScale>? mood,
    Value<WellbeingScale>? energy,
    Value<WellbeingScale>? sleepQuality,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return SymptomEntriesCompanion(
      id: id ?? this.id,
      loggedAt: loggedAt ?? this.loggedAt,
      painSeverity: painSeverity ?? this.painSeverity,
      acneSeverity: acneSeverity ?? this.acneSeverity,
      mood: mood ?? this.mood,
      energy: energy ?? this.energy,
      sleepQuality: sleepQuality ?? this.sleepQuality,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (painSeverity.present) {
      map['pain_severity'] = Variable<String>(
        $SymptomEntriesTable.$converterpainSeverity.toSql(painSeverity.value),
      );
    }
    if (acneSeverity.present) {
      map['acne_severity'] = Variable<String>(
        $SymptomEntriesTable.$converteracneSeverity.toSql(acneSeverity.value),
      );
    }
    if (mood.present) {
      map['mood'] = Variable<String>(
        $SymptomEntriesTable.$convertermood.toSql(mood.value),
      );
    }
    if (energy.present) {
      map['energy'] = Variable<String>(
        $SymptomEntriesTable.$converterenergy.toSql(energy.value),
      );
    }
    if (sleepQuality.present) {
      map['sleep_quality'] = Variable<String>(
        $SymptomEntriesTable.$convertersleepQuality.toSql(sleepQuality.value),
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymptomEntriesCompanion(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('painSeverity: $painSeverity, ')
          ..write('acneSeverity: $acneSeverity, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('sleepQuality: $sleepQuality, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitLogsTable extends HabitLogs
    with TableInfo<$HabitLogsTable, HabitLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _movementMinutesMeta = const VerificationMeta(
    'movementMinutes',
  );
  @override
  late final GeneratedColumn<int> movementMinutes = GeneratedColumn<int>(
    'movement_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hydrationGlassesMeta = const VerificationMeta(
    'hydrationGlasses',
  );
  @override
  late final GeneratedColumn<int> hydrationGlasses = GeneratedColumn<int>(
    'hydration_glasses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sleepHoursMeta = const VerificationMeta(
    'sleepHours',
  );
  @override
  late final GeneratedColumn<double> sleepHours = GeneratedColumn<double>(
    'sleep_hours',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WellbeingScale, String>
  stressLevel = GeneratedColumn<String>(
    'stress_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<WellbeingScale>($HabitLogsTable.$converterstressLevel);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loggedAt,
    movementMinutes,
    hydrationGlasses,
    sleepHours,
    stressLevel,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('movement_minutes')) {
      context.handle(
        _movementMinutesMeta,
        movementMinutes.isAcceptableOrUnknown(
          data['movement_minutes']!,
          _movementMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_movementMinutesMeta);
    }
    if (data.containsKey('hydration_glasses')) {
      context.handle(
        _hydrationGlassesMeta,
        hydrationGlasses.isAcceptableOrUnknown(
          data['hydration_glasses']!,
          _hydrationGlassesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hydrationGlassesMeta);
    }
    if (data.containsKey('sleep_hours')) {
      context.handle(
        _sleepHoursMeta,
        sleepHours.isAcceptableOrUnknown(data['sleep_hours']!, _sleepHoursMeta),
      );
    } else if (isInserting) {
      context.missing(_sleepHoursMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      movementMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}movement_minutes'],
      )!,
      hydrationGlasses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hydration_glasses'],
      )!,
      sleepHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sleep_hours'],
      )!,
      stressLevel: $HabitLogsTable.$converterstressLevel.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}stress_level'],
        )!,
      ),
    );
  }

  @override
  $HabitLogsTable createAlias(String alias) {
    return $HabitLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WellbeingScale, String, String>
  $converterstressLevel = const EnumNameConverter<WellbeingScale>(
    WellbeingScale.values,
  );
}

class HabitLog extends DataClass implements Insertable<HabitLog> {
  final String id;
  final DateTime loggedAt;
  final int movementMinutes;
  final int hydrationGlasses;
  final double sleepHours;
  final WellbeingScale stressLevel;
  const HabitLog({
    required this.id,
    required this.loggedAt,
    required this.movementMinutes,
    required this.hydrationGlasses,
    required this.sleepHours,
    required this.stressLevel,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    map['movement_minutes'] = Variable<int>(movementMinutes);
    map['hydration_glasses'] = Variable<int>(hydrationGlasses);
    map['sleep_hours'] = Variable<double>(sleepHours);
    {
      map['stress_level'] = Variable<String>(
        $HabitLogsTable.$converterstressLevel.toSql(stressLevel),
      );
    }
    return map;
  }

  HabitLogsCompanion toCompanion(bool nullToAbsent) {
    return HabitLogsCompanion(
      id: Value(id),
      loggedAt: Value(loggedAt),
      movementMinutes: Value(movementMinutes),
      hydrationGlasses: Value(hydrationGlasses),
      sleepHours: Value(sleepHours),
      stressLevel: Value(stressLevel),
    );
  }

  factory HabitLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitLog(
      id: serializer.fromJson<String>(json['id']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      movementMinutes: serializer.fromJson<int>(json['movementMinutes']),
      hydrationGlasses: serializer.fromJson<int>(json['hydrationGlasses']),
      sleepHours: serializer.fromJson<double>(json['sleepHours']),
      stressLevel: $HabitLogsTable.$converterstressLevel.fromJson(
        serializer.fromJson<String>(json['stressLevel']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'movementMinutes': serializer.toJson<int>(movementMinutes),
      'hydrationGlasses': serializer.toJson<int>(hydrationGlasses),
      'sleepHours': serializer.toJson<double>(sleepHours),
      'stressLevel': serializer.toJson<String>(
        $HabitLogsTable.$converterstressLevel.toJson(stressLevel),
      ),
    };
  }

  HabitLog copyWith({
    String? id,
    DateTime? loggedAt,
    int? movementMinutes,
    int? hydrationGlasses,
    double? sleepHours,
    WellbeingScale? stressLevel,
  }) => HabitLog(
    id: id ?? this.id,
    loggedAt: loggedAt ?? this.loggedAt,
    movementMinutes: movementMinutes ?? this.movementMinutes,
    hydrationGlasses: hydrationGlasses ?? this.hydrationGlasses,
    sleepHours: sleepHours ?? this.sleepHours,
    stressLevel: stressLevel ?? this.stressLevel,
  );
  HabitLog copyWithCompanion(HabitLogsCompanion data) {
    return HabitLog(
      id: data.id.present ? data.id.value : this.id,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      movementMinutes: data.movementMinutes.present
          ? data.movementMinutes.value
          : this.movementMinutes,
      hydrationGlasses: data.hydrationGlasses.present
          ? data.hydrationGlasses.value
          : this.hydrationGlasses,
      sleepHours: data.sleepHours.present
          ? data.sleepHours.value
          : this.sleepHours,
      stressLevel: data.stressLevel.present
          ? data.stressLevel.value
          : this.stressLevel,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitLog(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('movementMinutes: $movementMinutes, ')
          ..write('hydrationGlasses: $hydrationGlasses, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('stressLevel: $stressLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    loggedAt,
    movementMinutes,
    hydrationGlasses,
    sleepHours,
    stressLevel,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitLog &&
          other.id == this.id &&
          other.loggedAt == this.loggedAt &&
          other.movementMinutes == this.movementMinutes &&
          other.hydrationGlasses == this.hydrationGlasses &&
          other.sleepHours == this.sleepHours &&
          other.stressLevel == this.stressLevel);
}

class HabitLogsCompanion extends UpdateCompanion<HabitLog> {
  final Value<String> id;
  final Value<DateTime> loggedAt;
  final Value<int> movementMinutes;
  final Value<int> hydrationGlasses;
  final Value<double> sleepHours;
  final Value<WellbeingScale> stressLevel;
  final Value<int> rowid;
  const HabitLogsCompanion({
    this.id = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.movementMinutes = const Value.absent(),
    this.hydrationGlasses = const Value.absent(),
    this.sleepHours = const Value.absent(),
    this.stressLevel = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitLogsCompanion.insert({
    required String id,
    required DateTime loggedAt,
    required int movementMinutes,
    required int hydrationGlasses,
    required double sleepHours,
    required WellbeingScale stressLevel,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loggedAt = Value(loggedAt),
       movementMinutes = Value(movementMinutes),
       hydrationGlasses = Value(hydrationGlasses),
       sleepHours = Value(sleepHours),
       stressLevel = Value(stressLevel);
  static Insertable<HabitLog> custom({
    Expression<String>? id,
    Expression<DateTime>? loggedAt,
    Expression<int>? movementMinutes,
    Expression<int>? hydrationGlasses,
    Expression<double>? sleepHours,
    Expression<String>? stressLevel,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (movementMinutes != null) 'movement_minutes': movementMinutes,
      if (hydrationGlasses != null) 'hydration_glasses': hydrationGlasses,
      if (sleepHours != null) 'sleep_hours': sleepHours,
      if (stressLevel != null) 'stress_level': stressLevel,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? loggedAt,
    Value<int>? movementMinutes,
    Value<int>? hydrationGlasses,
    Value<double>? sleepHours,
    Value<WellbeingScale>? stressLevel,
    Value<int>? rowid,
  }) {
    return HabitLogsCompanion(
      id: id ?? this.id,
      loggedAt: loggedAt ?? this.loggedAt,
      movementMinutes: movementMinutes ?? this.movementMinutes,
      hydrationGlasses: hydrationGlasses ?? this.hydrationGlasses,
      sleepHours: sleepHours ?? this.sleepHours,
      stressLevel: stressLevel ?? this.stressLevel,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (movementMinutes.present) {
      map['movement_minutes'] = Variable<int>(movementMinutes.value);
    }
    if (hydrationGlasses.present) {
      map['hydration_glasses'] = Variable<int>(hydrationGlasses.value);
    }
    if (sleepHours.present) {
      map['sleep_hours'] = Variable<double>(sleepHours.value);
    }
    if (stressLevel.present) {
      map['stress_level'] = Variable<String>(
        $HabitLogsTable.$converterstressLevel.toSql(stressLevel.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitLogsCompanion(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('movementMinutes: $movementMinutes, ')
          ..write('hydrationGlasses: $hydrationGlasses, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('stressLevel: $stressLevel, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $MedicationLogsTable medicationLogs = $MedicationLogsTable(this);
  late final $CycleEntriesTable cycleEntries = $CycleEntriesTable(this);
  late final $SymptomEntriesTable symptomEntries = $SymptomEntriesTable(this);
  late final $HabitLogsTable habitLogs = $HabitLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    medications,
    medicationLogs,
    cycleEntries,
    symptomEntries,
    habitLogs,
  ];
}

typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      required String id,
      required String name,
      required AgeRange ageRange,
      required DiagnosisLabel diagnosisLabel,
      required PrimaryGoal primaryGoal,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<AgeRange> ageRange,
      Value<DiagnosisLabel> diagnosisLabel,
      Value<PrimaryGoal> primaryGoal,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AgeRange, AgeRange, String> get ageRange =>
      $composableBuilder(
        column: $table.ageRange,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DiagnosisLabel, DiagnosisLabel, String>
  get diagnosisLabel => $composableBuilder(
    column: $table.diagnosisLabel,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<PrimaryGoal, PrimaryGoal, String>
  get primaryGoal => $composableBuilder(
    column: $table.primaryGoal,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageRange => $composableBuilder(
    column: $table.ageRange,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagnosisLabel => $composableBuilder(
    column: $table.diagnosisLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryGoal => $composableBuilder(
    column: $table.primaryGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AgeRange, String> get ageRange =>
      $composableBuilder(column: $table.ageRange, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DiagnosisLabel, String> get diagnosisLabel =>
      $composableBuilder(
        column: $table.diagnosisLabel,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<PrimaryGoal, String> get primaryGoal =>
      $composableBuilder(
        column: $table.primaryGoal,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            UserProfile,
            BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
          ),
          UserProfile,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<AgeRange> ageRange = const Value.absent(),
                Value<DiagnosisLabel> diagnosisLabel = const Value.absent(),
                Value<PrimaryGoal> primaryGoal = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                name: name,
                ageRange: ageRange,
                diagnosisLabel: diagnosisLabel,
                primaryGoal: primaryGoal,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required AgeRange ageRange,
                required DiagnosisLabel diagnosisLabel,
                required PrimaryGoal primaryGoal,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                name: name,
                ageRange: ageRange,
                diagnosisLabel: diagnosisLabel,
                primaryGoal: primaryGoal,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        UserProfile,
        BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
      ),
      UserProfile,
      PrefetchHooks Function()
    >;
typedef $$MedicationsTableCreateCompanionBuilder =
    MedicationsCompanion Function({
      required String id,
      required String name,
      required String dosage,
      required String frequency,
      Value<String?> notes,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$MedicationsTableUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> dosage,
      Value<String> frequency,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MedicationLogsTable, List<MedicationLog>>
  _medicationLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medicationLogs,
    aliasName: $_aliasNameGenerator(
      db.medications.id,
      db.medicationLogs.medicationId,
    ),
  );

  $$MedicationLogsTableProcessedTableManager get medicationLogsRefs {
    final manager = $$MedicationLogsTableTableManager(
      $_db,
      $_db.medicationLogs,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> medicationLogsRefs(
    Expression<bool> Function($$MedicationLogsTableFilterComposer f) f,
  ) {
    final $$MedicationLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationLogs,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationLogsTableFilterComposer(
            $db: $db,
            $table: $db.medicationLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> medicationLogsRefs<T extends Object>(
    Expression<T> Function($$MedicationLogsTableAnnotationComposer a) f,
  ) {
    final $$MedicationLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationLogs,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.medicationLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationsTable,
          Medication,
          $$MedicationsTableFilterComposer,
          $$MedicationsTableOrderingComposer,
          $$MedicationsTableAnnotationComposer,
          $$MedicationsTableCreateCompanionBuilder,
          $$MedicationsTableUpdateCompanionBuilder,
          (Medication, $$MedicationsTableReferences),
          Medication,
          PrefetchHooks Function({bool medicationLogsRefs})
        > {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> dosage = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                name: name,
                dosage: dosage,
                frequency: frequency,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String dosage,
                required String frequency,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                name: name,
                dosage: dosage,
                frequency: frequency,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (medicationLogsRefs) db.medicationLogs,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (medicationLogsRefs)
                    await $_getPrefetchedData<
                      Medication,
                      $MedicationsTable,
                      MedicationLog
                    >(
                      currentTable: table,
                      referencedTable: $$MedicationsTableReferences
                          ._medicationLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MedicationsTableReferences(
                            db,
                            table,
                            p0,
                          ).medicationLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.medicationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationsTable,
      Medication,
      $$MedicationsTableFilterComposer,
      $$MedicationsTableOrderingComposer,
      $$MedicationsTableAnnotationComposer,
      $$MedicationsTableCreateCompanionBuilder,
      $$MedicationsTableUpdateCompanionBuilder,
      (Medication, $$MedicationsTableReferences),
      Medication,
      PrefetchHooks Function({bool medicationLogsRefs})
    >;
typedef $$MedicationLogsTableCreateCompanionBuilder =
    MedicationLogsCompanion Function({
      required String id,
      required String medicationId,
      required MedicationLogStatus status,
      required DateTime scheduledFor,
      required DateTime loggedAt,
      Value<int> rowid,
    });
typedef $$MedicationLogsTableUpdateCompanionBuilder =
    MedicationLogsCompanion Function({
      Value<String> id,
      Value<String> medicationId,
      Value<MedicationLogStatus> status,
      Value<DateTime> scheduledFor,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

final class $$MedicationLogsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationLogsTable, MedicationLog> {
  $$MedicationLogsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
        $_aliasNameGenerator(db.medicationLogs.medicationId, db.medications.id),
      );

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<String>('medication_id')!;

    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MedicationLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationLogsTable> {
  $$MedicationLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    MedicationLogStatus,
    MedicationLogStatus,
    String
  >
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationLogsTable> {
  $$MedicationLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationLogsTable> {
  $$MedicationLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MedicationLogStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationLogsTable,
          MedicationLog,
          $$MedicationLogsTableFilterComposer,
          $$MedicationLogsTableOrderingComposer,
          $$MedicationLogsTableAnnotationComposer,
          $$MedicationLogsTableCreateCompanionBuilder,
          $$MedicationLogsTableUpdateCompanionBuilder,
          (MedicationLog, $$MedicationLogsTableReferences),
          MedicationLog,
          PrefetchHooks Function({bool medicationId})
        > {
  $$MedicationLogsTableTableManager(
    _$AppDatabase db,
    $MedicationLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicationId = const Value.absent(),
                Value<MedicationLogStatus> status = const Value.absent(),
                Value<DateTime> scheduledFor = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationLogsCompanion(
                id: id,
                medicationId: medicationId,
                status: status,
                scheduledFor: scheduledFor,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String medicationId,
                required MedicationLogStatus status,
                required DateTime scheduledFor,
                required DateTime loggedAt,
                Value<int> rowid = const Value.absent(),
              }) => MedicationLogsCompanion.insert(
                id: id,
                medicationId: medicationId,
                status: status,
                scheduledFor: scheduledFor,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicationLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $$MedicationLogsTableReferences
                                    ._medicationIdTable(db),
                                referencedColumn:
                                    $$MedicationLogsTableReferences
                                        ._medicationIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MedicationLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationLogsTable,
      MedicationLog,
      $$MedicationLogsTableFilterComposer,
      $$MedicationLogsTableOrderingComposer,
      $$MedicationLogsTableAnnotationComposer,
      $$MedicationLogsTableCreateCompanionBuilder,
      $$MedicationLogsTableUpdateCompanionBuilder,
      (MedicationLog, $$MedicationLogsTableReferences),
      MedicationLog,
      PrefetchHooks Function({bool medicationId})
    >;
typedef $$CycleEntriesTableCreateCompanionBuilder =
    CycleEntriesCompanion Function({
      required String id,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<FlowLevel?> flowLevel,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$CycleEntriesTableUpdateCompanionBuilder =
    CycleEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<FlowLevel?> flowLevel,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$CycleEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CycleEntriesTable> {
  $$CycleEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FlowLevel?, FlowLevel, String> get flowLevel =>
      $composableBuilder(
        column: $table.flowLevel,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CycleEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CycleEntriesTable> {
  $$CycleEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flowLevel => $composableBuilder(
    column: $table.flowLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CycleEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CycleEntriesTable> {
  $$CycleEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FlowLevel?, String> get flowLevel =>
      $composableBuilder(column: $table.flowLevel, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$CycleEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CycleEntriesTable,
          CycleEntry,
          $$CycleEntriesTableFilterComposer,
          $$CycleEntriesTableOrderingComposer,
          $$CycleEntriesTableAnnotationComposer,
          $$CycleEntriesTableCreateCompanionBuilder,
          $$CycleEntriesTableUpdateCompanionBuilder,
          (
            CycleEntry,
            BaseReferences<_$AppDatabase, $CycleEntriesTable, CycleEntry>,
          ),
          CycleEntry,
          PrefetchHooks Function()
        > {
  $$CycleEntriesTableTableManager(_$AppDatabase db, $CycleEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CycleEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CycleEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CycleEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<FlowLevel?> flowLevel = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CycleEntriesCompanion(
                id: id,
                startDate: startDate,
                endDate: endDate,
                flowLevel: flowLevel,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<FlowLevel?> flowLevel = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CycleEntriesCompanion.insert(
                id: id,
                startDate: startDate,
                endDate: endDate,
                flowLevel: flowLevel,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CycleEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CycleEntriesTable,
      CycleEntry,
      $$CycleEntriesTableFilterComposer,
      $$CycleEntriesTableOrderingComposer,
      $$CycleEntriesTableAnnotationComposer,
      $$CycleEntriesTableCreateCompanionBuilder,
      $$CycleEntriesTableUpdateCompanionBuilder,
      (
        CycleEntry,
        BaseReferences<_$AppDatabase, $CycleEntriesTable, CycleEntry>,
      ),
      CycleEntry,
      PrefetchHooks Function()
    >;
typedef $$SymptomEntriesTableCreateCompanionBuilder =
    SymptomEntriesCompanion Function({
      required String id,
      required DateTime loggedAt,
      required SymptomSeverity painSeverity,
      required SymptomSeverity acneSeverity,
      required WellbeingScale mood,
      required WellbeingScale energy,
      required WellbeingScale sleepQuality,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$SymptomEntriesTableUpdateCompanionBuilder =
    SymptomEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> loggedAt,
      Value<SymptomSeverity> painSeverity,
      Value<SymptomSeverity> acneSeverity,
      Value<WellbeingScale> mood,
      Value<WellbeingScale> energy,
      Value<WellbeingScale> sleepQuality,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$SymptomEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SymptomEntriesTable> {
  $$SymptomEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SymptomSeverity, SymptomSeverity, String>
  get painSeverity => $composableBuilder(
    column: $table.painSeverity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<SymptomSeverity, SymptomSeverity, String>
  get acneSeverity => $composableBuilder(
    column: $table.acneSeverity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<WellbeingScale, WellbeingScale, String>
  get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<WellbeingScale, WellbeingScale, String>
  get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<WellbeingScale, WellbeingScale, String>
  get sleepQuality => $composableBuilder(
    column: $table.sleepQuality,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SymptomEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SymptomEntriesTable> {
  $$SymptomEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get painSeverity => $composableBuilder(
    column: $table.painSeverity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get acneSeverity => $composableBuilder(
    column: $table.acneSeverity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sleepQuality => $composableBuilder(
    column: $table.sleepQuality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SymptomEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SymptomEntriesTable> {
  $$SymptomEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SymptomSeverity, String> get painSeverity =>
      $composableBuilder(
        column: $table.painSeverity,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<SymptomSeverity, String> get acneSeverity =>
      $composableBuilder(
        column: $table.acneSeverity,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<WellbeingScale, String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WellbeingScale, String> get energy =>
      $composableBuilder(column: $table.energy, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WellbeingScale, String> get sleepQuality =>
      $composableBuilder(
        column: $table.sleepQuality,
        builder: (column) => column,
      );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$SymptomEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SymptomEntriesTable,
          SymptomEntry,
          $$SymptomEntriesTableFilterComposer,
          $$SymptomEntriesTableOrderingComposer,
          $$SymptomEntriesTableAnnotationComposer,
          $$SymptomEntriesTableCreateCompanionBuilder,
          $$SymptomEntriesTableUpdateCompanionBuilder,
          (
            SymptomEntry,
            BaseReferences<_$AppDatabase, $SymptomEntriesTable, SymptomEntry>,
          ),
          SymptomEntry,
          PrefetchHooks Function()
        > {
  $$SymptomEntriesTableTableManager(
    _$AppDatabase db,
    $SymptomEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SymptomEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SymptomEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SymptomEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<SymptomSeverity> painSeverity = const Value.absent(),
                Value<SymptomSeverity> acneSeverity = const Value.absent(),
                Value<WellbeingScale> mood = const Value.absent(),
                Value<WellbeingScale> energy = const Value.absent(),
                Value<WellbeingScale> sleepQuality = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SymptomEntriesCompanion(
                id: id,
                loggedAt: loggedAt,
                painSeverity: painSeverity,
                acneSeverity: acneSeverity,
                mood: mood,
                energy: energy,
                sleepQuality: sleepQuality,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime loggedAt,
                required SymptomSeverity painSeverity,
                required SymptomSeverity acneSeverity,
                required WellbeingScale mood,
                required WellbeingScale energy,
                required WellbeingScale sleepQuality,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SymptomEntriesCompanion.insert(
                id: id,
                loggedAt: loggedAt,
                painSeverity: painSeverity,
                acneSeverity: acneSeverity,
                mood: mood,
                energy: energy,
                sleepQuality: sleepQuality,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SymptomEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SymptomEntriesTable,
      SymptomEntry,
      $$SymptomEntriesTableFilterComposer,
      $$SymptomEntriesTableOrderingComposer,
      $$SymptomEntriesTableAnnotationComposer,
      $$SymptomEntriesTableCreateCompanionBuilder,
      $$SymptomEntriesTableUpdateCompanionBuilder,
      (
        SymptomEntry,
        BaseReferences<_$AppDatabase, $SymptomEntriesTable, SymptomEntry>,
      ),
      SymptomEntry,
      PrefetchHooks Function()
    >;
typedef $$HabitLogsTableCreateCompanionBuilder =
    HabitLogsCompanion Function({
      required String id,
      required DateTime loggedAt,
      required int movementMinutes,
      required int hydrationGlasses,
      required double sleepHours,
      required WellbeingScale stressLevel,
      Value<int> rowid,
    });
typedef $$HabitLogsTableUpdateCompanionBuilder =
    HabitLogsCompanion Function({
      Value<String> id,
      Value<DateTime> loggedAt,
      Value<int> movementMinutes,
      Value<int> hydrationGlasses,
      Value<double> sleepHours,
      Value<WellbeingScale> stressLevel,
      Value<int> rowid,
    });

class $$HabitLogsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get movementMinutes => $composableBuilder(
    column: $table.movementMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hydrationGlasses => $composableBuilder(
    column: $table.hydrationGlasses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WellbeingScale, WellbeingScale, String>
  get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$HabitLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get movementMinutes => $composableBuilder(
    column: $table.movementMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hydrationGlasses => $composableBuilder(
    column: $table.hydrationGlasses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stressLevel => $composableBuilder(
    column: $table.stressLevel,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<int> get movementMinutes => $composableBuilder(
    column: $table.movementMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hydrationGlasses => $composableBuilder(
    column: $table.hydrationGlasses,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<WellbeingScale, String> get stressLevel =>
      $composableBuilder(
        column: $table.stressLevel,
        builder: (column) => column,
      );
}

class $$HabitLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitLogsTable,
          HabitLog,
          $$HabitLogsTableFilterComposer,
          $$HabitLogsTableOrderingComposer,
          $$HabitLogsTableAnnotationComposer,
          $$HabitLogsTableCreateCompanionBuilder,
          $$HabitLogsTableUpdateCompanionBuilder,
          (HabitLog, BaseReferences<_$AppDatabase, $HabitLogsTable, HabitLog>),
          HabitLog,
          PrefetchHooks Function()
        > {
  $$HabitLogsTableTableManager(_$AppDatabase db, $HabitLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> movementMinutes = const Value.absent(),
                Value<int> hydrationGlasses = const Value.absent(),
                Value<double> sleepHours = const Value.absent(),
                Value<WellbeingScale> stressLevel = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitLogsCompanion(
                id: id,
                loggedAt: loggedAt,
                movementMinutes: movementMinutes,
                hydrationGlasses: hydrationGlasses,
                sleepHours: sleepHours,
                stressLevel: stressLevel,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime loggedAt,
                required int movementMinutes,
                required int hydrationGlasses,
                required double sleepHours,
                required WellbeingScale stressLevel,
                Value<int> rowid = const Value.absent(),
              }) => HabitLogsCompanion.insert(
                id: id,
                loggedAt: loggedAt,
                movementMinutes: movementMinutes,
                hydrationGlasses: hydrationGlasses,
                sleepHours: sleepHours,
                stressLevel: stressLevel,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HabitLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitLogsTable,
      HabitLog,
      $$HabitLogsTableFilterComposer,
      $$HabitLogsTableOrderingComposer,
      $$HabitLogsTableAnnotationComposer,
      $$HabitLogsTableCreateCompanionBuilder,
      $$HabitLogsTableUpdateCompanionBuilder,
      (HabitLog, BaseReferences<_$AppDatabase, $HabitLogsTable, HabitLog>),
      HabitLog,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$MedicationLogsTableTableManager get medicationLogs =>
      $$MedicationLogsTableTableManager(_db, _db.medicationLogs);
  $$CycleEntriesTableTableManager get cycleEntries =>
      $$CycleEntriesTableTableManager(_db, _db.cycleEntries);
  $$SymptomEntriesTableTableManager get symptomEntries =>
      $$SymptomEntriesTableTableManager(_db, _db.symptomEntries);
  $$HabitLogsTableTableManager get habitLogs =>
      $$HabitLogsTableTableManager(_db, _db.habitLogs);
}
