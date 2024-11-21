// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_db.dart';

// ignore_for_file: type=lint
class $HabitTableTable extends HabitTable
    with TableInfo<$HabitTableTable, HabitTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _habitMeta = const VerificationMeta('habit');
  @override
  late final GeneratedColumn<String> habit = GeneratedColumn<String>(
      'habit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _selectedPeriodicityMeta =
      const VerificationMeta('selectedPeriodicity');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      selectedPeriodicity = GeneratedColumn<String>(
              'selected_periodicity', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $HabitTableTable.$converterselectedPeriodicity);
  static const VerificationMeta _selectedTimeOfDayMeta =
      const VerificationMeta('selectedTimeOfDay');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      selectedTimeOfDay = GeneratedColumn<String>(
              'selected_time_of_day', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $HabitTableTable.$converterselectedTimeOfDay);
  static const VerificationMeta _streakMeta = const VerificationMeta('streak');
  @override
  late final GeneratedColumn<String> streak = GeneratedColumn<String>(
      'streak', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastDateTickedMeta =
      const VerificationMeta('lastDateTicked');
  @override
  late final GeneratedColumn<String> lastDateTicked = GeneratedColumn<String>(
      'last_date_ticked', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [habit, selectedPeriodicity, selectedTimeOfDay, streak, lastDateTicked];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_table';
  @override
  VerificationContext validateIntegrity(Insertable<HabitTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('habit')) {
      context.handle(
          _habitMeta, habit.isAcceptableOrUnknown(data['habit']!, _habitMeta));
    } else if (isInserting) {
      context.missing(_habitMeta);
    }
    context.handle(
        _selectedPeriodicityMeta, const VerificationResult.success());
    context.handle(_selectedTimeOfDayMeta, const VerificationResult.success());
    if (data.containsKey('streak')) {
      context.handle(_streakMeta,
          streak.isAcceptableOrUnknown(data['streak']!, _streakMeta));
    } else if (isInserting) {
      context.missing(_streakMeta);
    }
    if (data.containsKey('last_date_ticked')) {
      context.handle(
          _lastDateTickedMeta,
          lastDateTicked.isAcceptableOrUnknown(
              data['last_date_ticked']!, _lastDateTickedMeta));
    } else if (isInserting) {
      context.missing(_lastDateTickedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {habit};
  @override
  HabitTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitTableData(
      habit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habit'])!,
      selectedPeriodicity: $HabitTableTable.$converterselectedPeriodicity
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}selected_periodicity'])!),
      selectedTimeOfDay: $HabitTableTable.$converterselectedTimeOfDay.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}selected_time_of_day'])!),
      streak: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}streak'])!,
      lastDateTicked: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_date_ticked'])!,
    );
  }

  @override
  $HabitTableTable createAlias(String alias) {
    return $HabitTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterselectedPeriodicity =
      StringListTypeConverter();
  static TypeConverter<List<String>, String> $converterselectedTimeOfDay =
      StringListTypeConverter();
}

class HabitTableData extends DataClass implements Insertable<HabitTableData> {
  final String habit;
  final List<String> selectedPeriodicity;
  final List<String> selectedTimeOfDay;
  final String streak;
  final String lastDateTicked;
  const HabitTableData(
      {required this.habit,
      required this.selectedPeriodicity,
      required this.selectedTimeOfDay,
      required this.streak,
      required this.lastDateTicked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['habit'] = Variable<String>(habit);
    {
      map['selected_periodicity'] = Variable<String>($HabitTableTable
          .$converterselectedPeriodicity
          .toSql(selectedPeriodicity));
    }
    {
      map['selected_time_of_day'] = Variable<String>($HabitTableTable
          .$converterselectedTimeOfDay
          .toSql(selectedTimeOfDay));
    }
    map['streak'] = Variable<String>(streak);
    map['last_date_ticked'] = Variable<String>(lastDateTicked);
    return map;
  }

  HabitTableCompanion toCompanion(bool nullToAbsent) {
    return HabitTableCompanion(
      habit: Value(habit),
      selectedPeriodicity: Value(selectedPeriodicity),
      selectedTimeOfDay: Value(selectedTimeOfDay),
      streak: Value(streak),
      lastDateTicked: Value(lastDateTicked),
    );
  }

  factory HabitTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitTableData(
      habit: serializer.fromJson<String>(json['habit']),
      selectedPeriodicity:
          serializer.fromJson<List<String>>(json['selectedPeriodicity']),
      selectedTimeOfDay:
          serializer.fromJson<List<String>>(json['selectedTimeOfDay']),
      streak: serializer.fromJson<String>(json['streak']),
      lastDateTicked: serializer.fromJson<String>(json['lastDateTicked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'habit': serializer.toJson<String>(habit),
      'selectedPeriodicity':
          serializer.toJson<List<String>>(selectedPeriodicity),
      'selectedTimeOfDay': serializer.toJson<List<String>>(selectedTimeOfDay),
      'streak': serializer.toJson<String>(streak),
      'lastDateTicked': serializer.toJson<String>(lastDateTicked),
    };
  }

  HabitTableData copyWith(
          {String? habit,
          List<String>? selectedPeriodicity,
          List<String>? selectedTimeOfDay,
          String? streak,
          String? lastDateTicked}) =>
      HabitTableData(
        habit: habit ?? this.habit,
        selectedPeriodicity: selectedPeriodicity ?? this.selectedPeriodicity,
        selectedTimeOfDay: selectedTimeOfDay ?? this.selectedTimeOfDay,
        streak: streak ?? this.streak,
        lastDateTicked: lastDateTicked ?? this.lastDateTicked,
      );
  HabitTableData copyWithCompanion(HabitTableCompanion data) {
    return HabitTableData(
      habit: data.habit.present ? data.habit.value : this.habit,
      selectedPeriodicity: data.selectedPeriodicity.present
          ? data.selectedPeriodicity.value
          : this.selectedPeriodicity,
      selectedTimeOfDay: data.selectedTimeOfDay.present
          ? data.selectedTimeOfDay.value
          : this.selectedTimeOfDay,
      streak: data.streak.present ? data.streak.value : this.streak,
      lastDateTicked: data.lastDateTicked.present
          ? data.lastDateTicked.value
          : this.lastDateTicked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitTableData(')
          ..write('habit: $habit, ')
          ..write('selectedPeriodicity: $selectedPeriodicity, ')
          ..write('selectedTimeOfDay: $selectedTimeOfDay, ')
          ..write('streak: $streak, ')
          ..write('lastDateTicked: $lastDateTicked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      habit, selectedPeriodicity, selectedTimeOfDay, streak, lastDateTicked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitTableData &&
          other.habit == this.habit &&
          other.selectedPeriodicity == this.selectedPeriodicity &&
          other.selectedTimeOfDay == this.selectedTimeOfDay &&
          other.streak == this.streak &&
          other.lastDateTicked == this.lastDateTicked);
}

class HabitTableCompanion extends UpdateCompanion<HabitTableData> {
  final Value<String> habit;
  final Value<List<String>> selectedPeriodicity;
  final Value<List<String>> selectedTimeOfDay;
  final Value<String> streak;
  final Value<String> lastDateTicked;
  final Value<int> rowid;
  const HabitTableCompanion({
    this.habit = const Value.absent(),
    this.selectedPeriodicity = const Value.absent(),
    this.selectedTimeOfDay = const Value.absent(),
    this.streak = const Value.absent(),
    this.lastDateTicked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitTableCompanion.insert({
    required String habit,
    required List<String> selectedPeriodicity,
    required List<String> selectedTimeOfDay,
    required String streak,
    required String lastDateTicked,
    this.rowid = const Value.absent(),
  })  : habit = Value(habit),
        selectedPeriodicity = Value(selectedPeriodicity),
        selectedTimeOfDay = Value(selectedTimeOfDay),
        streak = Value(streak),
        lastDateTicked = Value(lastDateTicked);
  static Insertable<HabitTableData> custom({
    Expression<String>? habit,
    Expression<String>? selectedPeriodicity,
    Expression<String>? selectedTimeOfDay,
    Expression<String>? streak,
    Expression<String>? lastDateTicked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (habit != null) 'habit': habit,
      if (selectedPeriodicity != null)
        'selected_periodicity': selectedPeriodicity,
      if (selectedTimeOfDay != null) 'selected_time_of_day': selectedTimeOfDay,
      if (streak != null) 'streak': streak,
      if (lastDateTicked != null) 'last_date_ticked': lastDateTicked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitTableCompanion copyWith(
      {Value<String>? habit,
      Value<List<String>>? selectedPeriodicity,
      Value<List<String>>? selectedTimeOfDay,
      Value<String>? streak,
      Value<String>? lastDateTicked,
      Value<int>? rowid}) {
    return HabitTableCompanion(
      habit: habit ?? this.habit,
      selectedPeriodicity: selectedPeriodicity ?? this.selectedPeriodicity,
      selectedTimeOfDay: selectedTimeOfDay ?? this.selectedTimeOfDay,
      streak: streak ?? this.streak,
      lastDateTicked: lastDateTicked ?? this.lastDateTicked,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (habit.present) {
      map['habit'] = Variable<String>(habit.value);
    }
    if (selectedPeriodicity.present) {
      map['selected_periodicity'] = Variable<String>($HabitTableTable
          .$converterselectedPeriodicity
          .toSql(selectedPeriodicity.value));
    }
    if (selectedTimeOfDay.present) {
      map['selected_time_of_day'] = Variable<String>($HabitTableTable
          .$converterselectedTimeOfDay
          .toSql(selectedTimeOfDay.value));
    }
    if (streak.present) {
      map['streak'] = Variable<String>(streak.value);
    }
    if (lastDateTicked.present) {
      map['last_date_ticked'] = Variable<String>(lastDateTicked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitTableCompanion(')
          ..write('habit: $habit, ')
          ..write('selectedPeriodicity: $selectedPeriodicity, ')
          ..write('selectedTimeOfDay: $selectedTimeOfDay, ')
          ..write('streak: $streak, ')
          ..write('lastDateTicked: $lastDateTicked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$HabitDb extends GeneratedDatabase {
  _$HabitDb(QueryExecutor e) : super(e);
  $HabitDbManager get managers => $HabitDbManager(this);
  late final $HabitTableTable habitTable = $HabitTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [habitTable];
}

typedef $$HabitTableTableCreateCompanionBuilder = HabitTableCompanion Function({
  required String habit,
  required List<String> selectedPeriodicity,
  required List<String> selectedTimeOfDay,
  required String streak,
  required String lastDateTicked,
  Value<int> rowid,
});
typedef $$HabitTableTableUpdateCompanionBuilder = HabitTableCompanion Function({
  Value<String> habit,
  Value<List<String>> selectedPeriodicity,
  Value<List<String>> selectedTimeOfDay,
  Value<String> streak,
  Value<String> lastDateTicked,
  Value<int> rowid,
});

class $$HabitTableTableFilterComposer
    extends Composer<_$HabitDb, $HabitTableTable> {
  $$HabitTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get habit => $composableBuilder(
      column: $table.habit, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get selectedPeriodicity => $composableBuilder(
          column: $table.selectedPeriodicity,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get selectedTimeOfDay => $composableBuilder(
          column: $table.selectedTimeOfDay,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get streak => $composableBuilder(
      column: $table.streak, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastDateTicked => $composableBuilder(
      column: $table.lastDateTicked,
      builder: (column) => ColumnFilters(column));
}

class $$HabitTableTableOrderingComposer
    extends Composer<_$HabitDb, $HabitTableTable> {
  $$HabitTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get habit => $composableBuilder(
      column: $table.habit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get selectedPeriodicity => $composableBuilder(
      column: $table.selectedPeriodicity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get selectedTimeOfDay => $composableBuilder(
      column: $table.selectedTimeOfDay,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get streak => $composableBuilder(
      column: $table.streak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastDateTicked => $composableBuilder(
      column: $table.lastDateTicked,
      builder: (column) => ColumnOrderings(column));
}

class $$HabitTableTableAnnotationComposer
    extends Composer<_$HabitDb, $HabitTableTable> {
  $$HabitTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get habit =>
      $composableBuilder(column: $table.habit, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get selectedPeriodicity => $composableBuilder(
          column: $table.selectedPeriodicity, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get selectedTimeOfDay => $composableBuilder(
          column: $table.selectedTimeOfDay, builder: (column) => column);

  GeneratedColumn<String> get streak =>
      $composableBuilder(column: $table.streak, builder: (column) => column);

  GeneratedColumn<String> get lastDateTicked => $composableBuilder(
      column: $table.lastDateTicked, builder: (column) => column);
}

class $$HabitTableTableTableManager extends RootTableManager<
    _$HabitDb,
    $HabitTableTable,
    HabitTableData,
    $$HabitTableTableFilterComposer,
    $$HabitTableTableOrderingComposer,
    $$HabitTableTableAnnotationComposer,
    $$HabitTableTableCreateCompanionBuilder,
    $$HabitTableTableUpdateCompanionBuilder,
    (
      HabitTableData,
      BaseReferences<_$HabitDb, $HabitTableTable, HabitTableData>
    ),
    HabitTableData,
    PrefetchHooks Function()> {
  $$HabitTableTableTableManager(_$HabitDb db, $HabitTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> habit = const Value.absent(),
            Value<List<String>> selectedPeriodicity = const Value.absent(),
            Value<List<String>> selectedTimeOfDay = const Value.absent(),
            Value<String> streak = const Value.absent(),
            Value<String> lastDateTicked = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitTableCompanion(
            habit: habit,
            selectedPeriodicity: selectedPeriodicity,
            selectedTimeOfDay: selectedTimeOfDay,
            streak: streak,
            lastDateTicked: lastDateTicked,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String habit,
            required List<String> selectedPeriodicity,
            required List<String> selectedTimeOfDay,
            required String streak,
            required String lastDateTicked,
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitTableCompanion.insert(
            habit: habit,
            selectedPeriodicity: selectedPeriodicity,
            selectedTimeOfDay: selectedTimeOfDay,
            streak: streak,
            lastDateTicked: lastDateTicked,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitTableTableProcessedTableManager = ProcessedTableManager<
    _$HabitDb,
    $HabitTableTable,
    HabitTableData,
    $$HabitTableTableFilterComposer,
    $$HabitTableTableOrderingComposer,
    $$HabitTableTableAnnotationComposer,
    $$HabitTableTableCreateCompanionBuilder,
    $$HabitTableTableUpdateCompanionBuilder,
    (
      HabitTableData,
      BaseReferences<_$HabitDb, $HabitTableTable, HabitTableData>
    ),
    HabitTableData,
    PrefetchHooks Function()>;

class $HabitDbManager {
  final _$HabitDb _db;
  $HabitDbManager(this._db);
  $$HabitTableTableTableManager get habitTable =>
      $$HabitTableTableTableManager(_db, _db.habitTable);
}
