// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mce_database.dart';

// ignore_for_file: type=lint
class $SportsfieldsTable extends Sportsfields
    with TableInfo<$SportsfieldsTable, Sportsfield> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SportsfieldsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameSportsfieldsMeta =
      const VerificationMeta('nameSportsfields');
  @override
  late final GeneratedColumn<String> nameSportsfields = GeneratedColumn<String>(
      'name_sportsfields', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nameSportsfields];
  @override
  String get aliasedName => _alias ?? 'sportsfields';
  @override
  String get actualTableName => 'sportsfields';
  @override
  VerificationContext validateIntegrity(Insertable<Sportsfield> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_sportsfields')) {
      context.handle(
          _nameSportsfieldsMeta,
          nameSportsfields.isAcceptableOrUnknown(
              data['name_sportsfields']!, _nameSportsfieldsMeta));
    } else if (isInserting) {
      context.missing(_nameSportsfieldsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sportsfield map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sportsfield(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameSportsfields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}name_sportsfields'])!,
    );
  }

  @override
  $SportsfieldsTable createAlias(String alias) {
    return $SportsfieldsTable(attachedDatabase, alias);
  }
}

class Sportsfield extends DataClass implements Insertable<Sportsfield> {
  final int id;
  final String nameSportsfields;
  const Sportsfield({required this.id, required this.nameSportsfields});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_sportsfields'] = Variable<String>(nameSportsfields);
    return map;
  }

  SportsfieldsCompanion toCompanion(bool nullToAbsent) {
    return SportsfieldsCompanion(
      id: Value(id),
      nameSportsfields: Value(nameSportsfields),
    );
  }

  factory Sportsfield.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sportsfield(
      id: serializer.fromJson<int>(json['id']),
      nameSportsfields: serializer.fromJson<String>(json['nameSportsfields']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameSportsfields': serializer.toJson<String>(nameSportsfields),
    };
  }

  Sportsfield copyWith({int? id, String? nameSportsfields}) => Sportsfield(
        id: id ?? this.id,
        nameSportsfields: nameSportsfields ?? this.nameSportsfields,
      );
  @override
  String toString() {
    return (StringBuffer('Sportsfield(')
          ..write('id: $id, ')
          ..write('nameSportsfields: $nameSportsfields')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameSportsfields);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sportsfield &&
          other.id == this.id &&
          other.nameSportsfields == this.nameSportsfields);
}

class SportsfieldsCompanion extends UpdateCompanion<Sportsfield> {
  final Value<int> id;
  final Value<String> nameSportsfields;
  const SportsfieldsCompanion({
    this.id = const Value.absent(),
    this.nameSportsfields = const Value.absent(),
  });
  SportsfieldsCompanion.insert({
    this.id = const Value.absent(),
    required String nameSportsfields,
  }) : nameSportsfields = Value(nameSportsfields);
  static Insertable<Sportsfield> custom({
    Expression<int>? id,
    Expression<String>? nameSportsfields,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameSportsfields != null) 'name_sportsfields': nameSportsfields,
    });
  }

  SportsfieldsCompanion copyWith(
      {Value<int>? id, Value<String>? nameSportsfields}) {
    return SportsfieldsCompanion(
      id: id ?? this.id,
      nameSportsfields: nameSportsfields ?? this.nameSportsfields,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameSportsfields.present) {
      map['name_sportsfields'] = Variable<String>(nameSportsfields.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SportsfieldsCompanion(')
          ..write('id: $id, ')
          ..write('nameSportsfields: $nameSportsfields')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameSportsfieldsMeta =
      const VerificationMeta('nameSportsfields');
  @override
  late final GeneratedColumn<String> nameSportsfields = GeneratedColumn<String>(
      'name_sportsfields', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schedulingDateMeta =
      const VerificationMeta('schedulingDate');
  @override
  late final GeneratedColumn<DateTime> schedulingDate =
      GeneratedColumn<DateTime>('scheduling_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _schedulerPersonMeta =
      const VerificationMeta('schedulerPerson');
  @override
  late final GeneratedColumn<String> schedulerPerson = GeneratedColumn<String>(
      'scheduler_person', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _percentageRainMeta =
      const VerificationMeta('percentageRain');
  @override
  late final GeneratedColumn<String> percentageRain = GeneratedColumn<String>(
      'percentage_rain', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nameSportsfields, schedulingDate, schedulerPerson, percentageRain];
  @override
  String get aliasedName => _alias ?? 'schedules';
  @override
  String get actualTableName => 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_sportsfields')) {
      context.handle(
          _nameSportsfieldsMeta,
          nameSportsfields.isAcceptableOrUnknown(
              data['name_sportsfields']!, _nameSportsfieldsMeta));
    } else if (isInserting) {
      context.missing(_nameSportsfieldsMeta);
    }
    if (data.containsKey('scheduling_date')) {
      context.handle(
          _schedulingDateMeta,
          schedulingDate.isAcceptableOrUnknown(
              data['scheduling_date']!, _schedulingDateMeta));
    } else if (isInserting) {
      context.missing(_schedulingDateMeta);
    }
    if (data.containsKey('scheduler_person')) {
      context.handle(
          _schedulerPersonMeta,
          schedulerPerson.isAcceptableOrUnknown(
              data['scheduler_person']!, _schedulerPersonMeta));
    } else if (isInserting) {
      context.missing(_schedulerPersonMeta);
    }
    if (data.containsKey('percentage_rain')) {
      context.handle(
          _percentageRainMeta,
          percentageRain.isAcceptableOrUnknown(
              data['percentage_rain']!, _percentageRainMeta));
    } else if (isInserting) {
      context.missing(_percentageRainMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Schedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameSportsfields: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}name_sportsfields'])!,
      schedulingDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduling_date'])!,
      schedulerPerson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}scheduler_person'])!,
      percentageRain: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}percentage_rain'])!,
    );
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final String nameSportsfields;
  final DateTime schedulingDate;
  final String schedulerPerson;
  final String percentageRain;
  const Schedule(
      {required this.id,
      required this.nameSportsfields,
      required this.schedulingDate,
      required this.schedulerPerson,
      required this.percentageRain});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_sportsfields'] = Variable<String>(nameSportsfields);
    map['scheduling_date'] = Variable<DateTime>(schedulingDate);
    map['scheduler_person'] = Variable<String>(schedulerPerson);
    map['percentage_rain'] = Variable<String>(percentageRain);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      nameSportsfields: Value(nameSportsfields),
      schedulingDate: Value(schedulingDate),
      schedulerPerson: Value(schedulerPerson),
      percentageRain: Value(percentageRain),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      nameSportsfields: serializer.fromJson<String>(json['nameSportsfields']),
      schedulingDate: serializer.fromJson<DateTime>(json['schedulingDate']),
      schedulerPerson: serializer.fromJson<String>(json['schedulerPerson']),
      percentageRain: serializer.fromJson<String>(json['percentageRain']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameSportsfields': serializer.toJson<String>(nameSportsfields),
      'schedulingDate': serializer.toJson<DateTime>(schedulingDate),
      'schedulerPerson': serializer.toJson<String>(schedulerPerson),
      'percentageRain': serializer.toJson<String>(percentageRain),
    };
  }

  Schedule copyWith(
          {int? id,
          String? nameSportsfields,
          DateTime? schedulingDate,
          String? schedulerPerson,
          String? percentageRain}) =>
      Schedule(
        id: id ?? this.id,
        nameSportsfields: nameSportsfields ?? this.nameSportsfields,
        schedulingDate: schedulingDate ?? this.schedulingDate,
        schedulerPerson: schedulerPerson ?? this.schedulerPerson,
        percentageRain: percentageRain ?? this.percentageRain,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('nameSportsfields: $nameSportsfields, ')
          ..write('schedulingDate: $schedulingDate, ')
          ..write('schedulerPerson: $schedulerPerson, ')
          ..write('percentageRain: $percentageRain')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, nameSportsfields, schedulingDate, schedulerPerson, percentageRain);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.nameSportsfields == this.nameSportsfields &&
          other.schedulingDate == this.schedulingDate &&
          other.schedulerPerson == this.schedulerPerson &&
          other.percentageRain == this.percentageRain);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<String> nameSportsfields;
  final Value<DateTime> schedulingDate;
  final Value<String> schedulerPerson;
  final Value<String> percentageRain;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.nameSportsfields = const Value.absent(),
    this.schedulingDate = const Value.absent(),
    this.schedulerPerson = const Value.absent(),
    this.percentageRain = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required String nameSportsfields,
    required DateTime schedulingDate,
    required String schedulerPerson,
    required String percentageRain,
  })  : nameSportsfields = Value(nameSportsfields),
        schedulingDate = Value(schedulingDate),
        schedulerPerson = Value(schedulerPerson),
        percentageRain = Value(percentageRain);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<String>? nameSportsfields,
    Expression<DateTime>? schedulingDate,
    Expression<String>? schedulerPerson,
    Expression<String>? percentageRain,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameSportsfields != null) 'name_sportsfields': nameSportsfields,
      if (schedulingDate != null) 'scheduling_date': schedulingDate,
      if (schedulerPerson != null) 'scheduler_person': schedulerPerson,
      if (percentageRain != null) 'percentage_rain': percentageRain,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameSportsfields,
      Value<DateTime>? schedulingDate,
      Value<String>? schedulerPerson,
      Value<String>? percentageRain}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      nameSportsfields: nameSportsfields ?? this.nameSportsfields,
      schedulingDate: schedulingDate ?? this.schedulingDate,
      schedulerPerson: schedulerPerson ?? this.schedulerPerson,
      percentageRain: percentageRain ?? this.percentageRain,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameSportsfields.present) {
      map['name_sportsfields'] = Variable<String>(nameSportsfields.value);
    }
    if (schedulingDate.present) {
      map['scheduling_date'] = Variable<DateTime>(schedulingDate.value);
    }
    if (schedulerPerson.present) {
      map['scheduler_person'] = Variable<String>(schedulerPerson.value);
    }
    if (percentageRain.present) {
      map['percentage_rain'] = Variable<String>(percentageRain.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('nameSportsfields: $nameSportsfields, ')
          ..write('schedulingDate: $schedulingDate, ')
          ..write('schedulerPerson: $schedulerPerson, ')
          ..write('percentageRain: $percentageRain')
          ..write(')'))
        .toString();
  }
}

abstract class _$MceDatabase extends GeneratedDatabase {
  _$MceDatabase(QueryExecutor e) : super(e);
  late final $SportsfieldsTable sportsfields = $SportsfieldsTable(this);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sportsfields, schedules];
}
