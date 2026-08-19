// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AsteroidsTable extends Asteroids
    with TableInfo<$AsteroidsTable, Asteroid> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AsteroidsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _asteroidNameMeta = const VerificationMeta(
    'asteroidName',
  );
  @override
  late final GeneratedColumn<String> asteroidName = GeneratedColumn<String>(
    'asteroid_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _m3Meta = const VerificationMeta('m3');
  @override
  late final GeneratedColumn<int> m3 = GeneratedColumn<int>(
    'm3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _surfaceMMeta = const VerificationMeta(
    'surfaceM',
  );
  @override
  late final GeneratedColumn<int> surfaceM = GeneratedColumn<int>(
    'surface_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _zeroGMMeta = const VerificationMeta('zeroGM');
  @override
  late final GeneratedColumn<int> zeroGM = GeneratedColumn<int>(
    'zero_g_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _conductiveMMeta = const VerificationMeta(
    'conductiveM',
  );
  @override
  late final GeneratedColumn<int> conductiveM = GeneratedColumn<int>(
    'conductive_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lifeSuppGMeta = const VerificationMeta(
    'lifeSuppG',
  );
  @override
  late final GeneratedColumn<int> lifeSuppG = GeneratedColumn<int>(
    'life_supp_g',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fuelGMeta = const VerificationMeta('fuelG');
  @override
  late final GeneratedColumn<int> fuelG = GeneratedColumn<int>(
    'fuel_g',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _oveMeta = const VerificationMeta('ove');
  @override
  late final GeneratedColumn<int> ove = GeneratedColumn<int>(
    'ove',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _waterIceMeta = const VerificationMeta(
    'waterIce',
  );
  @override
  late final GeneratedColumn<int> waterIce = GeneratedColumn<int>(
    'water_ice',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    asteroidName,
    m3,
    surfaceM,
    zeroGM,
    conductiveM,
    lifeSuppG,
    fuelG,
    ove,
    waterIce,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asteroids';
  @override
  VerificationContext validateIntegrity(
    Insertable<Asteroid> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('asteroid_name')) {
      context.handle(
        _asteroidNameMeta,
        asteroidName.isAcceptableOrUnknown(
          data['asteroid_name']!,
          _asteroidNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_asteroidNameMeta);
    }
    if (data.containsKey('m3')) {
      context.handle(_m3Meta, m3.isAcceptableOrUnknown(data['m3']!, _m3Meta));
    }
    if (data.containsKey('surface_m')) {
      context.handle(
        _surfaceMMeta,
        surfaceM.isAcceptableOrUnknown(data['surface_m']!, _surfaceMMeta),
      );
    }
    if (data.containsKey('zero_g_m')) {
      context.handle(
        _zeroGMMeta,
        zeroGM.isAcceptableOrUnknown(data['zero_g_m']!, _zeroGMMeta),
      );
    }
    if (data.containsKey('conductive_m')) {
      context.handle(
        _conductiveMMeta,
        conductiveM.isAcceptableOrUnknown(
          data['conductive_m']!,
          _conductiveMMeta,
        ),
      );
    }
    if (data.containsKey('life_supp_g')) {
      context.handle(
        _lifeSuppGMeta,
        lifeSuppG.isAcceptableOrUnknown(data['life_supp_g']!, _lifeSuppGMeta),
      );
    }
    if (data.containsKey('fuel_g')) {
      context.handle(
        _fuelGMeta,
        fuelG.isAcceptableOrUnknown(data['fuel_g']!, _fuelGMeta),
      );
    }
    if (data.containsKey('ove')) {
      context.handle(
        _oveMeta,
        ove.isAcceptableOrUnknown(data['ove']!, _oveMeta),
      );
    }
    if (data.containsKey('water_ice')) {
      context.handle(
        _waterIceMeta,
        waterIce.isAcceptableOrUnknown(data['water_ice']!, _waterIceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Asteroid map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Asteroid(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      asteroidName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asteroid_name'],
      )!,
      m3: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}m3'],
      )!,
      surfaceM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surface_m'],
      )!,
      zeroGM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}zero_g_m'],
      )!,
      conductiveM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}conductive_m'],
      )!,
      lifeSuppG: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}life_supp_g'],
      )!,
      fuelG: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fuel_g'],
      )!,
      ove: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ove'],
      )!,
      waterIce: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}water_ice'],
      )!,
    );
  }

  @override
  $AsteroidsTable createAlias(String alias) {
    return $AsteroidsTable(attachedDatabase, alias);
  }
}

class Asteroid extends DataClass implements Insertable<Asteroid> {
  final int id;
  final String asteroidName;
  final int m3;
  final int surfaceM;
  final int zeroGM;
  final int conductiveM;
  final int lifeSuppG;
  final int fuelG;
  final int ove;
  final int waterIce;
  const Asteroid({
    required this.id,
    required this.asteroidName,
    required this.m3,
    required this.surfaceM,
    required this.zeroGM,
    required this.conductiveM,
    required this.lifeSuppG,
    required this.fuelG,
    required this.ove,
    required this.waterIce,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['asteroid_name'] = Variable<String>(asteroidName);
    map['m3'] = Variable<int>(m3);
    map['surface_m'] = Variable<int>(surfaceM);
    map['zero_g_m'] = Variable<int>(zeroGM);
    map['conductive_m'] = Variable<int>(conductiveM);
    map['life_supp_g'] = Variable<int>(lifeSuppG);
    map['fuel_g'] = Variable<int>(fuelG);
    map['ove'] = Variable<int>(ove);
    map['water_ice'] = Variable<int>(waterIce);
    return map;
  }

  AsteroidsCompanion toCompanion(bool nullToAbsent) {
    return AsteroidsCompanion(
      id: Value(id),
      asteroidName: Value(asteroidName),
      m3: Value(m3),
      surfaceM: Value(surfaceM),
      zeroGM: Value(zeroGM),
      conductiveM: Value(conductiveM),
      lifeSuppG: Value(lifeSuppG),
      fuelG: Value(fuelG),
      ove: Value(ove),
      waterIce: Value(waterIce),
    );
  }

  factory Asteroid.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Asteroid(
      id: serializer.fromJson<int>(json['id']),
      asteroidName: serializer.fromJson<String>(json['asteroidName']),
      m3: serializer.fromJson<int>(json['m3']),
      surfaceM: serializer.fromJson<int>(json['surfaceM']),
      zeroGM: serializer.fromJson<int>(json['zeroGM']),
      conductiveM: serializer.fromJson<int>(json['conductiveM']),
      lifeSuppG: serializer.fromJson<int>(json['lifeSuppG']),
      fuelG: serializer.fromJson<int>(json['fuelG']),
      ove: serializer.fromJson<int>(json['ove']),
      waterIce: serializer.fromJson<int>(json['waterIce']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'asteroidName': serializer.toJson<String>(asteroidName),
      'm3': serializer.toJson<int>(m3),
      'surfaceM': serializer.toJson<int>(surfaceM),
      'zeroGM': serializer.toJson<int>(zeroGM),
      'conductiveM': serializer.toJson<int>(conductiveM),
      'lifeSuppG': serializer.toJson<int>(lifeSuppG),
      'fuelG': serializer.toJson<int>(fuelG),
      'ove': serializer.toJson<int>(ove),
      'waterIce': serializer.toJson<int>(waterIce),
    };
  }

  Asteroid copyWith({
    int? id,
    String? asteroidName,
    int? m3,
    int? surfaceM,
    int? zeroGM,
    int? conductiveM,
    int? lifeSuppG,
    int? fuelG,
    int? ove,
    int? waterIce,
  }) => Asteroid(
    id: id ?? this.id,
    asteroidName: asteroidName ?? this.asteroidName,
    m3: m3 ?? this.m3,
    surfaceM: surfaceM ?? this.surfaceM,
    zeroGM: zeroGM ?? this.zeroGM,
    conductiveM: conductiveM ?? this.conductiveM,
    lifeSuppG: lifeSuppG ?? this.lifeSuppG,
    fuelG: fuelG ?? this.fuelG,
    ove: ove ?? this.ove,
    waterIce: waterIce ?? this.waterIce,
  );
  Asteroid copyWithCompanion(AsteroidsCompanion data) {
    return Asteroid(
      id: data.id.present ? data.id.value : this.id,
      asteroidName: data.asteroidName.present
          ? data.asteroidName.value
          : this.asteroidName,
      m3: data.m3.present ? data.m3.value : this.m3,
      surfaceM: data.surfaceM.present ? data.surfaceM.value : this.surfaceM,
      zeroGM: data.zeroGM.present ? data.zeroGM.value : this.zeroGM,
      conductiveM: data.conductiveM.present
          ? data.conductiveM.value
          : this.conductiveM,
      lifeSuppG: data.lifeSuppG.present ? data.lifeSuppG.value : this.lifeSuppG,
      fuelG: data.fuelG.present ? data.fuelG.value : this.fuelG,
      ove: data.ove.present ? data.ove.value : this.ove,
      waterIce: data.waterIce.present ? data.waterIce.value : this.waterIce,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Asteroid(')
          ..write('id: $id, ')
          ..write('asteroidName: $asteroidName, ')
          ..write('m3: $m3, ')
          ..write('surfaceM: $surfaceM, ')
          ..write('zeroGM: $zeroGM, ')
          ..write('conductiveM: $conductiveM, ')
          ..write('lifeSuppG: $lifeSuppG, ')
          ..write('fuelG: $fuelG, ')
          ..write('ove: $ove, ')
          ..write('waterIce: $waterIce')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    asteroidName,
    m3,
    surfaceM,
    zeroGM,
    conductiveM,
    lifeSuppG,
    fuelG,
    ove,
    waterIce,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Asteroid &&
          other.id == this.id &&
          other.asteroidName == this.asteroidName &&
          other.m3 == this.m3 &&
          other.surfaceM == this.surfaceM &&
          other.zeroGM == this.zeroGM &&
          other.conductiveM == this.conductiveM &&
          other.lifeSuppG == this.lifeSuppG &&
          other.fuelG == this.fuelG &&
          other.ove == this.ove &&
          other.waterIce == this.waterIce);
}

class AsteroidsCompanion extends UpdateCompanion<Asteroid> {
  final Value<int> id;
  final Value<String> asteroidName;
  final Value<int> m3;
  final Value<int> surfaceM;
  final Value<int> zeroGM;
  final Value<int> conductiveM;
  final Value<int> lifeSuppG;
  final Value<int> fuelG;
  final Value<int> ove;
  final Value<int> waterIce;
  const AsteroidsCompanion({
    this.id = const Value.absent(),
    this.asteroidName = const Value.absent(),
    this.m3 = const Value.absent(),
    this.surfaceM = const Value.absent(),
    this.zeroGM = const Value.absent(),
    this.conductiveM = const Value.absent(),
    this.lifeSuppG = const Value.absent(),
    this.fuelG = const Value.absent(),
    this.ove = const Value.absent(),
    this.waterIce = const Value.absent(),
  });
  AsteroidsCompanion.insert({
    this.id = const Value.absent(),
    required String asteroidName,
    this.m3 = const Value.absent(),
    this.surfaceM = const Value.absent(),
    this.zeroGM = const Value.absent(),
    this.conductiveM = const Value.absent(),
    this.lifeSuppG = const Value.absent(),
    this.fuelG = const Value.absent(),
    this.ove = const Value.absent(),
    this.waterIce = const Value.absent(),
  }) : asteroidName = Value(asteroidName);
  static Insertable<Asteroid> custom({
    Expression<int>? id,
    Expression<String>? asteroidName,
    Expression<int>? m3,
    Expression<int>? surfaceM,
    Expression<int>? zeroGM,
    Expression<int>? conductiveM,
    Expression<int>? lifeSuppG,
    Expression<int>? fuelG,
    Expression<int>? ove,
    Expression<int>? waterIce,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (asteroidName != null) 'asteroid_name': asteroidName,
      if (m3 != null) 'm3': m3,
      if (surfaceM != null) 'surface_m': surfaceM,
      if (zeroGM != null) 'zero_g_m': zeroGM,
      if (conductiveM != null) 'conductive_m': conductiveM,
      if (lifeSuppG != null) 'life_supp_g': lifeSuppG,
      if (fuelG != null) 'fuel_g': fuelG,
      if (ove != null) 'ove': ove,
      if (waterIce != null) 'water_ice': waterIce,
    });
  }

  AsteroidsCompanion copyWith({
    Value<int>? id,
    Value<String>? asteroidName,
    Value<int>? m3,
    Value<int>? surfaceM,
    Value<int>? zeroGM,
    Value<int>? conductiveM,
    Value<int>? lifeSuppG,
    Value<int>? fuelG,
    Value<int>? ove,
    Value<int>? waterIce,
  }) {
    return AsteroidsCompanion(
      id: id ?? this.id,
      asteroidName: asteroidName ?? this.asteroidName,
      m3: m3 ?? this.m3,
      surfaceM: surfaceM ?? this.surfaceM,
      zeroGM: zeroGM ?? this.zeroGM,
      conductiveM: conductiveM ?? this.conductiveM,
      lifeSuppG: lifeSuppG ?? this.lifeSuppG,
      fuelG: fuelG ?? this.fuelG,
      ove: ove ?? this.ove,
      waterIce: waterIce ?? this.waterIce,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (asteroidName.present) {
      map['asteroid_name'] = Variable<String>(asteroidName.value);
    }
    if (m3.present) {
      map['m3'] = Variable<int>(m3.value);
    }
    if (surfaceM.present) {
      map['surface_m'] = Variable<int>(surfaceM.value);
    }
    if (zeroGM.present) {
      map['zero_g_m'] = Variable<int>(zeroGM.value);
    }
    if (conductiveM.present) {
      map['conductive_m'] = Variable<int>(conductiveM.value);
    }
    if (lifeSuppG.present) {
      map['life_supp_g'] = Variable<int>(lifeSuppG.value);
    }
    if (fuelG.present) {
      map['fuel_g'] = Variable<int>(fuelG.value);
    }
    if (ove.present) {
      map['ove'] = Variable<int>(ove.value);
    }
    if (waterIce.present) {
      map['water_ice'] = Variable<int>(waterIce.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AsteroidsCompanion(')
          ..write('id: $id, ')
          ..write('asteroidName: $asteroidName, ')
          ..write('m3: $m3, ')
          ..write('surfaceM: $surfaceM, ')
          ..write('zeroGM: $zeroGM, ')
          ..write('conductiveM: $conductiveM, ')
          ..write('lifeSuppG: $lifeSuppG, ')
          ..write('fuelG: $fuelG, ')
          ..write('ove: $ove, ')
          ..write('waterIce: $waterIce')
          ..write(')'))
        .toString();
  }
}

class $AsteroidsScannedTable extends AsteroidsScanned
    with TableInfo<$AsteroidsScannedTable, AsteroidScanned> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AsteroidsScannedTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _gameTurnMeta = const VerificationMeta(
    'gameTurn',
  );
  @override
  late final GeneratedColumn<int> gameTurn = GeneratedColumn<int>(
    'game_turn',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _asteroidNameMeta = const VerificationMeta(
    'asteroidName',
  );
  @override
  late final GeneratedColumn<String> asteroidName = GeneratedColumn<String>(
    'asteroid_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, gameTurn, corpName, asteroidName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asteroids_scanned';
  @override
  VerificationContext validateIntegrity(
    Insertable<AsteroidScanned> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_turn')) {
      context.handle(
        _gameTurnMeta,
        gameTurn.isAcceptableOrUnknown(data['game_turn']!, _gameTurnMeta),
      );
    } else if (isInserting) {
      context.missing(_gameTurnMeta);
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('asteroid_name')) {
      context.handle(
        _asteroidNameMeta,
        asteroidName.isAcceptableOrUnknown(
          data['asteroid_name']!,
          _asteroidNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_asteroidNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AsteroidScanned map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AsteroidScanned(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameTurn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_turn'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      asteroidName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asteroid_name'],
      )!,
    );
  }

  @override
  $AsteroidsScannedTable createAlias(String alias) {
    return $AsteroidsScannedTable(attachedDatabase, alias);
  }
}

class AsteroidScanned extends DataClass implements Insertable<AsteroidScanned> {
  final int id;
  final int gameTurn;
  final String corpName;
  final String asteroidName;
  const AsteroidScanned({
    required this.id,
    required this.gameTurn,
    required this.corpName,
    required this.asteroidName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_turn'] = Variable<int>(gameTurn);
    map['corp_name'] = Variable<String>(corpName);
    map['asteroid_name'] = Variable<String>(asteroidName);
    return map;
  }

  AsteroidsScannedCompanion toCompanion(bool nullToAbsent) {
    return AsteroidsScannedCompanion(
      id: Value(id),
      gameTurn: Value(gameTurn),
      corpName: Value(corpName),
      asteroidName: Value(asteroidName),
    );
  }

  factory AsteroidScanned.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AsteroidScanned(
      id: serializer.fromJson<int>(json['id']),
      gameTurn: serializer.fromJson<int>(json['gameTurn']),
      corpName: serializer.fromJson<String>(json['corpName']),
      asteroidName: serializer.fromJson<String>(json['asteroidName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameTurn': serializer.toJson<int>(gameTurn),
      'corpName': serializer.toJson<String>(corpName),
      'asteroidName': serializer.toJson<String>(asteroidName),
    };
  }

  AsteroidScanned copyWith({
    int? id,
    int? gameTurn,
    String? corpName,
    String? asteroidName,
  }) => AsteroidScanned(
    id: id ?? this.id,
    gameTurn: gameTurn ?? this.gameTurn,
    corpName: corpName ?? this.corpName,
    asteroidName: asteroidName ?? this.asteroidName,
  );
  AsteroidScanned copyWithCompanion(AsteroidsScannedCompanion data) {
    return AsteroidScanned(
      id: data.id.present ? data.id.value : this.id,
      gameTurn: data.gameTurn.present ? data.gameTurn.value : this.gameTurn,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      asteroidName: data.asteroidName.present
          ? data.asteroidName.value
          : this.asteroidName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AsteroidScanned(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('corpName: $corpName, ')
          ..write('asteroidName: $asteroidName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameTurn, corpName, asteroidName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AsteroidScanned &&
          other.id == this.id &&
          other.gameTurn == this.gameTurn &&
          other.corpName == this.corpName &&
          other.asteroidName == this.asteroidName);
}

class AsteroidsScannedCompanion extends UpdateCompanion<AsteroidScanned> {
  final Value<int> id;
  final Value<int> gameTurn;
  final Value<String> corpName;
  final Value<String> asteroidName;
  const AsteroidsScannedCompanion({
    this.id = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.corpName = const Value.absent(),
    this.asteroidName = const Value.absent(),
  });
  AsteroidsScannedCompanion.insert({
    this.id = const Value.absent(),
    required int gameTurn,
    required String corpName,
    required String asteroidName,
  }) : gameTurn = Value(gameTurn),
       corpName = Value(corpName),
       asteroidName = Value(asteroidName);
  static Insertable<AsteroidScanned> custom({
    Expression<int>? id,
    Expression<int>? gameTurn,
    Expression<String>? corpName,
    Expression<String>? asteroidName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameTurn != null) 'game_turn': gameTurn,
      if (corpName != null) 'corp_name': corpName,
      if (asteroidName != null) 'asteroid_name': asteroidName,
    });
  }

  AsteroidsScannedCompanion copyWith({
    Value<int>? id,
    Value<int>? gameTurn,
    Value<String>? corpName,
    Value<String>? asteroidName,
  }) {
    return AsteroidsScannedCompanion(
      id: id ?? this.id,
      gameTurn: gameTurn ?? this.gameTurn,
      corpName: corpName ?? this.corpName,
      asteroidName: asteroidName ?? this.asteroidName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameTurn.present) {
      map['game_turn'] = Variable<int>(gameTurn.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (asteroidName.present) {
      map['asteroid_name'] = Variable<String>(asteroidName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AsteroidsScannedCompanion(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('corpName: $corpName, ')
          ..write('asteroidName: $asteroidName')
          ..write(')'))
        .toString();
  }
}

class $TempAsteroidsScannedTable extends TempAsteroidsScanned
    with TableInfo<$TempAsteroidsScannedTable, TempAsteroidScanned> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TempAsteroidsScannedTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _gameTurnMeta = const VerificationMeta(
    'gameTurn',
  );
  @override
  late final GeneratedColumn<int> gameTurn = GeneratedColumn<int>(
    'game_turn',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _asteroidNameMeta = const VerificationMeta(
    'asteroidName',
  );
  @override
  late final GeneratedColumn<String> asteroidName = GeneratedColumn<String>(
    'asteroid_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, gameTurn, corpName, asteroidName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'temp_asteroids_scanned';
  @override
  VerificationContext validateIntegrity(
    Insertable<TempAsteroidScanned> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_turn')) {
      context.handle(
        _gameTurnMeta,
        gameTurn.isAcceptableOrUnknown(data['game_turn']!, _gameTurnMeta),
      );
    } else if (isInserting) {
      context.missing(_gameTurnMeta);
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('asteroid_name')) {
      context.handle(
        _asteroidNameMeta,
        asteroidName.isAcceptableOrUnknown(
          data['asteroid_name']!,
          _asteroidNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_asteroidNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TempAsteroidScanned map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TempAsteroidScanned(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameTurn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_turn'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      asteroidName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asteroid_name'],
      )!,
    );
  }

  @override
  $TempAsteroidsScannedTable createAlias(String alias) {
    return $TempAsteroidsScannedTable(attachedDatabase, alias);
  }
}

class TempAsteroidScanned extends DataClass
    implements Insertable<TempAsteroidScanned> {
  final int id;
  final int gameTurn;
  final String corpName;
  final String asteroidName;
  const TempAsteroidScanned({
    required this.id,
    required this.gameTurn,
    required this.corpName,
    required this.asteroidName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_turn'] = Variable<int>(gameTurn);
    map['corp_name'] = Variable<String>(corpName);
    map['asteroid_name'] = Variable<String>(asteroidName);
    return map;
  }

  TempAsteroidsScannedCompanion toCompanion(bool nullToAbsent) {
    return TempAsteroidsScannedCompanion(
      id: Value(id),
      gameTurn: Value(gameTurn),
      corpName: Value(corpName),
      asteroidName: Value(asteroidName),
    );
  }

  factory TempAsteroidScanned.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TempAsteroidScanned(
      id: serializer.fromJson<int>(json['id']),
      gameTurn: serializer.fromJson<int>(json['gameTurn']),
      corpName: serializer.fromJson<String>(json['corpName']),
      asteroidName: serializer.fromJson<String>(json['asteroidName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameTurn': serializer.toJson<int>(gameTurn),
      'corpName': serializer.toJson<String>(corpName),
      'asteroidName': serializer.toJson<String>(asteroidName),
    };
  }

  TempAsteroidScanned copyWith({
    int? id,
    int? gameTurn,
    String? corpName,
    String? asteroidName,
  }) => TempAsteroidScanned(
    id: id ?? this.id,
    gameTurn: gameTurn ?? this.gameTurn,
    corpName: corpName ?? this.corpName,
    asteroidName: asteroidName ?? this.asteroidName,
  );
  TempAsteroidScanned copyWithCompanion(TempAsteroidsScannedCompanion data) {
    return TempAsteroidScanned(
      id: data.id.present ? data.id.value : this.id,
      gameTurn: data.gameTurn.present ? data.gameTurn.value : this.gameTurn,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      asteroidName: data.asteroidName.present
          ? data.asteroidName.value
          : this.asteroidName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TempAsteroidScanned(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('corpName: $corpName, ')
          ..write('asteroidName: $asteroidName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameTurn, corpName, asteroidName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TempAsteroidScanned &&
          other.id == this.id &&
          other.gameTurn == this.gameTurn &&
          other.corpName == this.corpName &&
          other.asteroidName == this.asteroidName);
}

class TempAsteroidsScannedCompanion
    extends UpdateCompanion<TempAsteroidScanned> {
  final Value<int> id;
  final Value<int> gameTurn;
  final Value<String> corpName;
  final Value<String> asteroidName;
  const TempAsteroidsScannedCompanion({
    this.id = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.corpName = const Value.absent(),
    this.asteroidName = const Value.absent(),
  });
  TempAsteroidsScannedCompanion.insert({
    this.id = const Value.absent(),
    required int gameTurn,
    required String corpName,
    required String asteroidName,
  }) : gameTurn = Value(gameTurn),
       corpName = Value(corpName),
       asteroidName = Value(asteroidName);
  static Insertable<TempAsteroidScanned> custom({
    Expression<int>? id,
    Expression<int>? gameTurn,
    Expression<String>? corpName,
    Expression<String>? asteroidName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameTurn != null) 'game_turn': gameTurn,
      if (corpName != null) 'corp_name': corpName,
      if (asteroidName != null) 'asteroid_name': asteroidName,
    });
  }

  TempAsteroidsScannedCompanion copyWith({
    Value<int>? id,
    Value<int>? gameTurn,
    Value<String>? corpName,
    Value<String>? asteroidName,
  }) {
    return TempAsteroidsScannedCompanion(
      id: id ?? this.id,
      gameTurn: gameTurn ?? this.gameTurn,
      corpName: corpName ?? this.corpName,
      asteroidName: asteroidName ?? this.asteroidName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameTurn.present) {
      map['game_turn'] = Variable<int>(gameTurn.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (asteroidName.present) {
      map['asteroid_name'] = Variable<String>(asteroidName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TempAsteroidsScannedCompanion(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('corpName: $corpName, ')
          ..write('asteroidName: $asteroidName')
          ..write(')'))
        .toString();
  }
}

class $CadetsTable extends Cadets with TableInfo<$CadetsTable, Cadet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CadetsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Available'),
  );
  static const VerificationMeta _leadershipMeta = const VerificationMeta(
    'leadership',
  );
  @override
  late final GeneratedColumn<int> leadership = GeneratedColumn<int>(
    'leadership',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _influenceMeta = const VerificationMeta(
    'influence',
  );
  @override
  late final GeneratedColumn<int> influence = GeneratedColumn<int>(
    'influence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pilotMeta = const VerificationMeta('pilot');
  @override
  late final GeneratedColumn<int> pilot = GeneratedColumn<int>(
    'pilot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _computationMeta = const VerificationMeta(
    'computation',
  );
  @override
  late final GeneratedColumn<int> computation = GeneratedColumn<int>(
    'computation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repairMeta = const VerificationMeta('repair');
  @override
  late final GeneratedColumn<int> repair = GeneratedColumn<int>(
    'repair',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _shipWeaponsMeta = const VerificationMeta(
    'shipWeapons',
  );
  @override
  late final GeneratedColumn<int> shipWeapons = GeneratedColumn<int>(
    'ship_weapons',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _firearmsMeta = const VerificationMeta(
    'firearms',
  );
  @override
  late final GeneratedColumn<int> firearms = GeneratedColumn<int>(
    'firearms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _meleeMeta = const VerificationMeta('melee');
  @override
  late final GeneratedColumn<int> melee = GeneratedColumn<int>(
    'melee',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _athleticsMeta = const VerificationMeta(
    'athletics',
  );
  @override
  late final GeneratedColumn<int> athletics = GeneratedColumn<int>(
    'athletics',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nationalityMeta = const VerificationMeta(
    'nationality',
  );
  @override
  late final GeneratedColumn<String> nationality = GeneratedColumn<String>(
    'nationality',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    name,
    status,
    leadership,
    influence,
    pilot,
    computation,
    repair,
    shipWeapons,
    firearms,
    melee,
    athletics,
    gender,
    nationality,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cadets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cadet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('leadership')) {
      context.handle(
        _leadershipMeta,
        leadership.isAcceptableOrUnknown(data['leadership']!, _leadershipMeta),
      );
    }
    if (data.containsKey('influence')) {
      context.handle(
        _influenceMeta,
        influence.isAcceptableOrUnknown(data['influence']!, _influenceMeta),
      );
    }
    if (data.containsKey('pilot')) {
      context.handle(
        _pilotMeta,
        pilot.isAcceptableOrUnknown(data['pilot']!, _pilotMeta),
      );
    }
    if (data.containsKey('computation')) {
      context.handle(
        _computationMeta,
        computation.isAcceptableOrUnknown(
          data['computation']!,
          _computationMeta,
        ),
      );
    }
    if (data.containsKey('repair')) {
      context.handle(
        _repairMeta,
        repair.isAcceptableOrUnknown(data['repair']!, _repairMeta),
      );
    }
    if (data.containsKey('ship_weapons')) {
      context.handle(
        _shipWeaponsMeta,
        shipWeapons.isAcceptableOrUnknown(
          data['ship_weapons']!,
          _shipWeaponsMeta,
        ),
      );
    }
    if (data.containsKey('firearms')) {
      context.handle(
        _firearmsMeta,
        firearms.isAcceptableOrUnknown(data['firearms']!, _firearmsMeta),
      );
    }
    if (data.containsKey('melee')) {
      context.handle(
        _meleeMeta,
        melee.isAcceptableOrUnknown(data['melee']!, _meleeMeta),
      );
    }
    if (data.containsKey('athletics')) {
      context.handle(
        _athleticsMeta,
        athletics.isAcceptableOrUnknown(data['athletics']!, _athleticsMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('nationality')) {
      context.handle(
        _nationalityMeta,
        nationality.isAcceptableOrUnknown(
          data['nationality']!,
          _nationalityMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cadet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cadet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      leadership: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}leadership'],
      )!,
      influence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}influence'],
      )!,
      pilot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pilot'],
      )!,
      computation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}computation'],
      )!,
      repair: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repair'],
      )!,
      shipWeapons: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ship_weapons'],
      )!,
      firearms: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}firearms'],
      )!,
      melee: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}melee'],
      )!,
      athletics: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}athletics'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      nationality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nationality'],
      ),
    );
  }

  @override
  $CadetsTable createAlias(String alias) {
    return $CadetsTable(attachedDatabase, alias);
  }
}

class Cadet extends DataClass implements Insertable<Cadet> {
  final int id;
  final String? corpName;
  final String name;
  final String status;
  final int leadership;
  final int influence;
  final int pilot;
  final int computation;
  final int repair;
  final int shipWeapons;
  final int firearms;
  final int melee;
  final int athletics;
  final String? gender;
  final String? nationality;
  const Cadet({
    required this.id,
    this.corpName,
    required this.name,
    required this.status,
    required this.leadership,
    required this.influence,
    required this.pilot,
    required this.computation,
    required this.repair,
    required this.shipWeapons,
    required this.firearms,
    required this.melee,
    required this.athletics,
    this.gender,
    this.nationality,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || corpName != null) {
      map['corp_name'] = Variable<String>(corpName);
    }
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    map['leadership'] = Variable<int>(leadership);
    map['influence'] = Variable<int>(influence);
    map['pilot'] = Variable<int>(pilot);
    map['computation'] = Variable<int>(computation);
    map['repair'] = Variable<int>(repair);
    map['ship_weapons'] = Variable<int>(shipWeapons);
    map['firearms'] = Variable<int>(firearms);
    map['melee'] = Variable<int>(melee);
    map['athletics'] = Variable<int>(athletics);
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || nationality != null) {
      map['nationality'] = Variable<String>(nationality);
    }
    return map;
  }

  CadetsCompanion toCompanion(bool nullToAbsent) {
    return CadetsCompanion(
      id: Value(id),
      corpName: corpName == null && nullToAbsent
          ? const Value.absent()
          : Value(corpName),
      name: Value(name),
      status: Value(status),
      leadership: Value(leadership),
      influence: Value(influence),
      pilot: Value(pilot),
      computation: Value(computation),
      repair: Value(repair),
      shipWeapons: Value(shipWeapons),
      firearms: Value(firearms),
      melee: Value(melee),
      athletics: Value(athletics),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      nationality: nationality == null && nullToAbsent
          ? const Value.absent()
          : Value(nationality),
    );
  }

  factory Cadet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cadet(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String?>(json['corpName']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      leadership: serializer.fromJson<int>(json['leadership']),
      influence: serializer.fromJson<int>(json['influence']),
      pilot: serializer.fromJson<int>(json['pilot']),
      computation: serializer.fromJson<int>(json['computation']),
      repair: serializer.fromJson<int>(json['repair']),
      shipWeapons: serializer.fromJson<int>(json['shipWeapons']),
      firearms: serializer.fromJson<int>(json['firearms']),
      melee: serializer.fromJson<int>(json['melee']),
      athletics: serializer.fromJson<int>(json['athletics']),
      gender: serializer.fromJson<String?>(json['gender']),
      nationality: serializer.fromJson<String?>(json['nationality']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String?>(corpName),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'leadership': serializer.toJson<int>(leadership),
      'influence': serializer.toJson<int>(influence),
      'pilot': serializer.toJson<int>(pilot),
      'computation': serializer.toJson<int>(computation),
      'repair': serializer.toJson<int>(repair),
      'shipWeapons': serializer.toJson<int>(shipWeapons),
      'firearms': serializer.toJson<int>(firearms),
      'melee': serializer.toJson<int>(melee),
      'athletics': serializer.toJson<int>(athletics),
      'gender': serializer.toJson<String?>(gender),
      'nationality': serializer.toJson<String?>(nationality),
    };
  }

  Cadet copyWith({
    int? id,
    Value<String?> corpName = const Value.absent(),
    String? name,
    String? status,
    int? leadership,
    int? influence,
    int? pilot,
    int? computation,
    int? repair,
    int? shipWeapons,
    int? firearms,
    int? melee,
    int? athletics,
    Value<String?> gender = const Value.absent(),
    Value<String?> nationality = const Value.absent(),
  }) => Cadet(
    id: id ?? this.id,
    corpName: corpName.present ? corpName.value : this.corpName,
    name: name ?? this.name,
    status: status ?? this.status,
    leadership: leadership ?? this.leadership,
    influence: influence ?? this.influence,
    pilot: pilot ?? this.pilot,
    computation: computation ?? this.computation,
    repair: repair ?? this.repair,
    shipWeapons: shipWeapons ?? this.shipWeapons,
    firearms: firearms ?? this.firearms,
    melee: melee ?? this.melee,
    athletics: athletics ?? this.athletics,
    gender: gender.present ? gender.value : this.gender,
    nationality: nationality.present ? nationality.value : this.nationality,
  );
  Cadet copyWithCompanion(CadetsCompanion data) {
    return Cadet(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      leadership: data.leadership.present
          ? data.leadership.value
          : this.leadership,
      influence: data.influence.present ? data.influence.value : this.influence,
      pilot: data.pilot.present ? data.pilot.value : this.pilot,
      computation: data.computation.present
          ? data.computation.value
          : this.computation,
      repair: data.repair.present ? data.repair.value : this.repair,
      shipWeapons: data.shipWeapons.present
          ? data.shipWeapons.value
          : this.shipWeapons,
      firearms: data.firearms.present ? data.firearms.value : this.firearms,
      melee: data.melee.present ? data.melee.value : this.melee,
      athletics: data.athletics.present ? data.athletics.value : this.athletics,
      gender: data.gender.present ? data.gender.value : this.gender,
      nationality: data.nationality.present
          ? data.nationality.value
          : this.nationality,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cadet(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('firearms: $firearms, ')
          ..write('melee: $melee, ')
          ..write('athletics: $athletics, ')
          ..write('gender: $gender, ')
          ..write('nationality: $nationality')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    corpName,
    name,
    status,
    leadership,
    influence,
    pilot,
    computation,
    repair,
    shipWeapons,
    firearms,
    melee,
    athletics,
    gender,
    nationality,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cadet &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.name == this.name &&
          other.status == this.status &&
          other.leadership == this.leadership &&
          other.influence == this.influence &&
          other.pilot == this.pilot &&
          other.computation == this.computation &&
          other.repair == this.repair &&
          other.shipWeapons == this.shipWeapons &&
          other.firearms == this.firearms &&
          other.melee == this.melee &&
          other.athletics == this.athletics &&
          other.gender == this.gender &&
          other.nationality == this.nationality);
}

class CadetsCompanion extends UpdateCompanion<Cadet> {
  final Value<int> id;
  final Value<String?> corpName;
  final Value<String> name;
  final Value<String> status;
  final Value<int> leadership;
  final Value<int> influence;
  final Value<int> pilot;
  final Value<int> computation;
  final Value<int> repair;
  final Value<int> shipWeapons;
  final Value<int> firearms;
  final Value<int> melee;
  final Value<int> athletics;
  final Value<String?> gender;
  final Value<String?> nationality;
  const CadetsCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.firearms = const Value.absent(),
    this.melee = const Value.absent(),
    this.athletics = const Value.absent(),
    this.gender = const Value.absent(),
    this.nationality = const Value.absent(),
  });
  CadetsCompanion.insert({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    required String name,
    this.status = const Value.absent(),
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.firearms = const Value.absent(),
    this.melee = const Value.absent(),
    this.athletics = const Value.absent(),
    this.gender = const Value.absent(),
    this.nationality = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Cadet> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<String>? name,
    Expression<String>? status,
    Expression<int>? leadership,
    Expression<int>? influence,
    Expression<int>? pilot,
    Expression<int>? computation,
    Expression<int>? repair,
    Expression<int>? shipWeapons,
    Expression<int>? firearms,
    Expression<int>? melee,
    Expression<int>? athletics,
    Expression<String>? gender,
    Expression<String>? nationality,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (leadership != null) 'leadership': leadership,
      if (influence != null) 'influence': influence,
      if (pilot != null) 'pilot': pilot,
      if (computation != null) 'computation': computation,
      if (repair != null) 'repair': repair,
      if (shipWeapons != null) 'ship_weapons': shipWeapons,
      if (firearms != null) 'firearms': firearms,
      if (melee != null) 'melee': melee,
      if (athletics != null) 'athletics': athletics,
      if (gender != null) 'gender': gender,
      if (nationality != null) 'nationality': nationality,
    });
  }

  CadetsCompanion copyWith({
    Value<int>? id,
    Value<String?>? corpName,
    Value<String>? name,
    Value<String>? status,
    Value<int>? leadership,
    Value<int>? influence,
    Value<int>? pilot,
    Value<int>? computation,
    Value<int>? repair,
    Value<int>? shipWeapons,
    Value<int>? firearms,
    Value<int>? melee,
    Value<int>? athletics,
    Value<String?>? gender,
    Value<String?>? nationality,
  }) {
    return CadetsCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      name: name ?? this.name,
      status: status ?? this.status,
      leadership: leadership ?? this.leadership,
      influence: influence ?? this.influence,
      pilot: pilot ?? this.pilot,
      computation: computation ?? this.computation,
      repair: repair ?? this.repair,
      shipWeapons: shipWeapons ?? this.shipWeapons,
      firearms: firearms ?? this.firearms,
      melee: melee ?? this.melee,
      athletics: athletics ?? this.athletics,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (leadership.present) {
      map['leadership'] = Variable<int>(leadership.value);
    }
    if (influence.present) {
      map['influence'] = Variable<int>(influence.value);
    }
    if (pilot.present) {
      map['pilot'] = Variable<int>(pilot.value);
    }
    if (computation.present) {
      map['computation'] = Variable<int>(computation.value);
    }
    if (repair.present) {
      map['repair'] = Variable<int>(repair.value);
    }
    if (shipWeapons.present) {
      map['ship_weapons'] = Variable<int>(shipWeapons.value);
    }
    if (firearms.present) {
      map['firearms'] = Variable<int>(firearms.value);
    }
    if (melee.present) {
      map['melee'] = Variable<int>(melee.value);
    }
    if (athletics.present) {
      map['athletics'] = Variable<int>(athletics.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (nationality.present) {
      map['nationality'] = Variable<String>(nationality.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CadetsCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('firearms: $firearms, ')
          ..write('melee: $melee, ')
          ..write('athletics: $athletics, ')
          ..write('gender: $gender, ')
          ..write('nationality: $nationality')
          ..write(')'))
        .toString();
  }
}

class $CadetsProgressTable extends CadetsProgress
    with TableInfo<$CadetsProgressTable, CadetProgress> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CadetsProgressTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _gameTurnMeta = const VerificationMeta(
    'gameTurn',
  );
  @override
  late final GeneratedColumn<int> gameTurn = GeneratedColumn<int>(
    'game_turn',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cadetIdMeta = const VerificationMeta(
    'cadetId',
  );
  @override
  late final GeneratedColumn<int> cadetId = GeneratedColumn<int>(
    'cadet_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _leadershipMeta = const VerificationMeta(
    'leadership',
  );
  @override
  late final GeneratedColumn<int> leadership = GeneratedColumn<int>(
    'leadership',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _influenceMeta = const VerificationMeta(
    'influence',
  );
  @override
  late final GeneratedColumn<int> influence = GeneratedColumn<int>(
    'influence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pilotMeta = const VerificationMeta('pilot');
  @override
  late final GeneratedColumn<int> pilot = GeneratedColumn<int>(
    'pilot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _computationMeta = const VerificationMeta(
    'computation',
  );
  @override
  late final GeneratedColumn<int> computation = GeneratedColumn<int>(
    'computation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repairMeta = const VerificationMeta('repair');
  @override
  late final GeneratedColumn<int> repair = GeneratedColumn<int>(
    'repair',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _shipWeaponsMeta = const VerificationMeta(
    'shipWeapons',
  );
  @override
  late final GeneratedColumn<int> shipWeapons = GeneratedColumn<int>(
    'ship_weapons',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fightingMeta = const VerificationMeta(
    'fighting',
  );
  @override
  late final GeneratedColumn<int> fighting = GeneratedColumn<int>(
    'fighting',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _athleticsMeta = const VerificationMeta(
    'athletics',
  );
  @override
  late final GeneratedColumn<int> athletics = GeneratedColumn<int>(
    'athletics',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gameTurn,
    cadetId,
    corpName,
    name,
    leadership,
    influence,
    pilot,
    computation,
    repair,
    shipWeapons,
    fighting,
    athletics,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cadets_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<CadetProgress> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_turn')) {
      context.handle(
        _gameTurnMeta,
        gameTurn.isAcceptableOrUnknown(data['game_turn']!, _gameTurnMeta),
      );
    } else if (isInserting) {
      context.missing(_gameTurnMeta);
    }
    if (data.containsKey('cadet_id')) {
      context.handle(
        _cadetIdMeta,
        cadetId.isAcceptableOrUnknown(data['cadet_id']!, _cadetIdMeta),
      );
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('leadership')) {
      context.handle(
        _leadershipMeta,
        leadership.isAcceptableOrUnknown(data['leadership']!, _leadershipMeta),
      );
    }
    if (data.containsKey('influence')) {
      context.handle(
        _influenceMeta,
        influence.isAcceptableOrUnknown(data['influence']!, _influenceMeta),
      );
    }
    if (data.containsKey('pilot')) {
      context.handle(
        _pilotMeta,
        pilot.isAcceptableOrUnknown(data['pilot']!, _pilotMeta),
      );
    }
    if (data.containsKey('computation')) {
      context.handle(
        _computationMeta,
        computation.isAcceptableOrUnknown(
          data['computation']!,
          _computationMeta,
        ),
      );
    }
    if (data.containsKey('repair')) {
      context.handle(
        _repairMeta,
        repair.isAcceptableOrUnknown(data['repair']!, _repairMeta),
      );
    }
    if (data.containsKey('ship_weapons')) {
      context.handle(
        _shipWeaponsMeta,
        shipWeapons.isAcceptableOrUnknown(
          data['ship_weapons']!,
          _shipWeaponsMeta,
        ),
      );
    }
    if (data.containsKey('fighting')) {
      context.handle(
        _fightingMeta,
        fighting.isAcceptableOrUnknown(data['fighting']!, _fightingMeta),
      );
    }
    if (data.containsKey('athletics')) {
      context.handle(
        _athleticsMeta,
        athletics.isAcceptableOrUnknown(data['athletics']!, _athleticsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CadetProgress map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CadetProgress(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameTurn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_turn'],
      )!,
      cadetId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cadet_id'],
      ),
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      leadership: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}leadership'],
      )!,
      influence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}influence'],
      )!,
      pilot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pilot'],
      )!,
      computation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}computation'],
      )!,
      repair: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repair'],
      )!,
      shipWeapons: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ship_weapons'],
      )!,
      fighting: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fighting'],
      )!,
      athletics: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}athletics'],
      )!,
    );
  }

  @override
  $CadetsProgressTable createAlias(String alias) {
    return $CadetsProgressTable(attachedDatabase, alias);
  }
}

class CadetProgress extends DataClass implements Insertable<CadetProgress> {
  final int id;
  final int gameTurn;
  final int? cadetId;
  final String corpName;
  final String name;
  final int leadership;
  final int influence;
  final int pilot;
  final int computation;
  final int repair;
  final int shipWeapons;
  final int fighting;
  final int athletics;
  const CadetProgress({
    required this.id,
    required this.gameTurn,
    this.cadetId,
    required this.corpName,
    required this.name,
    required this.leadership,
    required this.influence,
    required this.pilot,
    required this.computation,
    required this.repair,
    required this.shipWeapons,
    required this.fighting,
    required this.athletics,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_turn'] = Variable<int>(gameTurn);
    if (!nullToAbsent || cadetId != null) {
      map['cadet_id'] = Variable<int>(cadetId);
    }
    map['corp_name'] = Variable<String>(corpName);
    map['name'] = Variable<String>(name);
    map['leadership'] = Variable<int>(leadership);
    map['influence'] = Variable<int>(influence);
    map['pilot'] = Variable<int>(pilot);
    map['computation'] = Variable<int>(computation);
    map['repair'] = Variable<int>(repair);
    map['ship_weapons'] = Variable<int>(shipWeapons);
    map['fighting'] = Variable<int>(fighting);
    map['athletics'] = Variable<int>(athletics);
    return map;
  }

  CadetsProgressCompanion toCompanion(bool nullToAbsent) {
    return CadetsProgressCompanion(
      id: Value(id),
      gameTurn: Value(gameTurn),
      cadetId: cadetId == null && nullToAbsent
          ? const Value.absent()
          : Value(cadetId),
      corpName: Value(corpName),
      name: Value(name),
      leadership: Value(leadership),
      influence: Value(influence),
      pilot: Value(pilot),
      computation: Value(computation),
      repair: Value(repair),
      shipWeapons: Value(shipWeapons),
      fighting: Value(fighting),
      athletics: Value(athletics),
    );
  }

  factory CadetProgress.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CadetProgress(
      id: serializer.fromJson<int>(json['id']),
      gameTurn: serializer.fromJson<int>(json['gameTurn']),
      cadetId: serializer.fromJson<int?>(json['cadetId']),
      corpName: serializer.fromJson<String>(json['corpName']),
      name: serializer.fromJson<String>(json['name']),
      leadership: serializer.fromJson<int>(json['leadership']),
      influence: serializer.fromJson<int>(json['influence']),
      pilot: serializer.fromJson<int>(json['pilot']),
      computation: serializer.fromJson<int>(json['computation']),
      repair: serializer.fromJson<int>(json['repair']),
      shipWeapons: serializer.fromJson<int>(json['shipWeapons']),
      fighting: serializer.fromJson<int>(json['fighting']),
      athletics: serializer.fromJson<int>(json['athletics']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameTurn': serializer.toJson<int>(gameTurn),
      'cadetId': serializer.toJson<int?>(cadetId),
      'corpName': serializer.toJson<String>(corpName),
      'name': serializer.toJson<String>(name),
      'leadership': serializer.toJson<int>(leadership),
      'influence': serializer.toJson<int>(influence),
      'pilot': serializer.toJson<int>(pilot),
      'computation': serializer.toJson<int>(computation),
      'repair': serializer.toJson<int>(repair),
      'shipWeapons': serializer.toJson<int>(shipWeapons),
      'fighting': serializer.toJson<int>(fighting),
      'athletics': serializer.toJson<int>(athletics),
    };
  }

  CadetProgress copyWith({
    int? id,
    int? gameTurn,
    Value<int?> cadetId = const Value.absent(),
    String? corpName,
    String? name,
    int? leadership,
    int? influence,
    int? pilot,
    int? computation,
    int? repair,
    int? shipWeapons,
    int? fighting,
    int? athletics,
  }) => CadetProgress(
    id: id ?? this.id,
    gameTurn: gameTurn ?? this.gameTurn,
    cadetId: cadetId.present ? cadetId.value : this.cadetId,
    corpName: corpName ?? this.corpName,
    name: name ?? this.name,
    leadership: leadership ?? this.leadership,
    influence: influence ?? this.influence,
    pilot: pilot ?? this.pilot,
    computation: computation ?? this.computation,
    repair: repair ?? this.repair,
    shipWeapons: shipWeapons ?? this.shipWeapons,
    fighting: fighting ?? this.fighting,
    athletics: athletics ?? this.athletics,
  );
  CadetProgress copyWithCompanion(CadetsProgressCompanion data) {
    return CadetProgress(
      id: data.id.present ? data.id.value : this.id,
      gameTurn: data.gameTurn.present ? data.gameTurn.value : this.gameTurn,
      cadetId: data.cadetId.present ? data.cadetId.value : this.cadetId,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      name: data.name.present ? data.name.value : this.name,
      leadership: data.leadership.present
          ? data.leadership.value
          : this.leadership,
      influence: data.influence.present ? data.influence.value : this.influence,
      pilot: data.pilot.present ? data.pilot.value : this.pilot,
      computation: data.computation.present
          ? data.computation.value
          : this.computation,
      repair: data.repair.present ? data.repair.value : this.repair,
      shipWeapons: data.shipWeapons.present
          ? data.shipWeapons.value
          : this.shipWeapons,
      fighting: data.fighting.present ? data.fighting.value : this.fighting,
      athletics: data.athletics.present ? data.athletics.value : this.athletics,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CadetProgress(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('cadetId: $cadetId, ')
          ..write('corpName: $corpName, ')
          ..write('name: $name, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('fighting: $fighting, ')
          ..write('athletics: $athletics')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    gameTurn,
    cadetId,
    corpName,
    name,
    leadership,
    influence,
    pilot,
    computation,
    repair,
    shipWeapons,
    fighting,
    athletics,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CadetProgress &&
          other.id == this.id &&
          other.gameTurn == this.gameTurn &&
          other.cadetId == this.cadetId &&
          other.corpName == this.corpName &&
          other.name == this.name &&
          other.leadership == this.leadership &&
          other.influence == this.influence &&
          other.pilot == this.pilot &&
          other.computation == this.computation &&
          other.repair == this.repair &&
          other.shipWeapons == this.shipWeapons &&
          other.fighting == this.fighting &&
          other.athletics == this.athletics);
}

class CadetsProgressCompanion extends UpdateCompanion<CadetProgress> {
  final Value<int> id;
  final Value<int> gameTurn;
  final Value<int?> cadetId;
  final Value<String> corpName;
  final Value<String> name;
  final Value<int> leadership;
  final Value<int> influence;
  final Value<int> pilot;
  final Value<int> computation;
  final Value<int> repair;
  final Value<int> shipWeapons;
  final Value<int> fighting;
  final Value<int> athletics;
  const CadetsProgressCompanion({
    this.id = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.cadetId = const Value.absent(),
    this.corpName = const Value.absent(),
    this.name = const Value.absent(),
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.fighting = const Value.absent(),
    this.athletics = const Value.absent(),
  });
  CadetsProgressCompanion.insert({
    this.id = const Value.absent(),
    required int gameTurn,
    this.cadetId = const Value.absent(),
    required String corpName,
    required String name,
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.fighting = const Value.absent(),
    this.athletics = const Value.absent(),
  }) : gameTurn = Value(gameTurn),
       corpName = Value(corpName),
       name = Value(name);
  static Insertable<CadetProgress> custom({
    Expression<int>? id,
    Expression<int>? gameTurn,
    Expression<int>? cadetId,
    Expression<String>? corpName,
    Expression<String>? name,
    Expression<int>? leadership,
    Expression<int>? influence,
    Expression<int>? pilot,
    Expression<int>? computation,
    Expression<int>? repair,
    Expression<int>? shipWeapons,
    Expression<int>? fighting,
    Expression<int>? athletics,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameTurn != null) 'game_turn': gameTurn,
      if (cadetId != null) 'cadet_id': cadetId,
      if (corpName != null) 'corp_name': corpName,
      if (name != null) 'name': name,
      if (leadership != null) 'leadership': leadership,
      if (influence != null) 'influence': influence,
      if (pilot != null) 'pilot': pilot,
      if (computation != null) 'computation': computation,
      if (repair != null) 'repair': repair,
      if (shipWeapons != null) 'ship_weapons': shipWeapons,
      if (fighting != null) 'fighting': fighting,
      if (athletics != null) 'athletics': athletics,
    });
  }

  CadetsProgressCompanion copyWith({
    Value<int>? id,
    Value<int>? gameTurn,
    Value<int?>? cadetId,
    Value<String>? corpName,
    Value<String>? name,
    Value<int>? leadership,
    Value<int>? influence,
    Value<int>? pilot,
    Value<int>? computation,
    Value<int>? repair,
    Value<int>? shipWeapons,
    Value<int>? fighting,
    Value<int>? athletics,
  }) {
    return CadetsProgressCompanion(
      id: id ?? this.id,
      gameTurn: gameTurn ?? this.gameTurn,
      cadetId: cadetId ?? this.cadetId,
      corpName: corpName ?? this.corpName,
      name: name ?? this.name,
      leadership: leadership ?? this.leadership,
      influence: influence ?? this.influence,
      pilot: pilot ?? this.pilot,
      computation: computation ?? this.computation,
      repair: repair ?? this.repair,
      shipWeapons: shipWeapons ?? this.shipWeapons,
      fighting: fighting ?? this.fighting,
      athletics: athletics ?? this.athletics,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameTurn.present) {
      map['game_turn'] = Variable<int>(gameTurn.value);
    }
    if (cadetId.present) {
      map['cadet_id'] = Variable<int>(cadetId.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (leadership.present) {
      map['leadership'] = Variable<int>(leadership.value);
    }
    if (influence.present) {
      map['influence'] = Variable<int>(influence.value);
    }
    if (pilot.present) {
      map['pilot'] = Variable<int>(pilot.value);
    }
    if (computation.present) {
      map['computation'] = Variable<int>(computation.value);
    }
    if (repair.present) {
      map['repair'] = Variable<int>(repair.value);
    }
    if (shipWeapons.present) {
      map['ship_weapons'] = Variable<int>(shipWeapons.value);
    }
    if (fighting.present) {
      map['fighting'] = Variable<int>(fighting.value);
    }
    if (athletics.present) {
      map['athletics'] = Variable<int>(athletics.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CadetsProgressCompanion(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('cadetId: $cadetId, ')
          ..write('corpName: $corpName, ')
          ..write('name: $name, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('fighting: $fighting, ')
          ..write('athletics: $athletics')
          ..write(')'))
        .toString();
  }
}

class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, GameCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _cidMeta = const VerificationMeta('cid');
  @override
  late final GeneratedColumn<int> cid = GeneratedColumn<int>(
    'cid',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _corpMeta = const VerificationMeta('corp');
  @override
  late final GeneratedColumn<String> corp = GeneratedColumn<String>(
    'corp',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _raceMeta = const VerificationMeta('race');
  @override
  late final GeneratedColumn<String> race = GeneratedColumn<String>(
    'race',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _leadershipMeta = const VerificationMeta(
    'leadership',
  );
  @override
  late final GeneratedColumn<int> leadership = GeneratedColumn<int>(
    'leadership',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _influenceMeta = const VerificationMeta(
    'influence',
  );
  @override
  late final GeneratedColumn<int> influence = GeneratedColumn<int>(
    'influence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pilotMeta = const VerificationMeta('pilot');
  @override
  late final GeneratedColumn<int> pilot = GeneratedColumn<int>(
    'pilot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _astrogationMeta = const VerificationMeta(
    'astrogation',
  );
  @override
  late final GeneratedColumn<int> astrogation = GeneratedColumn<int>(
    'astrogation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _computationMeta = const VerificationMeta(
    'computation',
  );
  @override
  late final GeneratedColumn<int> computation = GeneratedColumn<int>(
    'computation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repairMeta = const VerificationMeta('repair');
  @override
  late final GeneratedColumn<int> repair = GeneratedColumn<int>(
    'repair',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _shipWeaponsMeta = const VerificationMeta(
    'shipWeapons',
  );
  @override
  late final GeneratedColumn<int> shipWeapons = GeneratedColumn<int>(
    'ship_weapons',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _firearmsMeta = const VerificationMeta(
    'firearms',
  );
  @override
  late final GeneratedColumn<int> firearms = GeneratedColumn<int>(
    'firearms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _meleeMeta = const VerificationMeta('melee');
  @override
  late final GeneratedColumn<int> melee = GeneratedColumn<int>(
    'melee',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _athleticsMeta = const VerificationMeta(
    'athletics',
  );
  @override
  late final GeneratedColumn<int> athletics = GeneratedColumn<int>(
    'athletics',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cid,
    corp,
    name,
    race,
    leadership,
    influence,
    pilot,
    astrogation,
    computation,
    repair,
    shipWeapons,
    firearms,
    melee,
    athletics,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cid')) {
      context.handle(
        _cidMeta,
        cid.isAcceptableOrUnknown(data['cid']!, _cidMeta),
      );
    }
    if (data.containsKey('corp')) {
      context.handle(
        _corpMeta,
        corp.isAcceptableOrUnknown(data['corp']!, _corpMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('race')) {
      context.handle(
        _raceMeta,
        race.isAcceptableOrUnknown(data['race']!, _raceMeta),
      );
    }
    if (data.containsKey('leadership')) {
      context.handle(
        _leadershipMeta,
        leadership.isAcceptableOrUnknown(data['leadership']!, _leadershipMeta),
      );
    }
    if (data.containsKey('influence')) {
      context.handle(
        _influenceMeta,
        influence.isAcceptableOrUnknown(data['influence']!, _influenceMeta),
      );
    }
    if (data.containsKey('pilot')) {
      context.handle(
        _pilotMeta,
        pilot.isAcceptableOrUnknown(data['pilot']!, _pilotMeta),
      );
    }
    if (data.containsKey('astrogation')) {
      context.handle(
        _astrogationMeta,
        astrogation.isAcceptableOrUnknown(
          data['astrogation']!,
          _astrogationMeta,
        ),
      );
    }
    if (data.containsKey('computation')) {
      context.handle(
        _computationMeta,
        computation.isAcceptableOrUnknown(
          data['computation']!,
          _computationMeta,
        ),
      );
    }
    if (data.containsKey('repair')) {
      context.handle(
        _repairMeta,
        repair.isAcceptableOrUnknown(data['repair']!, _repairMeta),
      );
    }
    if (data.containsKey('ship_weapons')) {
      context.handle(
        _shipWeaponsMeta,
        shipWeapons.isAcceptableOrUnknown(
          data['ship_weapons']!,
          _shipWeaponsMeta,
        ),
      );
    }
    if (data.containsKey('firearms')) {
      context.handle(
        _firearmsMeta,
        firearms.isAcceptableOrUnknown(data['firearms']!, _firearmsMeta),
      );
    }
    if (data.containsKey('melee')) {
      context.handle(
        _meleeMeta,
        melee.isAcceptableOrUnknown(data['melee']!, _meleeMeta),
      );
    }
    if (data.containsKey('athletics')) {
      context.handle(
        _athleticsMeta,
        athletics.isAcceptableOrUnknown(data['athletics']!, _athleticsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameCharacter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cid'],
      ),
      corp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      race: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}race'],
      ),
      leadership: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}leadership'],
      )!,
      influence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}influence'],
      )!,
      pilot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pilot'],
      )!,
      astrogation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}astrogation'],
      )!,
      computation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}computation'],
      )!,
      repair: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repair'],
      )!,
      shipWeapons: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ship_weapons'],
      )!,
      firearms: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}firearms'],
      )!,
      melee: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}melee'],
      )!,
      athletics: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}athletics'],
      )!,
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class GameCharacter extends DataClass implements Insertable<GameCharacter> {
  final int id;
  final int? cid;
  final String? corp;
  final String name;
  final String? race;
  final int leadership;
  final int influence;
  final int pilot;
  final int astrogation;
  final int computation;
  final int repair;
  final int shipWeapons;
  final int firearms;
  final int melee;
  final int athletics;
  const GameCharacter({
    required this.id,
    this.cid,
    this.corp,
    required this.name,
    this.race,
    required this.leadership,
    required this.influence,
    required this.pilot,
    required this.astrogation,
    required this.computation,
    required this.repair,
    required this.shipWeapons,
    required this.firearms,
    required this.melee,
    required this.athletics,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || cid != null) {
      map['cid'] = Variable<int>(cid);
    }
    if (!nullToAbsent || corp != null) {
      map['corp'] = Variable<String>(corp);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || race != null) {
      map['race'] = Variable<String>(race);
    }
    map['leadership'] = Variable<int>(leadership);
    map['influence'] = Variable<int>(influence);
    map['pilot'] = Variable<int>(pilot);
    map['astrogation'] = Variable<int>(astrogation);
    map['computation'] = Variable<int>(computation);
    map['repair'] = Variable<int>(repair);
    map['ship_weapons'] = Variable<int>(shipWeapons);
    map['firearms'] = Variable<int>(firearms);
    map['melee'] = Variable<int>(melee);
    map['athletics'] = Variable<int>(athletics);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      cid: cid == null && nullToAbsent ? const Value.absent() : Value(cid),
      corp: corp == null && nullToAbsent ? const Value.absent() : Value(corp),
      name: Value(name),
      race: race == null && nullToAbsent ? const Value.absent() : Value(race),
      leadership: Value(leadership),
      influence: Value(influence),
      pilot: Value(pilot),
      astrogation: Value(astrogation),
      computation: Value(computation),
      repair: Value(repair),
      shipWeapons: Value(shipWeapons),
      firearms: Value(firearms),
      melee: Value(melee),
      athletics: Value(athletics),
    );
  }

  factory GameCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameCharacter(
      id: serializer.fromJson<int>(json['id']),
      cid: serializer.fromJson<int?>(json['cid']),
      corp: serializer.fromJson<String?>(json['corp']),
      name: serializer.fromJson<String>(json['name']),
      race: serializer.fromJson<String?>(json['race']),
      leadership: serializer.fromJson<int>(json['leadership']),
      influence: serializer.fromJson<int>(json['influence']),
      pilot: serializer.fromJson<int>(json['pilot']),
      astrogation: serializer.fromJson<int>(json['astrogation']),
      computation: serializer.fromJson<int>(json['computation']),
      repair: serializer.fromJson<int>(json['repair']),
      shipWeapons: serializer.fromJson<int>(json['shipWeapons']),
      firearms: serializer.fromJson<int>(json['firearms']),
      melee: serializer.fromJson<int>(json['melee']),
      athletics: serializer.fromJson<int>(json['athletics']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cid': serializer.toJson<int?>(cid),
      'corp': serializer.toJson<String?>(corp),
      'name': serializer.toJson<String>(name),
      'race': serializer.toJson<String?>(race),
      'leadership': serializer.toJson<int>(leadership),
      'influence': serializer.toJson<int>(influence),
      'pilot': serializer.toJson<int>(pilot),
      'astrogation': serializer.toJson<int>(astrogation),
      'computation': serializer.toJson<int>(computation),
      'repair': serializer.toJson<int>(repair),
      'shipWeapons': serializer.toJson<int>(shipWeapons),
      'firearms': serializer.toJson<int>(firearms),
      'melee': serializer.toJson<int>(melee),
      'athletics': serializer.toJson<int>(athletics),
    };
  }

  GameCharacter copyWith({
    int? id,
    Value<int?> cid = const Value.absent(),
    Value<String?> corp = const Value.absent(),
    String? name,
    Value<String?> race = const Value.absent(),
    int? leadership,
    int? influence,
    int? pilot,
    int? astrogation,
    int? computation,
    int? repair,
    int? shipWeapons,
    int? firearms,
    int? melee,
    int? athletics,
  }) => GameCharacter(
    id: id ?? this.id,
    cid: cid.present ? cid.value : this.cid,
    corp: corp.present ? corp.value : this.corp,
    name: name ?? this.name,
    race: race.present ? race.value : this.race,
    leadership: leadership ?? this.leadership,
    influence: influence ?? this.influence,
    pilot: pilot ?? this.pilot,
    astrogation: astrogation ?? this.astrogation,
    computation: computation ?? this.computation,
    repair: repair ?? this.repair,
    shipWeapons: shipWeapons ?? this.shipWeapons,
    firearms: firearms ?? this.firearms,
    melee: melee ?? this.melee,
    athletics: athletics ?? this.athletics,
  );
  GameCharacter copyWithCompanion(CharactersCompanion data) {
    return GameCharacter(
      id: data.id.present ? data.id.value : this.id,
      cid: data.cid.present ? data.cid.value : this.cid,
      corp: data.corp.present ? data.corp.value : this.corp,
      name: data.name.present ? data.name.value : this.name,
      race: data.race.present ? data.race.value : this.race,
      leadership: data.leadership.present
          ? data.leadership.value
          : this.leadership,
      influence: data.influence.present ? data.influence.value : this.influence,
      pilot: data.pilot.present ? data.pilot.value : this.pilot,
      astrogation: data.astrogation.present
          ? data.astrogation.value
          : this.astrogation,
      computation: data.computation.present
          ? data.computation.value
          : this.computation,
      repair: data.repair.present ? data.repair.value : this.repair,
      shipWeapons: data.shipWeapons.present
          ? data.shipWeapons.value
          : this.shipWeapons,
      firearms: data.firearms.present ? data.firearms.value : this.firearms,
      melee: data.melee.present ? data.melee.value : this.melee,
      athletics: data.athletics.present ? data.athletics.value : this.athletics,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameCharacter(')
          ..write('id: $id, ')
          ..write('cid: $cid, ')
          ..write('corp: $corp, ')
          ..write('name: $name, ')
          ..write('race: $race, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('astrogation: $astrogation, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('firearms: $firearms, ')
          ..write('melee: $melee, ')
          ..write('athletics: $athletics')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cid,
    corp,
    name,
    race,
    leadership,
    influence,
    pilot,
    astrogation,
    computation,
    repair,
    shipWeapons,
    firearms,
    melee,
    athletics,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameCharacter &&
          other.id == this.id &&
          other.cid == this.cid &&
          other.corp == this.corp &&
          other.name == this.name &&
          other.race == this.race &&
          other.leadership == this.leadership &&
          other.influence == this.influence &&
          other.pilot == this.pilot &&
          other.astrogation == this.astrogation &&
          other.computation == this.computation &&
          other.repair == this.repair &&
          other.shipWeapons == this.shipWeapons &&
          other.firearms == this.firearms &&
          other.melee == this.melee &&
          other.athletics == this.athletics);
}

class CharactersCompanion extends UpdateCompanion<GameCharacter> {
  final Value<int> id;
  final Value<int?> cid;
  final Value<String?> corp;
  final Value<String> name;
  final Value<String?> race;
  final Value<int> leadership;
  final Value<int> influence;
  final Value<int> pilot;
  final Value<int> astrogation;
  final Value<int> computation;
  final Value<int> repair;
  final Value<int> shipWeapons;
  final Value<int> firearms;
  final Value<int> melee;
  final Value<int> athletics;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.cid = const Value.absent(),
    this.corp = const Value.absent(),
    this.name = const Value.absent(),
    this.race = const Value.absent(),
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.astrogation = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.firearms = const Value.absent(),
    this.melee = const Value.absent(),
    this.athletics = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    this.cid = const Value.absent(),
    this.corp = const Value.absent(),
    required String name,
    this.race = const Value.absent(),
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.astrogation = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.firearms = const Value.absent(),
    this.melee = const Value.absent(),
    this.athletics = const Value.absent(),
  }) : name = Value(name);
  static Insertable<GameCharacter> custom({
    Expression<int>? id,
    Expression<int>? cid,
    Expression<String>? corp,
    Expression<String>? name,
    Expression<String>? race,
    Expression<int>? leadership,
    Expression<int>? influence,
    Expression<int>? pilot,
    Expression<int>? astrogation,
    Expression<int>? computation,
    Expression<int>? repair,
    Expression<int>? shipWeapons,
    Expression<int>? firearms,
    Expression<int>? melee,
    Expression<int>? athletics,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cid != null) 'cid': cid,
      if (corp != null) 'corp': corp,
      if (name != null) 'name': name,
      if (race != null) 'race': race,
      if (leadership != null) 'leadership': leadership,
      if (influence != null) 'influence': influence,
      if (pilot != null) 'pilot': pilot,
      if (astrogation != null) 'astrogation': astrogation,
      if (computation != null) 'computation': computation,
      if (repair != null) 'repair': repair,
      if (shipWeapons != null) 'ship_weapons': shipWeapons,
      if (firearms != null) 'firearms': firearms,
      if (melee != null) 'melee': melee,
      if (athletics != null) 'athletics': athletics,
    });
  }

  CharactersCompanion copyWith({
    Value<int>? id,
    Value<int?>? cid,
    Value<String?>? corp,
    Value<String>? name,
    Value<String?>? race,
    Value<int>? leadership,
    Value<int>? influence,
    Value<int>? pilot,
    Value<int>? astrogation,
    Value<int>? computation,
    Value<int>? repair,
    Value<int>? shipWeapons,
    Value<int>? firearms,
    Value<int>? melee,
    Value<int>? athletics,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      cid: cid ?? this.cid,
      corp: corp ?? this.corp,
      name: name ?? this.name,
      race: race ?? this.race,
      leadership: leadership ?? this.leadership,
      influence: influence ?? this.influence,
      pilot: pilot ?? this.pilot,
      astrogation: astrogation ?? this.astrogation,
      computation: computation ?? this.computation,
      repair: repair ?? this.repair,
      shipWeapons: shipWeapons ?? this.shipWeapons,
      firearms: firearms ?? this.firearms,
      melee: melee ?? this.melee,
      athletics: athletics ?? this.athletics,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cid.present) {
      map['cid'] = Variable<int>(cid.value);
    }
    if (corp.present) {
      map['corp'] = Variable<String>(corp.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (race.present) {
      map['race'] = Variable<String>(race.value);
    }
    if (leadership.present) {
      map['leadership'] = Variable<int>(leadership.value);
    }
    if (influence.present) {
      map['influence'] = Variable<int>(influence.value);
    }
    if (pilot.present) {
      map['pilot'] = Variable<int>(pilot.value);
    }
    if (astrogation.present) {
      map['astrogation'] = Variable<int>(astrogation.value);
    }
    if (computation.present) {
      map['computation'] = Variable<int>(computation.value);
    }
    if (repair.present) {
      map['repair'] = Variable<int>(repair.value);
    }
    if (shipWeapons.present) {
      map['ship_weapons'] = Variable<int>(shipWeapons.value);
    }
    if (firearms.present) {
      map['firearms'] = Variable<int>(firearms.value);
    }
    if (melee.present) {
      map['melee'] = Variable<int>(melee.value);
    }
    if (athletics.present) {
      map['athletics'] = Variable<int>(athletics.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('cid: $cid, ')
          ..write('corp: $corp, ')
          ..write('name: $name, ')
          ..write('race: $race, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('astrogation: $astrogation, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('firearms: $firearms, ')
          ..write('melee: $melee, ')
          ..write('athletics: $athletics')
          ..write(')'))
        .toString();
  }
}

class $CombatStatsTable extends CombatStats
    with TableInfo<$CombatStatsTable, CombatStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CombatStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _attackIdMeta = const VerificationMeta(
    'attackId',
  );
  @override
  late final GeneratedColumn<int> attackId = GeneratedColumn<int>(
    'attack_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _battleIdMeta = const VerificationMeta(
    'battleId',
  );
  @override
  late final GeneratedColumn<int> battleId = GeneratedColumn<int>(
    'battle_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attackSquadronMeta = const VerificationMeta(
    'attackSquadron',
  );
  @override
  late final GeneratedColumn<String> attackSquadron = GeneratedColumn<String>(
    'attack_squadron',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attackerMeta = const VerificationMeta(
    'attacker',
  );
  @override
  late final GeneratedColumn<String> attacker = GeneratedColumn<String>(
    'attacker',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weaponMeta = const VerificationMeta('weapon');
  @override
  late final GeneratedColumn<String> weapon = GeneratedColumn<String>(
    'weapon',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _damageMeta = const VerificationMeta('damage');
  @override
  late final GeneratedColumn<int> damage = GeneratedColumn<int>(
    'damage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedColumn<String> target = GeneratedColumn<String>(
    'target',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _destroyedMeta = const VerificationMeta(
    'destroyed',
  );
  @override
  late final GeneratedColumn<String> destroyed = GeneratedColumn<String>(
    'destroyed',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 5,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    attackId,
    battleId,
    attackSquadron,
    attacker,
    weapon,
    damage,
    target,
    destroyed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'combat_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<CombatStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('attack_id')) {
      context.handle(
        _attackIdMeta,
        attackId.isAcceptableOrUnknown(data['attack_id']!, _attackIdMeta),
      );
    }
    if (data.containsKey('battle_id')) {
      context.handle(
        _battleIdMeta,
        battleId.isAcceptableOrUnknown(data['battle_id']!, _battleIdMeta),
      );
    }
    if (data.containsKey('attack_squadron')) {
      context.handle(
        _attackSquadronMeta,
        attackSquadron.isAcceptableOrUnknown(
          data['attack_squadron']!,
          _attackSquadronMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_attackSquadronMeta);
    }
    if (data.containsKey('attacker')) {
      context.handle(
        _attackerMeta,
        attacker.isAcceptableOrUnknown(data['attacker']!, _attackerMeta),
      );
    }
    if (data.containsKey('weapon')) {
      context.handle(
        _weaponMeta,
        weapon.isAcceptableOrUnknown(data['weapon']!, _weaponMeta),
      );
    }
    if (data.containsKey('damage')) {
      context.handle(
        _damageMeta,
        damage.isAcceptableOrUnknown(data['damage']!, _damageMeta),
      );
    }
    if (data.containsKey('target')) {
      context.handle(
        _targetMeta,
        target.isAcceptableOrUnknown(data['target']!, _targetMeta),
      );
    }
    if (data.containsKey('destroyed')) {
      context.handle(
        _destroyedMeta,
        destroyed.isAcceptableOrUnknown(data['destroyed']!, _destroyedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {attackId};
  @override
  CombatStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CombatStat(
      attackId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attack_id'],
      )!,
      battleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}battle_id'],
      ),
      attackSquadron: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attack_squadron'],
      )!,
      attacker: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attacker'],
      ),
      weapon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weapon'],
      ),
      damage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}damage'],
      )!,
      target: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target'],
      ),
      destroyed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destroyed'],
      ),
    );
  }

  @override
  $CombatStatsTable createAlias(String alias) {
    return $CombatStatsTable(attachedDatabase, alias);
  }
}

class CombatStat extends DataClass implements Insertable<CombatStat> {
  final int attackId;
  final int? battleId;
  final String attackSquadron;
  final String? attacker;
  final String? weapon;
  final int damage;
  final String? target;
  final String? destroyed;
  const CombatStat({
    required this.attackId,
    this.battleId,
    required this.attackSquadron,
    this.attacker,
    this.weapon,
    required this.damage,
    this.target,
    this.destroyed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['attack_id'] = Variable<int>(attackId);
    if (!nullToAbsent || battleId != null) {
      map['battle_id'] = Variable<int>(battleId);
    }
    map['attack_squadron'] = Variable<String>(attackSquadron);
    if (!nullToAbsent || attacker != null) {
      map['attacker'] = Variable<String>(attacker);
    }
    if (!nullToAbsent || weapon != null) {
      map['weapon'] = Variable<String>(weapon);
    }
    map['damage'] = Variable<int>(damage);
    if (!nullToAbsent || target != null) {
      map['target'] = Variable<String>(target);
    }
    if (!nullToAbsent || destroyed != null) {
      map['destroyed'] = Variable<String>(destroyed);
    }
    return map;
  }

  CombatStatsCompanion toCompanion(bool nullToAbsent) {
    return CombatStatsCompanion(
      attackId: Value(attackId),
      battleId: battleId == null && nullToAbsent
          ? const Value.absent()
          : Value(battleId),
      attackSquadron: Value(attackSquadron),
      attacker: attacker == null && nullToAbsent
          ? const Value.absent()
          : Value(attacker),
      weapon: weapon == null && nullToAbsent
          ? const Value.absent()
          : Value(weapon),
      damage: Value(damage),
      target: target == null && nullToAbsent
          ? const Value.absent()
          : Value(target),
      destroyed: destroyed == null && nullToAbsent
          ? const Value.absent()
          : Value(destroyed),
    );
  }

  factory CombatStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CombatStat(
      attackId: serializer.fromJson<int>(json['attackId']),
      battleId: serializer.fromJson<int?>(json['battleId']),
      attackSquadron: serializer.fromJson<String>(json['attackSquadron']),
      attacker: serializer.fromJson<String?>(json['attacker']),
      weapon: serializer.fromJson<String?>(json['weapon']),
      damage: serializer.fromJson<int>(json['damage']),
      target: serializer.fromJson<String?>(json['target']),
      destroyed: serializer.fromJson<String?>(json['destroyed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'attackId': serializer.toJson<int>(attackId),
      'battleId': serializer.toJson<int?>(battleId),
      'attackSquadron': serializer.toJson<String>(attackSquadron),
      'attacker': serializer.toJson<String?>(attacker),
      'weapon': serializer.toJson<String?>(weapon),
      'damage': serializer.toJson<int>(damage),
      'target': serializer.toJson<String?>(target),
      'destroyed': serializer.toJson<String?>(destroyed),
    };
  }

  CombatStat copyWith({
    int? attackId,
    Value<int?> battleId = const Value.absent(),
    String? attackSquadron,
    Value<String?> attacker = const Value.absent(),
    Value<String?> weapon = const Value.absent(),
    int? damage,
    Value<String?> target = const Value.absent(),
    Value<String?> destroyed = const Value.absent(),
  }) => CombatStat(
    attackId: attackId ?? this.attackId,
    battleId: battleId.present ? battleId.value : this.battleId,
    attackSquadron: attackSquadron ?? this.attackSquadron,
    attacker: attacker.present ? attacker.value : this.attacker,
    weapon: weapon.present ? weapon.value : this.weapon,
    damage: damage ?? this.damage,
    target: target.present ? target.value : this.target,
    destroyed: destroyed.present ? destroyed.value : this.destroyed,
  );
  CombatStat copyWithCompanion(CombatStatsCompanion data) {
    return CombatStat(
      attackId: data.attackId.present ? data.attackId.value : this.attackId,
      battleId: data.battleId.present ? data.battleId.value : this.battleId,
      attackSquadron: data.attackSquadron.present
          ? data.attackSquadron.value
          : this.attackSquadron,
      attacker: data.attacker.present ? data.attacker.value : this.attacker,
      weapon: data.weapon.present ? data.weapon.value : this.weapon,
      damage: data.damage.present ? data.damage.value : this.damage,
      target: data.target.present ? data.target.value : this.target,
      destroyed: data.destroyed.present ? data.destroyed.value : this.destroyed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CombatStat(')
          ..write('attackId: $attackId, ')
          ..write('battleId: $battleId, ')
          ..write('attackSquadron: $attackSquadron, ')
          ..write('attacker: $attacker, ')
          ..write('weapon: $weapon, ')
          ..write('damage: $damage, ')
          ..write('target: $target, ')
          ..write('destroyed: $destroyed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    attackId,
    battleId,
    attackSquadron,
    attacker,
    weapon,
    damage,
    target,
    destroyed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CombatStat &&
          other.attackId == this.attackId &&
          other.battleId == this.battleId &&
          other.attackSquadron == this.attackSquadron &&
          other.attacker == this.attacker &&
          other.weapon == this.weapon &&
          other.damage == this.damage &&
          other.target == this.target &&
          other.destroyed == this.destroyed);
}

class CombatStatsCompanion extends UpdateCompanion<CombatStat> {
  final Value<int> attackId;
  final Value<int?> battleId;
  final Value<String> attackSquadron;
  final Value<String?> attacker;
  final Value<String?> weapon;
  final Value<int> damage;
  final Value<String?> target;
  final Value<String?> destroyed;
  const CombatStatsCompanion({
    this.attackId = const Value.absent(),
    this.battleId = const Value.absent(),
    this.attackSquadron = const Value.absent(),
    this.attacker = const Value.absent(),
    this.weapon = const Value.absent(),
    this.damage = const Value.absent(),
    this.target = const Value.absent(),
    this.destroyed = const Value.absent(),
  });
  CombatStatsCompanion.insert({
    this.attackId = const Value.absent(),
    this.battleId = const Value.absent(),
    required String attackSquadron,
    this.attacker = const Value.absent(),
    this.weapon = const Value.absent(),
    this.damage = const Value.absent(),
    this.target = const Value.absent(),
    this.destroyed = const Value.absent(),
  }) : attackSquadron = Value(attackSquadron);
  static Insertable<CombatStat> custom({
    Expression<int>? attackId,
    Expression<int>? battleId,
    Expression<String>? attackSquadron,
    Expression<String>? attacker,
    Expression<String>? weapon,
    Expression<int>? damage,
    Expression<String>? target,
    Expression<String>? destroyed,
  }) {
    return RawValuesInsertable({
      if (attackId != null) 'attack_id': attackId,
      if (battleId != null) 'battle_id': battleId,
      if (attackSquadron != null) 'attack_squadron': attackSquadron,
      if (attacker != null) 'attacker': attacker,
      if (weapon != null) 'weapon': weapon,
      if (damage != null) 'damage': damage,
      if (target != null) 'target': target,
      if (destroyed != null) 'destroyed': destroyed,
    });
  }

  CombatStatsCompanion copyWith({
    Value<int>? attackId,
    Value<int?>? battleId,
    Value<String>? attackSquadron,
    Value<String?>? attacker,
    Value<String?>? weapon,
    Value<int>? damage,
    Value<String?>? target,
    Value<String?>? destroyed,
  }) {
    return CombatStatsCompanion(
      attackId: attackId ?? this.attackId,
      battleId: battleId ?? this.battleId,
      attackSquadron: attackSquadron ?? this.attackSquadron,
      attacker: attacker ?? this.attacker,
      weapon: weapon ?? this.weapon,
      damage: damage ?? this.damage,
      target: target ?? this.target,
      destroyed: destroyed ?? this.destroyed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (attackId.present) {
      map['attack_id'] = Variable<int>(attackId.value);
    }
    if (battleId.present) {
      map['battle_id'] = Variable<int>(battleId.value);
    }
    if (attackSquadron.present) {
      map['attack_squadron'] = Variable<String>(attackSquadron.value);
    }
    if (attacker.present) {
      map['attacker'] = Variable<String>(attacker.value);
    }
    if (weapon.present) {
      map['weapon'] = Variable<String>(weapon.value);
    }
    if (damage.present) {
      map['damage'] = Variable<int>(damage.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (destroyed.present) {
      map['destroyed'] = Variable<String>(destroyed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CombatStatsCompanion(')
          ..write('attackId: $attackId, ')
          ..write('battleId: $battleId, ')
          ..write('attackSquadron: $attackSquadron, ')
          ..write('attacker: $attacker, ')
          ..write('weapon: $weapon, ')
          ..write('damage: $damage, ')
          ..write('target: $target, ')
          ..write('destroyed: $destroyed')
          ..write(')'))
        .toString();
  }
}

class $CorpInventoryTable extends CorpInventory
    with TableInfo<$CorpInventoryTable, CorpInventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CorpInventoryTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemMeta = const VerificationMeta('item');
  @override
  late final GeneratedColumn<String> item = GeneratedColumn<String>(
    'item',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int> qty = GeneratedColumn<int>(
    'qty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, corpName, item, qty];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corp_inventory';
  @override
  VerificationContext validateIntegrity(
    Insertable<CorpInventoryItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('item')) {
      context.handle(
        _itemMeta,
        item.isAcceptableOrUnknown(data['item']!, _itemMeta),
      );
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
        _qtyMeta,
        qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CorpInventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CorpInventoryItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      item: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item'],
      )!,
      qty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}qty'],
      )!,
    );
  }

  @override
  $CorpInventoryTable createAlias(String alias) {
    return $CorpInventoryTable(attachedDatabase, alias);
  }
}

class CorpInventoryItem extends DataClass
    implements Insertable<CorpInventoryItem> {
  final int id;
  final String corpName;
  final String item;
  final int qty;
  const CorpInventoryItem({
    required this.id,
    required this.corpName,
    required this.item,
    required this.qty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['corp_name'] = Variable<String>(corpName);
    map['item'] = Variable<String>(item);
    map['qty'] = Variable<int>(qty);
    return map;
  }

  CorpInventoryCompanion toCompanion(bool nullToAbsent) {
    return CorpInventoryCompanion(
      id: Value(id),
      corpName: Value(corpName),
      item: Value(item),
      qty: Value(qty),
    );
  }

  factory CorpInventoryItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CorpInventoryItem(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String>(json['corpName']),
      item: serializer.fromJson<String>(json['item']),
      qty: serializer.fromJson<int>(json['qty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String>(corpName),
      'item': serializer.toJson<String>(item),
      'qty': serializer.toJson<int>(qty),
    };
  }

  CorpInventoryItem copyWith({
    int? id,
    String? corpName,
    String? item,
    int? qty,
  }) => CorpInventoryItem(
    id: id ?? this.id,
    corpName: corpName ?? this.corpName,
    item: item ?? this.item,
    qty: qty ?? this.qty,
  );
  CorpInventoryItem copyWithCompanion(CorpInventoryCompanion data) {
    return CorpInventoryItem(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      item: data.item.present ? data.item.value : this.item,
      qty: data.qty.present ? data.qty.value : this.qty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CorpInventoryItem(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('item: $item, ')
          ..write('qty: $qty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, corpName, item, qty);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CorpInventoryItem &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.item == this.item &&
          other.qty == this.qty);
}

class CorpInventoryCompanion extends UpdateCompanion<CorpInventoryItem> {
  final Value<int> id;
  final Value<String> corpName;
  final Value<String> item;
  final Value<int> qty;
  const CorpInventoryCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.item = const Value.absent(),
    this.qty = const Value.absent(),
  });
  CorpInventoryCompanion.insert({
    this.id = const Value.absent(),
    required String corpName,
    required String item,
    this.qty = const Value.absent(),
  }) : corpName = Value(corpName),
       item = Value(item);
  static Insertable<CorpInventoryItem> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<String>? item,
    Expression<int>? qty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (item != null) 'item': item,
      if (qty != null) 'qty': qty,
    });
  }

  CorpInventoryCompanion copyWith({
    Value<int>? id,
    Value<String>? corpName,
    Value<String>? item,
    Value<int>? qty,
  }) {
    return CorpInventoryCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      item: item ?? this.item,
      qty: qty ?? this.qty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (item.present) {
      map['item'] = Variable<String>(item.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorpInventoryCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('item: $item, ')
          ..write('qty: $qty')
          ..write(')'))
        .toString();
  }
}

class $CorpResearchTable extends CorpResearch
    with TableInfo<$CorpResearchTable, CorpResearchItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CorpResearchTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _researchTypeMeta = const VerificationMeta(
    'researchType',
  );
  @override
  late final GeneratedColumn<String> researchType = GeneratedColumn<String>(
    'research_type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextGoalMeta = const VerificationMeta(
    'nextGoal',
  );
  @override
  late final GeneratedColumn<int> nextGoal = GeneratedColumn<int>(
    'next_goal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(300),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    researchType,
    level,
    progress,
    nextGoal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corp_research';
  @override
  VerificationContext validateIntegrity(
    Insertable<CorpResearchItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('research_type')) {
      context.handle(
        _researchTypeMeta,
        researchType.isAcceptableOrUnknown(
          data['research_type']!,
          _researchTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_researchTypeMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('next_goal')) {
      context.handle(
        _nextGoalMeta,
        nextGoal.isAcceptableOrUnknown(data['next_goal']!, _nextGoalMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CorpResearchItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CorpResearchItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      researchType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}research_type'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      nextGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_goal'],
      )!,
    );
  }

  @override
  $CorpResearchTable createAlias(String alias) {
    return $CorpResearchTable(attachedDatabase, alias);
  }
}

class CorpResearchItem extends DataClass
    implements Insertable<CorpResearchItem> {
  final int id;
  final String corpName;
  final String researchType;
  final int level;
  final int progress;
  final int nextGoal;
  const CorpResearchItem({
    required this.id,
    required this.corpName,
    required this.researchType,
    required this.level,
    required this.progress,
    required this.nextGoal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['corp_name'] = Variable<String>(corpName);
    map['research_type'] = Variable<String>(researchType);
    map['level'] = Variable<int>(level);
    map['progress'] = Variable<int>(progress);
    map['next_goal'] = Variable<int>(nextGoal);
    return map;
  }

  CorpResearchCompanion toCompanion(bool nullToAbsent) {
    return CorpResearchCompanion(
      id: Value(id),
      corpName: Value(corpName),
      researchType: Value(researchType),
      level: Value(level),
      progress: Value(progress),
      nextGoal: Value(nextGoal),
    );
  }

  factory CorpResearchItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CorpResearchItem(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String>(json['corpName']),
      researchType: serializer.fromJson<String>(json['researchType']),
      level: serializer.fromJson<int>(json['level']),
      progress: serializer.fromJson<int>(json['progress']),
      nextGoal: serializer.fromJson<int>(json['nextGoal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String>(corpName),
      'researchType': serializer.toJson<String>(researchType),
      'level': serializer.toJson<int>(level),
      'progress': serializer.toJson<int>(progress),
      'nextGoal': serializer.toJson<int>(nextGoal),
    };
  }

  CorpResearchItem copyWith({
    int? id,
    String? corpName,
    String? researchType,
    int? level,
    int? progress,
    int? nextGoal,
  }) => CorpResearchItem(
    id: id ?? this.id,
    corpName: corpName ?? this.corpName,
    researchType: researchType ?? this.researchType,
    level: level ?? this.level,
    progress: progress ?? this.progress,
    nextGoal: nextGoal ?? this.nextGoal,
  );
  CorpResearchItem copyWithCompanion(CorpResearchCompanion data) {
    return CorpResearchItem(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      researchType: data.researchType.present
          ? data.researchType.value
          : this.researchType,
      level: data.level.present ? data.level.value : this.level,
      progress: data.progress.present ? data.progress.value : this.progress,
      nextGoal: data.nextGoal.present ? data.nextGoal.value : this.nextGoal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CorpResearchItem(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('researchType: $researchType, ')
          ..write('level: $level, ')
          ..write('progress: $progress, ')
          ..write('nextGoal: $nextGoal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, corpName, researchType, level, progress, nextGoal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CorpResearchItem &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.researchType == this.researchType &&
          other.level == this.level &&
          other.progress == this.progress &&
          other.nextGoal == this.nextGoal);
}

class CorpResearchCompanion extends UpdateCompanion<CorpResearchItem> {
  final Value<int> id;
  final Value<String> corpName;
  final Value<String> researchType;
  final Value<int> level;
  final Value<int> progress;
  final Value<int> nextGoal;
  const CorpResearchCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.researchType = const Value.absent(),
    this.level = const Value.absent(),
    this.progress = const Value.absent(),
    this.nextGoal = const Value.absent(),
  });
  CorpResearchCompanion.insert({
    this.id = const Value.absent(),
    required String corpName,
    required String researchType,
    this.level = const Value.absent(),
    this.progress = const Value.absent(),
    this.nextGoal = const Value.absent(),
  }) : corpName = Value(corpName),
       researchType = Value(researchType);
  static Insertable<CorpResearchItem> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<String>? researchType,
    Expression<int>? level,
    Expression<int>? progress,
    Expression<int>? nextGoal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (researchType != null) 'research_type': researchType,
      if (level != null) 'level': level,
      if (progress != null) 'progress': progress,
      if (nextGoal != null) 'next_goal': nextGoal,
    });
  }

  CorpResearchCompanion copyWith({
    Value<int>? id,
    Value<String>? corpName,
    Value<String>? researchType,
    Value<int>? level,
    Value<int>? progress,
    Value<int>? nextGoal,
  }) {
    return CorpResearchCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      researchType: researchType ?? this.researchType,
      level: level ?? this.level,
      progress: progress ?? this.progress,
      nextGoal: nextGoal ?? this.nextGoal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (researchType.present) {
      map['research_type'] = Variable<String>(researchType.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (nextGoal.present) {
      map['next_goal'] = Variable<int>(nextGoal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorpResearchCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('researchType: $researchType, ')
          ..write('level: $level, ')
          ..write('progress: $progress, ')
          ..write('nextGoal: $nextGoal')
          ..write(')'))
        .toString();
  }
}

class $CrewTable extends Crew with TableInfo<$CrewTable, CrewMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CrewTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _squadronMeta = const VerificationMeta(
    'squadron',
  );
  @override
  late final GeneratedColumn<String> squadron = GeneratedColumn<String>(
    'squadron',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shipNameMeta = const VerificationMeta(
    'shipName',
  );
  @override
  late final GeneratedColumn<String> shipName = GeneratedColumn<String>(
    'ship_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _assignmentMeta = const VerificationMeta(
    'assignment',
  );
  @override
  late final GeneratedColumn<String> assignment = GeneratedColumn<String>(
    'assignment',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Unassigned'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Active'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _leadershipMeta = const VerificationMeta(
    'leadership',
  );
  @override
  late final GeneratedColumn<int> leadership = GeneratedColumn<int>(
    'leadership',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _influenceMeta = const VerificationMeta(
    'influence',
  );
  @override
  late final GeneratedColumn<int> influence = GeneratedColumn<int>(
    'influence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pilotMeta = const VerificationMeta('pilot');
  @override
  late final GeneratedColumn<int> pilot = GeneratedColumn<int>(
    'pilot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _computationMeta = const VerificationMeta(
    'computation',
  );
  @override
  late final GeneratedColumn<int> computation = GeneratedColumn<int>(
    'computation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repairMeta = const VerificationMeta('repair');
  @override
  late final GeneratedColumn<int> repair = GeneratedColumn<int>(
    'repair',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _shipWeaponsMeta = const VerificationMeta(
    'shipWeapons',
  );
  @override
  late final GeneratedColumn<int> shipWeapons = GeneratedColumn<int>(
    'ship_weapons',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fightingMeta = const VerificationMeta(
    'fighting',
  );
  @override
  late final GeneratedColumn<int> fighting = GeneratedColumn<int>(
    'fighting',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _athleticsMeta = const VerificationMeta(
    'athletics',
  );
  @override
  late final GeneratedColumn<int> athletics = GeneratedColumn<int>(
    'athletics',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    squadron,
    shipName,
    assignment,
    status,
    name,
    leadership,
    influence,
    pilot,
    computation,
    repair,
    shipWeapons,
    fighting,
    athletics,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crew';
  @override
  VerificationContext validateIntegrity(
    Insertable<CrewMember> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    }
    if (data.containsKey('squadron')) {
      context.handle(
        _squadronMeta,
        squadron.isAcceptableOrUnknown(data['squadron']!, _squadronMeta),
      );
    }
    if (data.containsKey('ship_name')) {
      context.handle(
        _shipNameMeta,
        shipName.isAcceptableOrUnknown(data['ship_name']!, _shipNameMeta),
      );
    }
    if (data.containsKey('assignment')) {
      context.handle(
        _assignmentMeta,
        assignment.isAcceptableOrUnknown(data['assignment']!, _assignmentMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('leadership')) {
      context.handle(
        _leadershipMeta,
        leadership.isAcceptableOrUnknown(data['leadership']!, _leadershipMeta),
      );
    }
    if (data.containsKey('influence')) {
      context.handle(
        _influenceMeta,
        influence.isAcceptableOrUnknown(data['influence']!, _influenceMeta),
      );
    }
    if (data.containsKey('pilot')) {
      context.handle(
        _pilotMeta,
        pilot.isAcceptableOrUnknown(data['pilot']!, _pilotMeta),
      );
    }
    if (data.containsKey('computation')) {
      context.handle(
        _computationMeta,
        computation.isAcceptableOrUnknown(
          data['computation']!,
          _computationMeta,
        ),
      );
    }
    if (data.containsKey('repair')) {
      context.handle(
        _repairMeta,
        repair.isAcceptableOrUnknown(data['repair']!, _repairMeta),
      );
    }
    if (data.containsKey('ship_weapons')) {
      context.handle(
        _shipWeaponsMeta,
        shipWeapons.isAcceptableOrUnknown(
          data['ship_weapons']!,
          _shipWeaponsMeta,
        ),
      );
    }
    if (data.containsKey('fighting')) {
      context.handle(
        _fightingMeta,
        fighting.isAcceptableOrUnknown(data['fighting']!, _fightingMeta),
      );
    }
    if (data.containsKey('athletics')) {
      context.handle(
        _athleticsMeta,
        athletics.isAcceptableOrUnknown(data['athletics']!, _athleticsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CrewMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CrewMember(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      ),
      squadron: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}squadron'],
      ),
      shipName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ship_name'],
      ),
      assignment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assignment'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      leadership: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}leadership'],
      )!,
      influence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}influence'],
      )!,
      pilot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pilot'],
      )!,
      computation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}computation'],
      )!,
      repair: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repair'],
      )!,
      shipWeapons: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ship_weapons'],
      )!,
      fighting: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fighting'],
      )!,
      athletics: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}athletics'],
      )!,
    );
  }

  @override
  $CrewTable createAlias(String alias) {
    return $CrewTable(attachedDatabase, alias);
  }
}

class CrewMember extends DataClass implements Insertable<CrewMember> {
  final int id;
  final String? corpName;
  final String? squadron;
  final String? shipName;
  final String assignment;
  final String status;
  final String name;
  final int leadership;
  final int influence;
  final int pilot;
  final int computation;
  final int repair;
  final int shipWeapons;
  final int fighting;
  final int athletics;
  const CrewMember({
    required this.id,
    this.corpName,
    this.squadron,
    this.shipName,
    required this.assignment,
    required this.status,
    required this.name,
    required this.leadership,
    required this.influence,
    required this.pilot,
    required this.computation,
    required this.repair,
    required this.shipWeapons,
    required this.fighting,
    required this.athletics,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || corpName != null) {
      map['corp_name'] = Variable<String>(corpName);
    }
    if (!nullToAbsent || squadron != null) {
      map['squadron'] = Variable<String>(squadron);
    }
    if (!nullToAbsent || shipName != null) {
      map['ship_name'] = Variable<String>(shipName);
    }
    map['assignment'] = Variable<String>(assignment);
    map['status'] = Variable<String>(status);
    map['name'] = Variable<String>(name);
    map['leadership'] = Variable<int>(leadership);
    map['influence'] = Variable<int>(influence);
    map['pilot'] = Variable<int>(pilot);
    map['computation'] = Variable<int>(computation);
    map['repair'] = Variable<int>(repair);
    map['ship_weapons'] = Variable<int>(shipWeapons);
    map['fighting'] = Variable<int>(fighting);
    map['athletics'] = Variable<int>(athletics);
    return map;
  }

  CrewCompanion toCompanion(bool nullToAbsent) {
    return CrewCompanion(
      id: Value(id),
      corpName: corpName == null && nullToAbsent
          ? const Value.absent()
          : Value(corpName),
      squadron: squadron == null && nullToAbsent
          ? const Value.absent()
          : Value(squadron),
      shipName: shipName == null && nullToAbsent
          ? const Value.absent()
          : Value(shipName),
      assignment: Value(assignment),
      status: Value(status),
      name: Value(name),
      leadership: Value(leadership),
      influence: Value(influence),
      pilot: Value(pilot),
      computation: Value(computation),
      repair: Value(repair),
      shipWeapons: Value(shipWeapons),
      fighting: Value(fighting),
      athletics: Value(athletics),
    );
  }

  factory CrewMember.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CrewMember(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String?>(json['corpName']),
      squadron: serializer.fromJson<String?>(json['squadron']),
      shipName: serializer.fromJson<String?>(json['shipName']),
      assignment: serializer.fromJson<String>(json['assignment']),
      status: serializer.fromJson<String>(json['status']),
      name: serializer.fromJson<String>(json['name']),
      leadership: serializer.fromJson<int>(json['leadership']),
      influence: serializer.fromJson<int>(json['influence']),
      pilot: serializer.fromJson<int>(json['pilot']),
      computation: serializer.fromJson<int>(json['computation']),
      repair: serializer.fromJson<int>(json['repair']),
      shipWeapons: serializer.fromJson<int>(json['shipWeapons']),
      fighting: serializer.fromJson<int>(json['fighting']),
      athletics: serializer.fromJson<int>(json['athletics']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String?>(corpName),
      'squadron': serializer.toJson<String?>(squadron),
      'shipName': serializer.toJson<String?>(shipName),
      'assignment': serializer.toJson<String>(assignment),
      'status': serializer.toJson<String>(status),
      'name': serializer.toJson<String>(name),
      'leadership': serializer.toJson<int>(leadership),
      'influence': serializer.toJson<int>(influence),
      'pilot': serializer.toJson<int>(pilot),
      'computation': serializer.toJson<int>(computation),
      'repair': serializer.toJson<int>(repair),
      'shipWeapons': serializer.toJson<int>(shipWeapons),
      'fighting': serializer.toJson<int>(fighting),
      'athletics': serializer.toJson<int>(athletics),
    };
  }

  CrewMember copyWith({
    int? id,
    Value<String?> corpName = const Value.absent(),
    Value<String?> squadron = const Value.absent(),
    Value<String?> shipName = const Value.absent(),
    String? assignment,
    String? status,
    String? name,
    int? leadership,
    int? influence,
    int? pilot,
    int? computation,
    int? repair,
    int? shipWeapons,
    int? fighting,
    int? athletics,
  }) => CrewMember(
    id: id ?? this.id,
    corpName: corpName.present ? corpName.value : this.corpName,
    squadron: squadron.present ? squadron.value : this.squadron,
    shipName: shipName.present ? shipName.value : this.shipName,
    assignment: assignment ?? this.assignment,
    status: status ?? this.status,
    name: name ?? this.name,
    leadership: leadership ?? this.leadership,
    influence: influence ?? this.influence,
    pilot: pilot ?? this.pilot,
    computation: computation ?? this.computation,
    repair: repair ?? this.repair,
    shipWeapons: shipWeapons ?? this.shipWeapons,
    fighting: fighting ?? this.fighting,
    athletics: athletics ?? this.athletics,
  );
  CrewMember copyWithCompanion(CrewCompanion data) {
    return CrewMember(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      squadron: data.squadron.present ? data.squadron.value : this.squadron,
      shipName: data.shipName.present ? data.shipName.value : this.shipName,
      assignment: data.assignment.present
          ? data.assignment.value
          : this.assignment,
      status: data.status.present ? data.status.value : this.status,
      name: data.name.present ? data.name.value : this.name,
      leadership: data.leadership.present
          ? data.leadership.value
          : this.leadership,
      influence: data.influence.present ? data.influence.value : this.influence,
      pilot: data.pilot.present ? data.pilot.value : this.pilot,
      computation: data.computation.present
          ? data.computation.value
          : this.computation,
      repair: data.repair.present ? data.repair.value : this.repair,
      shipWeapons: data.shipWeapons.present
          ? data.shipWeapons.value
          : this.shipWeapons,
      fighting: data.fighting.present ? data.fighting.value : this.fighting,
      athletics: data.athletics.present ? data.athletics.value : this.athletics,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CrewMember(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('squadron: $squadron, ')
          ..write('shipName: $shipName, ')
          ..write('assignment: $assignment, ')
          ..write('status: $status, ')
          ..write('name: $name, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('fighting: $fighting, ')
          ..write('athletics: $athletics')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    corpName,
    squadron,
    shipName,
    assignment,
    status,
    name,
    leadership,
    influence,
    pilot,
    computation,
    repair,
    shipWeapons,
    fighting,
    athletics,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CrewMember &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.squadron == this.squadron &&
          other.shipName == this.shipName &&
          other.assignment == this.assignment &&
          other.status == this.status &&
          other.name == this.name &&
          other.leadership == this.leadership &&
          other.influence == this.influence &&
          other.pilot == this.pilot &&
          other.computation == this.computation &&
          other.repair == this.repair &&
          other.shipWeapons == this.shipWeapons &&
          other.fighting == this.fighting &&
          other.athletics == this.athletics);
}

class CrewCompanion extends UpdateCompanion<CrewMember> {
  final Value<int> id;
  final Value<String?> corpName;
  final Value<String?> squadron;
  final Value<String?> shipName;
  final Value<String> assignment;
  final Value<String> status;
  final Value<String> name;
  final Value<int> leadership;
  final Value<int> influence;
  final Value<int> pilot;
  final Value<int> computation;
  final Value<int> repair;
  final Value<int> shipWeapons;
  final Value<int> fighting;
  final Value<int> athletics;
  const CrewCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.squadron = const Value.absent(),
    this.shipName = const Value.absent(),
    this.assignment = const Value.absent(),
    this.status = const Value.absent(),
    this.name = const Value.absent(),
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.fighting = const Value.absent(),
    this.athletics = const Value.absent(),
  });
  CrewCompanion.insert({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.squadron = const Value.absent(),
    this.shipName = const Value.absent(),
    this.assignment = const Value.absent(),
    this.status = const Value.absent(),
    required String name,
    this.leadership = const Value.absent(),
    this.influence = const Value.absent(),
    this.pilot = const Value.absent(),
    this.computation = const Value.absent(),
    this.repair = const Value.absent(),
    this.shipWeapons = const Value.absent(),
    this.fighting = const Value.absent(),
    this.athletics = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CrewMember> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<String>? squadron,
    Expression<String>? shipName,
    Expression<String>? assignment,
    Expression<String>? status,
    Expression<String>? name,
    Expression<int>? leadership,
    Expression<int>? influence,
    Expression<int>? pilot,
    Expression<int>? computation,
    Expression<int>? repair,
    Expression<int>? shipWeapons,
    Expression<int>? fighting,
    Expression<int>? athletics,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (squadron != null) 'squadron': squadron,
      if (shipName != null) 'ship_name': shipName,
      if (assignment != null) 'assignment': assignment,
      if (status != null) 'status': status,
      if (name != null) 'name': name,
      if (leadership != null) 'leadership': leadership,
      if (influence != null) 'influence': influence,
      if (pilot != null) 'pilot': pilot,
      if (computation != null) 'computation': computation,
      if (repair != null) 'repair': repair,
      if (shipWeapons != null) 'ship_weapons': shipWeapons,
      if (fighting != null) 'fighting': fighting,
      if (athletics != null) 'athletics': athletics,
    });
  }

  CrewCompanion copyWith({
    Value<int>? id,
    Value<String?>? corpName,
    Value<String?>? squadron,
    Value<String?>? shipName,
    Value<String>? assignment,
    Value<String>? status,
    Value<String>? name,
    Value<int>? leadership,
    Value<int>? influence,
    Value<int>? pilot,
    Value<int>? computation,
    Value<int>? repair,
    Value<int>? shipWeapons,
    Value<int>? fighting,
    Value<int>? athletics,
  }) {
    return CrewCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      squadron: squadron ?? this.squadron,
      shipName: shipName ?? this.shipName,
      assignment: assignment ?? this.assignment,
      status: status ?? this.status,
      name: name ?? this.name,
      leadership: leadership ?? this.leadership,
      influence: influence ?? this.influence,
      pilot: pilot ?? this.pilot,
      computation: computation ?? this.computation,
      repair: repair ?? this.repair,
      shipWeapons: shipWeapons ?? this.shipWeapons,
      fighting: fighting ?? this.fighting,
      athletics: athletics ?? this.athletics,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (squadron.present) {
      map['squadron'] = Variable<String>(squadron.value);
    }
    if (shipName.present) {
      map['ship_name'] = Variable<String>(shipName.value);
    }
    if (assignment.present) {
      map['assignment'] = Variable<String>(assignment.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (leadership.present) {
      map['leadership'] = Variable<int>(leadership.value);
    }
    if (influence.present) {
      map['influence'] = Variable<int>(influence.value);
    }
    if (pilot.present) {
      map['pilot'] = Variable<int>(pilot.value);
    }
    if (computation.present) {
      map['computation'] = Variable<int>(computation.value);
    }
    if (repair.present) {
      map['repair'] = Variable<int>(repair.value);
    }
    if (shipWeapons.present) {
      map['ship_weapons'] = Variable<int>(shipWeapons.value);
    }
    if (fighting.present) {
      map['fighting'] = Variable<int>(fighting.value);
    }
    if (athletics.present) {
      map['athletics'] = Variable<int>(athletics.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CrewCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('squadron: $squadron, ')
          ..write('shipName: $shipName, ')
          ..write('assignment: $assignment, ')
          ..write('status: $status, ')
          ..write('name: $name, ')
          ..write('leadership: $leadership, ')
          ..write('influence: $influence, ')
          ..write('pilot: $pilot, ')
          ..write('computation: $computation, ')
          ..write('repair: $repair, ')
          ..write('shipWeapons: $shipWeapons, ')
          ..write('fighting: $fighting, ')
          ..write('athletics: $athletics')
          ..write(')'))
        .toString();
  }
}

class $CrewGenerateTable extends CrewGenerate
    with TableInfo<$CrewGenerateTable, CrewGenerateEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CrewGenerateTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nationalityMeta = const VerificationMeta(
    'nationality',
  );
  @override
  late final GeneratedColumn<String> nationality = GeneratedColumn<String>(
    'nationality',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _forenameMeta = const VerificationMeta(
    'forename',
  );
  @override
  late final GeneratedColumn<String> forename = GeneratedColumn<String>(
    'forename',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surnameMeta = const VerificationMeta(
    'surname',
  );
  @override
  late final GeneratedColumn<String> surname = GeneratedColumn<String>(
    'surname',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nationality,
    gender,
    forename,
    surname,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crew_generate';
  @override
  VerificationContext validateIntegrity(
    Insertable<CrewGenerateEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nationality')) {
      context.handle(
        _nationalityMeta,
        nationality.isAcceptableOrUnknown(
          data['nationality']!,
          _nationalityMeta,
        ),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('forename')) {
      context.handle(
        _forenameMeta,
        forename.isAcceptableOrUnknown(data['forename']!, _forenameMeta),
      );
    }
    if (data.containsKey('surname')) {
      context.handle(
        _surnameMeta,
        surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CrewGenerateEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CrewGenerateEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nationality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nationality'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      forename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}forename'],
      ),
      surname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surname'],
      ),
    );
  }

  @override
  $CrewGenerateTable createAlias(String alias) {
    return $CrewGenerateTable(attachedDatabase, alias);
  }
}

class CrewGenerateEntry extends DataClass
    implements Insertable<CrewGenerateEntry> {
  final int id;
  final String? nationality;
  final String? gender;
  final String? forename;
  final String? surname;
  const CrewGenerateEntry({
    required this.id,
    this.nationality,
    this.gender,
    this.forename,
    this.surname,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nationality != null) {
      map['nationality'] = Variable<String>(nationality);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || forename != null) {
      map['forename'] = Variable<String>(forename);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = Variable<String>(surname);
    }
    return map;
  }

  CrewGenerateCompanion toCompanion(bool nullToAbsent) {
    return CrewGenerateCompanion(
      id: Value(id),
      nationality: nationality == null && nullToAbsent
          ? const Value.absent()
          : Value(nationality),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      forename: forename == null && nullToAbsent
          ? const Value.absent()
          : Value(forename),
      surname: surname == null && nullToAbsent
          ? const Value.absent()
          : Value(surname),
    );
  }

  factory CrewGenerateEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CrewGenerateEntry(
      id: serializer.fromJson<int>(json['id']),
      nationality: serializer.fromJson<String?>(json['nationality']),
      gender: serializer.fromJson<String?>(json['gender']),
      forename: serializer.fromJson<String?>(json['forename']),
      surname: serializer.fromJson<String?>(json['surname']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nationality': serializer.toJson<String?>(nationality),
      'gender': serializer.toJson<String?>(gender),
      'forename': serializer.toJson<String?>(forename),
      'surname': serializer.toJson<String?>(surname),
    };
  }

  CrewGenerateEntry copyWith({
    int? id,
    Value<String?> nationality = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> forename = const Value.absent(),
    Value<String?> surname = const Value.absent(),
  }) => CrewGenerateEntry(
    id: id ?? this.id,
    nationality: nationality.present ? nationality.value : this.nationality,
    gender: gender.present ? gender.value : this.gender,
    forename: forename.present ? forename.value : this.forename,
    surname: surname.present ? surname.value : this.surname,
  );
  CrewGenerateEntry copyWithCompanion(CrewGenerateCompanion data) {
    return CrewGenerateEntry(
      id: data.id.present ? data.id.value : this.id,
      nationality: data.nationality.present
          ? data.nationality.value
          : this.nationality,
      gender: data.gender.present ? data.gender.value : this.gender,
      forename: data.forename.present ? data.forename.value : this.forename,
      surname: data.surname.present ? data.surname.value : this.surname,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CrewGenerateEntry(')
          ..write('id: $id, ')
          ..write('nationality: $nationality, ')
          ..write('gender: $gender, ')
          ..write('forename: $forename, ')
          ..write('surname: $surname')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nationality, gender, forename, surname);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CrewGenerateEntry &&
          other.id == this.id &&
          other.nationality == this.nationality &&
          other.gender == this.gender &&
          other.forename == this.forename &&
          other.surname == this.surname);
}

class CrewGenerateCompanion extends UpdateCompanion<CrewGenerateEntry> {
  final Value<int> id;
  final Value<String?> nationality;
  final Value<String?> gender;
  final Value<String?> forename;
  final Value<String?> surname;
  const CrewGenerateCompanion({
    this.id = const Value.absent(),
    this.nationality = const Value.absent(),
    this.gender = const Value.absent(),
    this.forename = const Value.absent(),
    this.surname = const Value.absent(),
  });
  CrewGenerateCompanion.insert({
    this.id = const Value.absent(),
    this.nationality = const Value.absent(),
    this.gender = const Value.absent(),
    this.forename = const Value.absent(),
    this.surname = const Value.absent(),
  });
  static Insertable<CrewGenerateEntry> custom({
    Expression<int>? id,
    Expression<String>? nationality,
    Expression<String>? gender,
    Expression<String>? forename,
    Expression<String>? surname,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nationality != null) 'nationality': nationality,
      if (gender != null) 'gender': gender,
      if (forename != null) 'forename': forename,
      if (surname != null) 'surname': surname,
    });
  }

  CrewGenerateCompanion copyWith({
    Value<int>? id,
    Value<String?>? nationality,
    Value<String?>? gender,
    Value<String?>? forename,
    Value<String?>? surname,
  }) {
    return CrewGenerateCompanion(
      id: id ?? this.id,
      nationality: nationality ?? this.nationality,
      gender: gender ?? this.gender,
      forename: forename ?? this.forename,
      surname: surname ?? this.surname,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nationality.present) {
      map['nationality'] = Variable<String>(nationality.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (forename.present) {
      map['forename'] = Variable<String>(forename.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CrewGenerateCompanion(')
          ..write('id: $id, ')
          ..write('nationality: $nationality, ')
          ..write('gender: $gender, ')
          ..write('forename: $forename, ')
          ..write('surname: $surname')
          ..write(')'))
        .toString();
  }
}

class $FleetTable extends Fleet with TableInfo<$FleetTable, FleetShip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FleetTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _squadronMeta = const VerificationMeta(
    'squadron',
  );
  @override
  late final GeneratedColumn<String> squadron = GeneratedColumn<String>(
    'squadron',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Squadron 1'),
  );
  static const VerificationMeta _shipNameMeta = const VerificationMeta(
    'shipName',
  );
  @override
  late final GeneratedColumn<String> shipName = GeneratedColumn<String>(
    'ship_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shipClassMeta = const VerificationMeta(
    'shipClass',
  );
  @override
  late final GeneratedColumn<String> shipClass = GeneratedColumn<String>(
    'ship_class',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shipSizeMeta = const VerificationMeta(
    'shipSize',
  );
  @override
  late final GeneratedColumn<int> shipSize = GeneratedColumn<int>(
    'ship_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _shipModelMeta = const VerificationMeta(
    'shipModel',
  );
  @override
  late final GeneratedColumn<String> shipModel = GeneratedColumn<String>(
    'ship_model',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weapMeta = const VerificationMeta('weap');
  @override
  late final GeneratedColumn<int> weap = GeneratedColumn<int>(
    'weap',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _armorMeta = const VerificationMeta('armor');
  @override
  late final GeneratedColumn<int> armor = GeneratedColumn<int>(
    'armor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _baysMeta = const VerificationMeta('bays');
  @override
  late final GeneratedColumn<int> bays = GeneratedColumn<int>(
    'bays',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _cargoMeta = const VerificationMeta('cargo');
  @override
  late final GeneratedColumn<int> cargo = GeneratedColumn<int>(
    'cargo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _enginesMeta = const VerificationMeta(
    'engines',
  );
  @override
  late final GeneratedColumn<int> engines = GeneratedColumn<int>(
    'engines',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maneuvMeta = const VerificationMeta('maneuv');
  @override
  late final GeneratedColumn<int> maneuv = GeneratedColumn<int>(
    'maneuv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weapCtrlMeta = const VerificationMeta(
    'weapCtrl',
  );
  @override
  late final GeneratedColumn<int> weapCtrl = GeneratedColumn<int>(
    'weap_ctrl',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _cloakMeta = const VerificationMeta('cloak');
  @override
  late final GeneratedColumn<int> cloak = GeneratedColumn<int>(
    'cloak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lifeSuppMeta = const VerificationMeta(
    'lifeSupp',
  );
  @override
  late final GeneratedColumn<int> lifeSupp = GeneratedColumn<int>(
    'life_supp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxCargoMeta = const VerificationMeta(
    'maxCargo',
  );
  @override
  late final GeneratedColumn<int> maxCargo = GeneratedColumn<int>(
    'max_cargo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxEnginesMeta = const VerificationMeta(
    'maxEngines',
  );
  @override
  late final GeneratedColumn<int> maxEngines = GeneratedColumn<int>(
    'max_engines',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxManeuvMeta = const VerificationMeta(
    'maxManeuv',
  );
  @override
  late final GeneratedColumn<int> maxManeuv = GeneratedColumn<int>(
    'max_maneuv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxWeapCtrlMeta = const VerificationMeta(
    'maxWeapCtrl',
  );
  @override
  late final GeneratedColumn<int> maxWeapCtrl = GeneratedColumn<int>(
    'max_weap_ctrl',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxLifeSuppMeta = const VerificationMeta(
    'maxLifeSupp',
  );
  @override
  late final GeneratedColumn<int> maxLifeSupp = GeneratedColumn<int>(
    'max_life_supp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _hpMeta = const VerificationMeta('hp');
  @override
  late final GeneratedColumn<int> hp = GeneratedColumn<int>(
    'hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _maxHpMeta = const VerificationMeta('maxHp');
  @override
  late final GeneratedColumn<int> maxHp = GeneratedColumn<int>(
    'max_hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxShipValueMeta = const VerificationMeta(
    'maxShipValue',
  );
  @override
  late final GeneratedColumn<int> maxShipValue = GeneratedColumn<int>(
    'max_ship_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    squadron,
    shipName,
    shipClass,
    shipSize,
    shipModel,
    weap,
    armor,
    bays,
    cargo,
    engines,
    maneuv,
    weapCtrl,
    cloak,
    lifeSupp,
    maxCargo,
    maxEngines,
    maxManeuv,
    maxWeapCtrl,
    maxLifeSupp,
    hp,
    maxHp,
    value,
    maxShipValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fleet';
  @override
  VerificationContext validateIntegrity(
    Insertable<FleetShip> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    }
    if (data.containsKey('squadron')) {
      context.handle(
        _squadronMeta,
        squadron.isAcceptableOrUnknown(data['squadron']!, _squadronMeta),
      );
    }
    if (data.containsKey('ship_name')) {
      context.handle(
        _shipNameMeta,
        shipName.isAcceptableOrUnknown(data['ship_name']!, _shipNameMeta),
      );
    } else if (isInserting) {
      context.missing(_shipNameMeta);
    }
    if (data.containsKey('ship_class')) {
      context.handle(
        _shipClassMeta,
        shipClass.isAcceptableOrUnknown(data['ship_class']!, _shipClassMeta),
      );
    }
    if (data.containsKey('ship_size')) {
      context.handle(
        _shipSizeMeta,
        shipSize.isAcceptableOrUnknown(data['ship_size']!, _shipSizeMeta),
      );
    }
    if (data.containsKey('ship_model')) {
      context.handle(
        _shipModelMeta,
        shipModel.isAcceptableOrUnknown(data['ship_model']!, _shipModelMeta),
      );
    }
    if (data.containsKey('weap')) {
      context.handle(
        _weapMeta,
        weap.isAcceptableOrUnknown(data['weap']!, _weapMeta),
      );
    }
    if (data.containsKey('armor')) {
      context.handle(
        _armorMeta,
        armor.isAcceptableOrUnknown(data['armor']!, _armorMeta),
      );
    }
    if (data.containsKey('bays')) {
      context.handle(
        _baysMeta,
        bays.isAcceptableOrUnknown(data['bays']!, _baysMeta),
      );
    }
    if (data.containsKey('cargo')) {
      context.handle(
        _cargoMeta,
        cargo.isAcceptableOrUnknown(data['cargo']!, _cargoMeta),
      );
    }
    if (data.containsKey('engines')) {
      context.handle(
        _enginesMeta,
        engines.isAcceptableOrUnknown(data['engines']!, _enginesMeta),
      );
    }
    if (data.containsKey('maneuv')) {
      context.handle(
        _maneuvMeta,
        maneuv.isAcceptableOrUnknown(data['maneuv']!, _maneuvMeta),
      );
    }
    if (data.containsKey('weap_ctrl')) {
      context.handle(
        _weapCtrlMeta,
        weapCtrl.isAcceptableOrUnknown(data['weap_ctrl']!, _weapCtrlMeta),
      );
    }
    if (data.containsKey('cloak')) {
      context.handle(
        _cloakMeta,
        cloak.isAcceptableOrUnknown(data['cloak']!, _cloakMeta),
      );
    }
    if (data.containsKey('life_supp')) {
      context.handle(
        _lifeSuppMeta,
        lifeSupp.isAcceptableOrUnknown(data['life_supp']!, _lifeSuppMeta),
      );
    }
    if (data.containsKey('max_cargo')) {
      context.handle(
        _maxCargoMeta,
        maxCargo.isAcceptableOrUnknown(data['max_cargo']!, _maxCargoMeta),
      );
    }
    if (data.containsKey('max_engines')) {
      context.handle(
        _maxEnginesMeta,
        maxEngines.isAcceptableOrUnknown(data['max_engines']!, _maxEnginesMeta),
      );
    }
    if (data.containsKey('max_maneuv')) {
      context.handle(
        _maxManeuvMeta,
        maxManeuv.isAcceptableOrUnknown(data['max_maneuv']!, _maxManeuvMeta),
      );
    }
    if (data.containsKey('max_weap_ctrl')) {
      context.handle(
        _maxWeapCtrlMeta,
        maxWeapCtrl.isAcceptableOrUnknown(
          data['max_weap_ctrl']!,
          _maxWeapCtrlMeta,
        ),
      );
    }
    if (data.containsKey('max_life_supp')) {
      context.handle(
        _maxLifeSuppMeta,
        maxLifeSupp.isAcceptableOrUnknown(
          data['max_life_supp']!,
          _maxLifeSuppMeta,
        ),
      );
    }
    if (data.containsKey('hp')) {
      context.handle(_hpMeta, hp.isAcceptableOrUnknown(data['hp']!, _hpMeta));
    }
    if (data.containsKey('max_hp')) {
      context.handle(
        _maxHpMeta,
        maxHp.isAcceptableOrUnknown(data['max_hp']!, _maxHpMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('max_ship_value')) {
      context.handle(
        _maxShipValueMeta,
        maxShipValue.isAcceptableOrUnknown(
          data['max_ship_value']!,
          _maxShipValueMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FleetShip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FleetShip(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      ),
      squadron: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}squadron'],
      )!,
      shipName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ship_name'],
      )!,
      shipClass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ship_class'],
      ),
      shipSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ship_size'],
      )!,
      shipModel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ship_model'],
      ),
      weap: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weap'],
      )!,
      armor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}armor'],
      )!,
      bays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bays'],
      )!,
      cargo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cargo'],
      )!,
      engines: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}engines'],
      )!,
      maneuv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}maneuv'],
      )!,
      weapCtrl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weap_ctrl'],
      )!,
      cloak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cloak'],
      )!,
      lifeSupp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}life_supp'],
      )!,
      maxCargo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_cargo'],
      )!,
      maxEngines: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_engines'],
      )!,
      maxManeuv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_maneuv'],
      )!,
      maxWeapCtrl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_weap_ctrl'],
      )!,
      maxLifeSupp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_life_supp'],
      )!,
      hp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hp'],
      )!,
      maxHp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_hp'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
      maxShipValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_ship_value'],
      )!,
    );
  }

  @override
  $FleetTable createAlias(String alias) {
    return $FleetTable(attachedDatabase, alias);
  }
}

class FleetShip extends DataClass implements Insertable<FleetShip> {
  final int id;
  final String? corpName;
  final String squadron;
  final String shipName;
  final String? shipClass;
  final int shipSize;
  final String? shipModel;
  final int weap;
  final int armor;
  final int bays;
  final int cargo;
  final int engines;
  final int maneuv;
  final int weapCtrl;
  final int cloak;
  final int lifeSupp;
  final int maxCargo;
  final int maxEngines;
  final int maxManeuv;
  final int maxWeapCtrl;
  final int maxLifeSupp;
  final int hp;
  final int maxHp;
  final int value;
  final int maxShipValue;
  const FleetShip({
    required this.id,
    this.corpName,
    required this.squadron,
    required this.shipName,
    this.shipClass,
    required this.shipSize,
    this.shipModel,
    required this.weap,
    required this.armor,
    required this.bays,
    required this.cargo,
    required this.engines,
    required this.maneuv,
    required this.weapCtrl,
    required this.cloak,
    required this.lifeSupp,
    required this.maxCargo,
    required this.maxEngines,
    required this.maxManeuv,
    required this.maxWeapCtrl,
    required this.maxLifeSupp,
    required this.hp,
    required this.maxHp,
    required this.value,
    required this.maxShipValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || corpName != null) {
      map['corp_name'] = Variable<String>(corpName);
    }
    map['squadron'] = Variable<String>(squadron);
    map['ship_name'] = Variable<String>(shipName);
    if (!nullToAbsent || shipClass != null) {
      map['ship_class'] = Variable<String>(shipClass);
    }
    map['ship_size'] = Variable<int>(shipSize);
    if (!nullToAbsent || shipModel != null) {
      map['ship_model'] = Variable<String>(shipModel);
    }
    map['weap'] = Variable<int>(weap);
    map['armor'] = Variable<int>(armor);
    map['bays'] = Variable<int>(bays);
    map['cargo'] = Variable<int>(cargo);
    map['engines'] = Variable<int>(engines);
    map['maneuv'] = Variable<int>(maneuv);
    map['weap_ctrl'] = Variable<int>(weapCtrl);
    map['cloak'] = Variable<int>(cloak);
    map['life_supp'] = Variable<int>(lifeSupp);
    map['max_cargo'] = Variable<int>(maxCargo);
    map['max_engines'] = Variable<int>(maxEngines);
    map['max_maneuv'] = Variable<int>(maxManeuv);
    map['max_weap_ctrl'] = Variable<int>(maxWeapCtrl);
    map['max_life_supp'] = Variable<int>(maxLifeSupp);
    map['hp'] = Variable<int>(hp);
    map['max_hp'] = Variable<int>(maxHp);
    map['value'] = Variable<int>(value);
    map['max_ship_value'] = Variable<int>(maxShipValue);
    return map;
  }

  FleetCompanion toCompanion(bool nullToAbsent) {
    return FleetCompanion(
      id: Value(id),
      corpName: corpName == null && nullToAbsent
          ? const Value.absent()
          : Value(corpName),
      squadron: Value(squadron),
      shipName: Value(shipName),
      shipClass: shipClass == null && nullToAbsent
          ? const Value.absent()
          : Value(shipClass),
      shipSize: Value(shipSize),
      shipModel: shipModel == null && nullToAbsent
          ? const Value.absent()
          : Value(shipModel),
      weap: Value(weap),
      armor: Value(armor),
      bays: Value(bays),
      cargo: Value(cargo),
      engines: Value(engines),
      maneuv: Value(maneuv),
      weapCtrl: Value(weapCtrl),
      cloak: Value(cloak),
      lifeSupp: Value(lifeSupp),
      maxCargo: Value(maxCargo),
      maxEngines: Value(maxEngines),
      maxManeuv: Value(maxManeuv),
      maxWeapCtrl: Value(maxWeapCtrl),
      maxLifeSupp: Value(maxLifeSupp),
      hp: Value(hp),
      maxHp: Value(maxHp),
      value: Value(value),
      maxShipValue: Value(maxShipValue),
    );
  }

  factory FleetShip.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FleetShip(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String?>(json['corpName']),
      squadron: serializer.fromJson<String>(json['squadron']),
      shipName: serializer.fromJson<String>(json['shipName']),
      shipClass: serializer.fromJson<String?>(json['shipClass']),
      shipSize: serializer.fromJson<int>(json['shipSize']),
      shipModel: serializer.fromJson<String?>(json['shipModel']),
      weap: serializer.fromJson<int>(json['weap']),
      armor: serializer.fromJson<int>(json['armor']),
      bays: serializer.fromJson<int>(json['bays']),
      cargo: serializer.fromJson<int>(json['cargo']),
      engines: serializer.fromJson<int>(json['engines']),
      maneuv: serializer.fromJson<int>(json['maneuv']),
      weapCtrl: serializer.fromJson<int>(json['weapCtrl']),
      cloak: serializer.fromJson<int>(json['cloak']),
      lifeSupp: serializer.fromJson<int>(json['lifeSupp']),
      maxCargo: serializer.fromJson<int>(json['maxCargo']),
      maxEngines: serializer.fromJson<int>(json['maxEngines']),
      maxManeuv: serializer.fromJson<int>(json['maxManeuv']),
      maxWeapCtrl: serializer.fromJson<int>(json['maxWeapCtrl']),
      maxLifeSupp: serializer.fromJson<int>(json['maxLifeSupp']),
      hp: serializer.fromJson<int>(json['hp']),
      maxHp: serializer.fromJson<int>(json['maxHp']),
      value: serializer.fromJson<int>(json['value']),
      maxShipValue: serializer.fromJson<int>(json['maxShipValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String?>(corpName),
      'squadron': serializer.toJson<String>(squadron),
      'shipName': serializer.toJson<String>(shipName),
      'shipClass': serializer.toJson<String?>(shipClass),
      'shipSize': serializer.toJson<int>(shipSize),
      'shipModel': serializer.toJson<String?>(shipModel),
      'weap': serializer.toJson<int>(weap),
      'armor': serializer.toJson<int>(armor),
      'bays': serializer.toJson<int>(bays),
      'cargo': serializer.toJson<int>(cargo),
      'engines': serializer.toJson<int>(engines),
      'maneuv': serializer.toJson<int>(maneuv),
      'weapCtrl': serializer.toJson<int>(weapCtrl),
      'cloak': serializer.toJson<int>(cloak),
      'lifeSupp': serializer.toJson<int>(lifeSupp),
      'maxCargo': serializer.toJson<int>(maxCargo),
      'maxEngines': serializer.toJson<int>(maxEngines),
      'maxManeuv': serializer.toJson<int>(maxManeuv),
      'maxWeapCtrl': serializer.toJson<int>(maxWeapCtrl),
      'maxLifeSupp': serializer.toJson<int>(maxLifeSupp),
      'hp': serializer.toJson<int>(hp),
      'maxHp': serializer.toJson<int>(maxHp),
      'value': serializer.toJson<int>(value),
      'maxShipValue': serializer.toJson<int>(maxShipValue),
    };
  }

  FleetShip copyWith({
    int? id,
    Value<String?> corpName = const Value.absent(),
    String? squadron,
    String? shipName,
    Value<String?> shipClass = const Value.absent(),
    int? shipSize,
    Value<String?> shipModel = const Value.absent(),
    int? weap,
    int? armor,
    int? bays,
    int? cargo,
    int? engines,
    int? maneuv,
    int? weapCtrl,
    int? cloak,
    int? lifeSupp,
    int? maxCargo,
    int? maxEngines,
    int? maxManeuv,
    int? maxWeapCtrl,
    int? maxLifeSupp,
    int? hp,
    int? maxHp,
    int? value,
    int? maxShipValue,
  }) => FleetShip(
    id: id ?? this.id,
    corpName: corpName.present ? corpName.value : this.corpName,
    squadron: squadron ?? this.squadron,
    shipName: shipName ?? this.shipName,
    shipClass: shipClass.present ? shipClass.value : this.shipClass,
    shipSize: shipSize ?? this.shipSize,
    shipModel: shipModel.present ? shipModel.value : this.shipModel,
    weap: weap ?? this.weap,
    armor: armor ?? this.armor,
    bays: bays ?? this.bays,
    cargo: cargo ?? this.cargo,
    engines: engines ?? this.engines,
    maneuv: maneuv ?? this.maneuv,
    weapCtrl: weapCtrl ?? this.weapCtrl,
    cloak: cloak ?? this.cloak,
    lifeSupp: lifeSupp ?? this.lifeSupp,
    maxCargo: maxCargo ?? this.maxCargo,
    maxEngines: maxEngines ?? this.maxEngines,
    maxManeuv: maxManeuv ?? this.maxManeuv,
    maxWeapCtrl: maxWeapCtrl ?? this.maxWeapCtrl,
    maxLifeSupp: maxLifeSupp ?? this.maxLifeSupp,
    hp: hp ?? this.hp,
    maxHp: maxHp ?? this.maxHp,
    value: value ?? this.value,
    maxShipValue: maxShipValue ?? this.maxShipValue,
  );
  FleetShip copyWithCompanion(FleetCompanion data) {
    return FleetShip(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      squadron: data.squadron.present ? data.squadron.value : this.squadron,
      shipName: data.shipName.present ? data.shipName.value : this.shipName,
      shipClass: data.shipClass.present ? data.shipClass.value : this.shipClass,
      shipSize: data.shipSize.present ? data.shipSize.value : this.shipSize,
      shipModel: data.shipModel.present ? data.shipModel.value : this.shipModel,
      weap: data.weap.present ? data.weap.value : this.weap,
      armor: data.armor.present ? data.armor.value : this.armor,
      bays: data.bays.present ? data.bays.value : this.bays,
      cargo: data.cargo.present ? data.cargo.value : this.cargo,
      engines: data.engines.present ? data.engines.value : this.engines,
      maneuv: data.maneuv.present ? data.maneuv.value : this.maneuv,
      weapCtrl: data.weapCtrl.present ? data.weapCtrl.value : this.weapCtrl,
      cloak: data.cloak.present ? data.cloak.value : this.cloak,
      lifeSupp: data.lifeSupp.present ? data.lifeSupp.value : this.lifeSupp,
      maxCargo: data.maxCargo.present ? data.maxCargo.value : this.maxCargo,
      maxEngines: data.maxEngines.present
          ? data.maxEngines.value
          : this.maxEngines,
      maxManeuv: data.maxManeuv.present ? data.maxManeuv.value : this.maxManeuv,
      maxWeapCtrl: data.maxWeapCtrl.present
          ? data.maxWeapCtrl.value
          : this.maxWeapCtrl,
      maxLifeSupp: data.maxLifeSupp.present
          ? data.maxLifeSupp.value
          : this.maxLifeSupp,
      hp: data.hp.present ? data.hp.value : this.hp,
      maxHp: data.maxHp.present ? data.maxHp.value : this.maxHp,
      value: data.value.present ? data.value.value : this.value,
      maxShipValue: data.maxShipValue.present
          ? data.maxShipValue.value
          : this.maxShipValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FleetShip(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('squadron: $squadron, ')
          ..write('shipName: $shipName, ')
          ..write('shipClass: $shipClass, ')
          ..write('shipSize: $shipSize, ')
          ..write('shipModel: $shipModel, ')
          ..write('weap: $weap, ')
          ..write('armor: $armor, ')
          ..write('bays: $bays, ')
          ..write('cargo: $cargo, ')
          ..write('engines: $engines, ')
          ..write('maneuv: $maneuv, ')
          ..write('weapCtrl: $weapCtrl, ')
          ..write('cloak: $cloak, ')
          ..write('lifeSupp: $lifeSupp, ')
          ..write('maxCargo: $maxCargo, ')
          ..write('maxEngines: $maxEngines, ')
          ..write('maxManeuv: $maxManeuv, ')
          ..write('maxWeapCtrl: $maxWeapCtrl, ')
          ..write('maxLifeSupp: $maxLifeSupp, ')
          ..write('hp: $hp, ')
          ..write('maxHp: $maxHp, ')
          ..write('value: $value, ')
          ..write('maxShipValue: $maxShipValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    corpName,
    squadron,
    shipName,
    shipClass,
    shipSize,
    shipModel,
    weap,
    armor,
    bays,
    cargo,
    engines,
    maneuv,
    weapCtrl,
    cloak,
    lifeSupp,
    maxCargo,
    maxEngines,
    maxManeuv,
    maxWeapCtrl,
    maxLifeSupp,
    hp,
    maxHp,
    value,
    maxShipValue,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FleetShip &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.squadron == this.squadron &&
          other.shipName == this.shipName &&
          other.shipClass == this.shipClass &&
          other.shipSize == this.shipSize &&
          other.shipModel == this.shipModel &&
          other.weap == this.weap &&
          other.armor == this.armor &&
          other.bays == this.bays &&
          other.cargo == this.cargo &&
          other.engines == this.engines &&
          other.maneuv == this.maneuv &&
          other.weapCtrl == this.weapCtrl &&
          other.cloak == this.cloak &&
          other.lifeSupp == this.lifeSupp &&
          other.maxCargo == this.maxCargo &&
          other.maxEngines == this.maxEngines &&
          other.maxManeuv == this.maxManeuv &&
          other.maxWeapCtrl == this.maxWeapCtrl &&
          other.maxLifeSupp == this.maxLifeSupp &&
          other.hp == this.hp &&
          other.maxHp == this.maxHp &&
          other.value == this.value &&
          other.maxShipValue == this.maxShipValue);
}

class FleetCompanion extends UpdateCompanion<FleetShip> {
  final Value<int> id;
  final Value<String?> corpName;
  final Value<String> squadron;
  final Value<String> shipName;
  final Value<String?> shipClass;
  final Value<int> shipSize;
  final Value<String?> shipModel;
  final Value<int> weap;
  final Value<int> armor;
  final Value<int> bays;
  final Value<int> cargo;
  final Value<int> engines;
  final Value<int> maneuv;
  final Value<int> weapCtrl;
  final Value<int> cloak;
  final Value<int> lifeSupp;
  final Value<int> maxCargo;
  final Value<int> maxEngines;
  final Value<int> maxManeuv;
  final Value<int> maxWeapCtrl;
  final Value<int> maxLifeSupp;
  final Value<int> hp;
  final Value<int> maxHp;
  final Value<int> value;
  final Value<int> maxShipValue;
  const FleetCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.squadron = const Value.absent(),
    this.shipName = const Value.absent(),
    this.shipClass = const Value.absent(),
    this.shipSize = const Value.absent(),
    this.shipModel = const Value.absent(),
    this.weap = const Value.absent(),
    this.armor = const Value.absent(),
    this.bays = const Value.absent(),
    this.cargo = const Value.absent(),
    this.engines = const Value.absent(),
    this.maneuv = const Value.absent(),
    this.weapCtrl = const Value.absent(),
    this.cloak = const Value.absent(),
    this.lifeSupp = const Value.absent(),
    this.maxCargo = const Value.absent(),
    this.maxEngines = const Value.absent(),
    this.maxManeuv = const Value.absent(),
    this.maxWeapCtrl = const Value.absent(),
    this.maxLifeSupp = const Value.absent(),
    this.hp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.value = const Value.absent(),
    this.maxShipValue = const Value.absent(),
  });
  FleetCompanion.insert({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.squadron = const Value.absent(),
    required String shipName,
    this.shipClass = const Value.absent(),
    this.shipSize = const Value.absent(),
    this.shipModel = const Value.absent(),
    this.weap = const Value.absent(),
    this.armor = const Value.absent(),
    this.bays = const Value.absent(),
    this.cargo = const Value.absent(),
    this.engines = const Value.absent(),
    this.maneuv = const Value.absent(),
    this.weapCtrl = const Value.absent(),
    this.cloak = const Value.absent(),
    this.lifeSupp = const Value.absent(),
    this.maxCargo = const Value.absent(),
    this.maxEngines = const Value.absent(),
    this.maxManeuv = const Value.absent(),
    this.maxWeapCtrl = const Value.absent(),
    this.maxLifeSupp = const Value.absent(),
    this.hp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.value = const Value.absent(),
    this.maxShipValue = const Value.absent(),
  }) : shipName = Value(shipName);
  static Insertable<FleetShip> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<String>? squadron,
    Expression<String>? shipName,
    Expression<String>? shipClass,
    Expression<int>? shipSize,
    Expression<String>? shipModel,
    Expression<int>? weap,
    Expression<int>? armor,
    Expression<int>? bays,
    Expression<int>? cargo,
    Expression<int>? engines,
    Expression<int>? maneuv,
    Expression<int>? weapCtrl,
    Expression<int>? cloak,
    Expression<int>? lifeSupp,
    Expression<int>? maxCargo,
    Expression<int>? maxEngines,
    Expression<int>? maxManeuv,
    Expression<int>? maxWeapCtrl,
    Expression<int>? maxLifeSupp,
    Expression<int>? hp,
    Expression<int>? maxHp,
    Expression<int>? value,
    Expression<int>? maxShipValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (squadron != null) 'squadron': squadron,
      if (shipName != null) 'ship_name': shipName,
      if (shipClass != null) 'ship_class': shipClass,
      if (shipSize != null) 'ship_size': shipSize,
      if (shipModel != null) 'ship_model': shipModel,
      if (weap != null) 'weap': weap,
      if (armor != null) 'armor': armor,
      if (bays != null) 'bays': bays,
      if (cargo != null) 'cargo': cargo,
      if (engines != null) 'engines': engines,
      if (maneuv != null) 'maneuv': maneuv,
      if (weapCtrl != null) 'weap_ctrl': weapCtrl,
      if (cloak != null) 'cloak': cloak,
      if (lifeSupp != null) 'life_supp': lifeSupp,
      if (maxCargo != null) 'max_cargo': maxCargo,
      if (maxEngines != null) 'max_engines': maxEngines,
      if (maxManeuv != null) 'max_maneuv': maxManeuv,
      if (maxWeapCtrl != null) 'max_weap_ctrl': maxWeapCtrl,
      if (maxLifeSupp != null) 'max_life_supp': maxLifeSupp,
      if (hp != null) 'hp': hp,
      if (maxHp != null) 'max_hp': maxHp,
      if (value != null) 'value': value,
      if (maxShipValue != null) 'max_ship_value': maxShipValue,
    });
  }

  FleetCompanion copyWith({
    Value<int>? id,
    Value<String?>? corpName,
    Value<String>? squadron,
    Value<String>? shipName,
    Value<String?>? shipClass,
    Value<int>? shipSize,
    Value<String?>? shipModel,
    Value<int>? weap,
    Value<int>? armor,
    Value<int>? bays,
    Value<int>? cargo,
    Value<int>? engines,
    Value<int>? maneuv,
    Value<int>? weapCtrl,
    Value<int>? cloak,
    Value<int>? lifeSupp,
    Value<int>? maxCargo,
    Value<int>? maxEngines,
    Value<int>? maxManeuv,
    Value<int>? maxWeapCtrl,
    Value<int>? maxLifeSupp,
    Value<int>? hp,
    Value<int>? maxHp,
    Value<int>? value,
    Value<int>? maxShipValue,
  }) {
    return FleetCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      squadron: squadron ?? this.squadron,
      shipName: shipName ?? this.shipName,
      shipClass: shipClass ?? this.shipClass,
      shipSize: shipSize ?? this.shipSize,
      shipModel: shipModel ?? this.shipModel,
      weap: weap ?? this.weap,
      armor: armor ?? this.armor,
      bays: bays ?? this.bays,
      cargo: cargo ?? this.cargo,
      engines: engines ?? this.engines,
      maneuv: maneuv ?? this.maneuv,
      weapCtrl: weapCtrl ?? this.weapCtrl,
      cloak: cloak ?? this.cloak,
      lifeSupp: lifeSupp ?? this.lifeSupp,
      maxCargo: maxCargo ?? this.maxCargo,
      maxEngines: maxEngines ?? this.maxEngines,
      maxManeuv: maxManeuv ?? this.maxManeuv,
      maxWeapCtrl: maxWeapCtrl ?? this.maxWeapCtrl,
      maxLifeSupp: maxLifeSupp ?? this.maxLifeSupp,
      hp: hp ?? this.hp,
      maxHp: maxHp ?? this.maxHp,
      value: value ?? this.value,
      maxShipValue: maxShipValue ?? this.maxShipValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (squadron.present) {
      map['squadron'] = Variable<String>(squadron.value);
    }
    if (shipName.present) {
      map['ship_name'] = Variable<String>(shipName.value);
    }
    if (shipClass.present) {
      map['ship_class'] = Variable<String>(shipClass.value);
    }
    if (shipSize.present) {
      map['ship_size'] = Variable<int>(shipSize.value);
    }
    if (shipModel.present) {
      map['ship_model'] = Variable<String>(shipModel.value);
    }
    if (weap.present) {
      map['weap'] = Variable<int>(weap.value);
    }
    if (armor.present) {
      map['armor'] = Variable<int>(armor.value);
    }
    if (bays.present) {
      map['bays'] = Variable<int>(bays.value);
    }
    if (cargo.present) {
      map['cargo'] = Variable<int>(cargo.value);
    }
    if (engines.present) {
      map['engines'] = Variable<int>(engines.value);
    }
    if (maneuv.present) {
      map['maneuv'] = Variable<int>(maneuv.value);
    }
    if (weapCtrl.present) {
      map['weap_ctrl'] = Variable<int>(weapCtrl.value);
    }
    if (cloak.present) {
      map['cloak'] = Variable<int>(cloak.value);
    }
    if (lifeSupp.present) {
      map['life_supp'] = Variable<int>(lifeSupp.value);
    }
    if (maxCargo.present) {
      map['max_cargo'] = Variable<int>(maxCargo.value);
    }
    if (maxEngines.present) {
      map['max_engines'] = Variable<int>(maxEngines.value);
    }
    if (maxManeuv.present) {
      map['max_maneuv'] = Variable<int>(maxManeuv.value);
    }
    if (maxWeapCtrl.present) {
      map['max_weap_ctrl'] = Variable<int>(maxWeapCtrl.value);
    }
    if (maxLifeSupp.present) {
      map['max_life_supp'] = Variable<int>(maxLifeSupp.value);
    }
    if (hp.present) {
      map['hp'] = Variable<int>(hp.value);
    }
    if (maxHp.present) {
      map['max_hp'] = Variable<int>(maxHp.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (maxShipValue.present) {
      map['max_ship_value'] = Variable<int>(maxShipValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FleetCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('squadron: $squadron, ')
          ..write('shipName: $shipName, ')
          ..write('shipClass: $shipClass, ')
          ..write('shipSize: $shipSize, ')
          ..write('shipModel: $shipModel, ')
          ..write('weap: $weap, ')
          ..write('armor: $armor, ')
          ..write('bays: $bays, ')
          ..write('cargo: $cargo, ')
          ..write('engines: $engines, ')
          ..write('maneuv: $maneuv, ')
          ..write('weapCtrl: $weapCtrl, ')
          ..write('cloak: $cloak, ')
          ..write('lifeSupp: $lifeSupp, ')
          ..write('maxCargo: $maxCargo, ')
          ..write('maxEngines: $maxEngines, ')
          ..write('maxManeuv: $maxManeuv, ')
          ..write('maxWeapCtrl: $maxWeapCtrl, ')
          ..write('maxLifeSupp: $maxLifeSupp, ')
          ..write('hp: $hp, ')
          ..write('maxHp: $maxHp, ')
          ..write('value: $value, ')
          ..write('maxShipValue: $maxShipValue')
          ..write(')'))
        .toString();
  }
}

class $GameDataTable extends GameData
    with TableInfo<$GameDataTable, GameDataEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameDataTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _gameTurnMeta = const VerificationMeta(
    'gameTurn',
  );
  @override
  late final GeneratedColumn<int> gameTurn = GeneratedColumn<int>(
    'game_turn',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, gameTurn, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameDataEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_turn')) {
      context.handle(
        _gameTurnMeta,
        gameTurn.isAcceptableOrUnknown(data['game_turn']!, _gameTurnMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameDataEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameDataEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameTurn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_turn'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GameDataTable createAlias(String alias) {
    return $GameDataTable(attachedDatabase, alias);
  }
}

class GameDataEntry extends DataClass implements Insertable<GameDataEntry> {
  final int id;
  final int gameTurn;
  final DateTime updatedAt;
  const GameDataEntry({
    required this.id,
    required this.gameTurn,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_turn'] = Variable<int>(gameTurn);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GameDataCompanion toCompanion(bool nullToAbsent) {
    return GameDataCompanion(
      id: Value(id),
      gameTurn: Value(gameTurn),
      updatedAt: Value(updatedAt),
    );
  }

  factory GameDataEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameDataEntry(
      id: serializer.fromJson<int>(json['id']),
      gameTurn: serializer.fromJson<int>(json['gameTurn']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameTurn': serializer.toJson<int>(gameTurn),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GameDataEntry copyWith({int? id, int? gameTurn, DateTime? updatedAt}) =>
      GameDataEntry(
        id: id ?? this.id,
        gameTurn: gameTurn ?? this.gameTurn,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  GameDataEntry copyWithCompanion(GameDataCompanion data) {
    return GameDataEntry(
      id: data.id.present ? data.id.value : this.id,
      gameTurn: data.gameTurn.present ? data.gameTurn.value : this.gameTurn,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameDataEntry(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameTurn, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameDataEntry &&
          other.id == this.id &&
          other.gameTurn == this.gameTurn &&
          other.updatedAt == this.updatedAt);
}

class GameDataCompanion extends UpdateCompanion<GameDataEntry> {
  final Value<int> id;
  final Value<int> gameTurn;
  final Value<DateTime> updatedAt;
  const GameDataCompanion({
    this.id = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GameDataCompanion.insert({
    this.id = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<GameDataEntry> custom({
    Expression<int>? id,
    Expression<int>? gameTurn,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameTurn != null) 'game_turn': gameTurn,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GameDataCompanion copyWith({
    Value<int>? id,
    Value<int>? gameTurn,
    Value<DateTime>? updatedAt,
  }) {
    return GameDataCompanion(
      id: id ?? this.id,
      gameTurn: gameTurn ?? this.gameTurn,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameTurn.present) {
      map['game_turn'] = Variable<int>(gameTurn.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameDataCompanion(')
          ..write('id: $id, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _verifiedMeta = const VerificationMeta(
    'verified',
  );
  @override
  late final GeneratedColumn<bool> verified = GeneratedColumn<bool>(
    'verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("verified" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isAiMeta = const VerificationMeta('isAi');
  @override
  late final GeneratedColumn<bool> isAi = GeneratedColumn<bool>(
    'is_ai',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_ai" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    password,
    email,
    verified,
    isAi,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'members';
  @override
  VerificationContext validateIntegrity(
    Insertable<Member> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('verified')) {
      context.handle(
        _verifiedMeta,
        verified.isAcceptableOrUnknown(data['verified']!, _verifiedMeta),
      );
    }
    if (data.containsKey('is_ai')) {
      context.handle(
        _isAiMeta,
        isAi.isAcceptableOrUnknown(data['is_ai']!, _isAiMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      verified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}verified'],
      )!,
      isAi: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_ai'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }
}

class Member extends DataClass implements Insertable<Member> {
  final int id;
  final String username;
  final String password;
  final String email;
  final bool verified;
  final bool isAi;
  final DateTime createdAt;
  const Member({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.verified,
    required this.isAi,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['email'] = Variable<String>(email);
    map['verified'] = Variable<bool>(verified);
    map['is_ai'] = Variable<bool>(isAi);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      email: Value(email),
      verified: Value(verified),
      isAi: Value(isAi),
      createdAt: Value(createdAt),
    );
  }

  factory Member.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      email: serializer.fromJson<String>(json['email']),
      verified: serializer.fromJson<bool>(json['verified']),
      isAi: serializer.fromJson<bool>(json['isAi']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'email': serializer.toJson<String>(email),
      'verified': serializer.toJson<bool>(verified),
      'isAi': serializer.toJson<bool>(isAi),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Member copyWith({
    int? id,
    String? username,
    String? password,
    String? email,
    bool? verified,
    bool? isAi,
    DateTime? createdAt,
  }) => Member(
    id: id ?? this.id,
    username: username ?? this.username,
    password: password ?? this.password,
    email: email ?? this.email,
    verified: verified ?? this.verified,
    isAi: isAi ?? this.isAi,
    createdAt: createdAt ?? this.createdAt,
  );
  Member copyWithCompanion(MembersCompanion data) {
    return Member(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      email: data.email.present ? data.email.value : this.email,
      verified: data.verified.present ? data.verified.value : this.verified,
      isAi: data.isAi.present ? data.isAi.value : this.isAi,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('verified: $verified, ')
          ..write('isAi: $isAi, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, username, password, email, verified, isAi, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.email == this.email &&
          other.verified == this.verified &&
          other.isAi == this.isAi &&
          other.createdAt == this.createdAt);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> email;
  final Value<bool> verified;
  final Value<bool> isAi;
  final Value<DateTime> createdAt;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.email = const Value.absent(),
    this.verified = const Value.absent(),
    this.isAi = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MembersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    this.password = const Value.absent(),
    this.email = const Value.absent(),
    this.verified = const Value.absent(),
    this.isAi = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : username = Value(username);
  static Insertable<Member> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? email,
    Expression<bool>? verified,
    Expression<bool>? isAi,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (email != null) 'email': email,
      if (verified != null) 'verified': verified,
      if (isAi != null) 'is_ai': isAi,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MembersCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<String>? password,
    Value<String>? email,
    Value<bool>? verified,
    Value<bool>? isAi,
    Value<DateTime>? createdAt,
  }) {
    return MembersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      verified: verified ?? this.verified,
      isAi: isAi ?? this.isAi,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (isAi.present) {
      map['is_ai'] = Variable<bool>(isAi.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('verified: $verified, ')
          ..write('isAi: $isAi, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MissionHolderTable extends MissionHolder
    with TableInfo<$MissionHolderTable, MissionHolderEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MissionHolderTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gameTurnMeta = const VerificationMeta(
    'gameTurn',
  );
  @override
  late final GeneratedColumn<int> gameTurn = GeneratedColumn<int>(
    'game_turn',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _crMeta = const VerificationMeta('cr');
  @override
  late final GeneratedColumn<int> cr = GeneratedColumn<int>(
    'cr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _payoutMeta = const VerificationMeta('payout');
  @override
  late final GeneratedColumn<int> payout = GeneratedColumn<int>(
    'payout',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bonusMeta = const VerificationMeta('bonus');
  @override
  late final GeneratedColumn<String> bonus = GeneratedColumn<String>(
    'bonus',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _bonusAmtMeta = const VerificationMeta(
    'bonusAmt',
  );
  @override
  late final GeneratedColumn<int> bonusAmt = GeneratedColumn<int>(
    'bonus_amt',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultFailMeta = const VerificationMeta(
    'resultFail',
  );
  @override
  late final GeneratedColumn<String> resultFail = GeneratedColumn<String>(
    'result_fail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultPassMeta = const VerificationMeta(
    'resultPass',
  );
  @override
  late final GeneratedColumn<String> resultPass = GeneratedColumn<String>(
    'result_pass',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    gameTurn,
    type,
    distance,
    cr,
    payout,
    bonus,
    bonusAmt,
    textContent,
    resultFail,
    resultPass,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mission_holder';
  @override
  VerificationContext validateIntegrity(
    Insertable<MissionHolderEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    }
    if (data.containsKey('game_turn')) {
      context.handle(
        _gameTurnMeta,
        gameTurn.isAcceptableOrUnknown(data['game_turn']!, _gameTurnMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    }
    if (data.containsKey('cr')) {
      context.handle(_crMeta, cr.isAcceptableOrUnknown(data['cr']!, _crMeta));
    }
    if (data.containsKey('payout')) {
      context.handle(
        _payoutMeta,
        payout.isAcceptableOrUnknown(data['payout']!, _payoutMeta),
      );
    }
    if (data.containsKey('bonus')) {
      context.handle(
        _bonusMeta,
        bonus.isAcceptableOrUnknown(data['bonus']!, _bonusMeta),
      );
    }
    if (data.containsKey('bonus_amt')) {
      context.handle(
        _bonusAmtMeta,
        bonusAmt.isAcceptableOrUnknown(data['bonus_amt']!, _bonusAmtMeta),
      );
    }
    if (data.containsKey('text')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(data['text']!, _textContentMeta),
      );
    }
    if (data.containsKey('result_fail')) {
      context.handle(
        _resultFailMeta,
        resultFail.isAcceptableOrUnknown(data['result_fail']!, _resultFailMeta),
      );
    }
    if (data.containsKey('result_pass')) {
      context.handle(
        _resultPassMeta,
        resultPass.isAcceptableOrUnknown(data['result_pass']!, _resultPassMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MissionHolderEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MissionHolderEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      ),
      gameTurn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_turn'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      )!,
      cr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cr'],
      )!,
      payout: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payout'],
      )!,
      bonus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bonus'],
      )!,
      bonusAmt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bonus_amt'],
      )!,
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      ),
      resultFail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_fail'],
      ),
      resultPass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_pass'],
      ),
    );
  }

  @override
  $MissionHolderTable createAlias(String alias) {
    return $MissionHolderTable(attachedDatabase, alias);
  }
}

class MissionHolderEntry extends DataClass
    implements Insertable<MissionHolderEntry> {
  final int id;
  final String? corpName;
  final int? gameTurn;
  final String? type;
  final double distance;
  final int cr;
  final int payout;
  final String bonus;
  final int bonusAmt;
  final String? textContent;
  final String? resultFail;
  final String? resultPass;
  const MissionHolderEntry({
    required this.id,
    this.corpName,
    this.gameTurn,
    this.type,
    required this.distance,
    required this.cr,
    required this.payout,
    required this.bonus,
    required this.bonusAmt,
    this.textContent,
    this.resultFail,
    this.resultPass,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || corpName != null) {
      map['corp_name'] = Variable<String>(corpName);
    }
    if (!nullToAbsent || gameTurn != null) {
      map['game_turn'] = Variable<int>(gameTurn);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    map['distance'] = Variable<double>(distance);
    map['cr'] = Variable<int>(cr);
    map['payout'] = Variable<int>(payout);
    map['bonus'] = Variable<String>(bonus);
    map['bonus_amt'] = Variable<int>(bonusAmt);
    if (!nullToAbsent || textContent != null) {
      map['text'] = Variable<String>(textContent);
    }
    if (!nullToAbsent || resultFail != null) {
      map['result_fail'] = Variable<String>(resultFail);
    }
    if (!nullToAbsent || resultPass != null) {
      map['result_pass'] = Variable<String>(resultPass);
    }
    return map;
  }

  MissionHolderCompanion toCompanion(bool nullToAbsent) {
    return MissionHolderCompanion(
      id: Value(id),
      corpName: corpName == null && nullToAbsent
          ? const Value.absent()
          : Value(corpName),
      gameTurn: gameTurn == null && nullToAbsent
          ? const Value.absent()
          : Value(gameTurn),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      distance: Value(distance),
      cr: Value(cr),
      payout: Value(payout),
      bonus: Value(bonus),
      bonusAmt: Value(bonusAmt),
      textContent: textContent == null && nullToAbsent
          ? const Value.absent()
          : Value(textContent),
      resultFail: resultFail == null && nullToAbsent
          ? const Value.absent()
          : Value(resultFail),
      resultPass: resultPass == null && nullToAbsent
          ? const Value.absent()
          : Value(resultPass),
    );
  }

  factory MissionHolderEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MissionHolderEntry(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String?>(json['corpName']),
      gameTurn: serializer.fromJson<int?>(json['gameTurn']),
      type: serializer.fromJson<String?>(json['type']),
      distance: serializer.fromJson<double>(json['distance']),
      cr: serializer.fromJson<int>(json['cr']),
      payout: serializer.fromJson<int>(json['payout']),
      bonus: serializer.fromJson<String>(json['bonus']),
      bonusAmt: serializer.fromJson<int>(json['bonusAmt']),
      textContent: serializer.fromJson<String?>(json['textContent']),
      resultFail: serializer.fromJson<String?>(json['resultFail']),
      resultPass: serializer.fromJson<String?>(json['resultPass']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String?>(corpName),
      'gameTurn': serializer.toJson<int?>(gameTurn),
      'type': serializer.toJson<String?>(type),
      'distance': serializer.toJson<double>(distance),
      'cr': serializer.toJson<int>(cr),
      'payout': serializer.toJson<int>(payout),
      'bonus': serializer.toJson<String>(bonus),
      'bonusAmt': serializer.toJson<int>(bonusAmt),
      'textContent': serializer.toJson<String?>(textContent),
      'resultFail': serializer.toJson<String?>(resultFail),
      'resultPass': serializer.toJson<String?>(resultPass),
    };
  }

  MissionHolderEntry copyWith({
    int? id,
    Value<String?> corpName = const Value.absent(),
    Value<int?> gameTurn = const Value.absent(),
    Value<String?> type = const Value.absent(),
    double? distance,
    int? cr,
    int? payout,
    String? bonus,
    int? bonusAmt,
    Value<String?> textContent = const Value.absent(),
    Value<String?> resultFail = const Value.absent(),
    Value<String?> resultPass = const Value.absent(),
  }) => MissionHolderEntry(
    id: id ?? this.id,
    corpName: corpName.present ? corpName.value : this.corpName,
    gameTurn: gameTurn.present ? gameTurn.value : this.gameTurn,
    type: type.present ? type.value : this.type,
    distance: distance ?? this.distance,
    cr: cr ?? this.cr,
    payout: payout ?? this.payout,
    bonus: bonus ?? this.bonus,
    bonusAmt: bonusAmt ?? this.bonusAmt,
    textContent: textContent.present ? textContent.value : this.textContent,
    resultFail: resultFail.present ? resultFail.value : this.resultFail,
    resultPass: resultPass.present ? resultPass.value : this.resultPass,
  );
  MissionHolderEntry copyWithCompanion(MissionHolderCompanion data) {
    return MissionHolderEntry(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      gameTurn: data.gameTurn.present ? data.gameTurn.value : this.gameTurn,
      type: data.type.present ? data.type.value : this.type,
      distance: data.distance.present ? data.distance.value : this.distance,
      cr: data.cr.present ? data.cr.value : this.cr,
      payout: data.payout.present ? data.payout.value : this.payout,
      bonus: data.bonus.present ? data.bonus.value : this.bonus,
      bonusAmt: data.bonusAmt.present ? data.bonusAmt.value : this.bonusAmt,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      resultFail: data.resultFail.present
          ? data.resultFail.value
          : this.resultFail,
      resultPass: data.resultPass.present
          ? data.resultPass.value
          : this.resultPass,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MissionHolderEntry(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('type: $type, ')
          ..write('distance: $distance, ')
          ..write('cr: $cr, ')
          ..write('payout: $payout, ')
          ..write('bonus: $bonus, ')
          ..write('bonusAmt: $bonusAmt, ')
          ..write('textContent: $textContent, ')
          ..write('resultFail: $resultFail, ')
          ..write('resultPass: $resultPass')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    corpName,
    gameTurn,
    type,
    distance,
    cr,
    payout,
    bonus,
    bonusAmt,
    textContent,
    resultFail,
    resultPass,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MissionHolderEntry &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.gameTurn == this.gameTurn &&
          other.type == this.type &&
          other.distance == this.distance &&
          other.cr == this.cr &&
          other.payout == this.payout &&
          other.bonus == this.bonus &&
          other.bonusAmt == this.bonusAmt &&
          other.textContent == this.textContent &&
          other.resultFail == this.resultFail &&
          other.resultPass == this.resultPass);
}

class MissionHolderCompanion extends UpdateCompanion<MissionHolderEntry> {
  final Value<int> id;
  final Value<String?> corpName;
  final Value<int?> gameTurn;
  final Value<String?> type;
  final Value<double> distance;
  final Value<int> cr;
  final Value<int> payout;
  final Value<String> bonus;
  final Value<int> bonusAmt;
  final Value<String?> textContent;
  final Value<String?> resultFail;
  final Value<String?> resultPass;
  const MissionHolderCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.type = const Value.absent(),
    this.distance = const Value.absent(),
    this.cr = const Value.absent(),
    this.payout = const Value.absent(),
    this.bonus = const Value.absent(),
    this.bonusAmt = const Value.absent(),
    this.textContent = const Value.absent(),
    this.resultFail = const Value.absent(),
    this.resultPass = const Value.absent(),
  });
  MissionHolderCompanion.insert({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.type = const Value.absent(),
    this.distance = const Value.absent(),
    this.cr = const Value.absent(),
    this.payout = const Value.absent(),
    this.bonus = const Value.absent(),
    this.bonusAmt = const Value.absent(),
    this.textContent = const Value.absent(),
    this.resultFail = const Value.absent(),
    this.resultPass = const Value.absent(),
  });
  static Insertable<MissionHolderEntry> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<int>? gameTurn,
    Expression<String>? type,
    Expression<double>? distance,
    Expression<int>? cr,
    Expression<int>? payout,
    Expression<String>? bonus,
    Expression<int>? bonusAmt,
    Expression<String>? textContent,
    Expression<String>? resultFail,
    Expression<String>? resultPass,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (gameTurn != null) 'game_turn': gameTurn,
      if (type != null) 'type': type,
      if (distance != null) 'distance': distance,
      if (cr != null) 'cr': cr,
      if (payout != null) 'payout': payout,
      if (bonus != null) 'bonus': bonus,
      if (bonusAmt != null) 'bonus_amt': bonusAmt,
      if (textContent != null) 'text': textContent,
      if (resultFail != null) 'result_fail': resultFail,
      if (resultPass != null) 'result_pass': resultPass,
    });
  }

  MissionHolderCompanion copyWith({
    Value<int>? id,
    Value<String?>? corpName,
    Value<int?>? gameTurn,
    Value<String?>? type,
    Value<double>? distance,
    Value<int>? cr,
    Value<int>? payout,
    Value<String>? bonus,
    Value<int>? bonusAmt,
    Value<String?>? textContent,
    Value<String?>? resultFail,
    Value<String?>? resultPass,
  }) {
    return MissionHolderCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      gameTurn: gameTurn ?? this.gameTurn,
      type: type ?? this.type,
      distance: distance ?? this.distance,
      cr: cr ?? this.cr,
      payout: payout ?? this.payout,
      bonus: bonus ?? this.bonus,
      bonusAmt: bonusAmt ?? this.bonusAmt,
      textContent: textContent ?? this.textContent,
      resultFail: resultFail ?? this.resultFail,
      resultPass: resultPass ?? this.resultPass,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (gameTurn.present) {
      map['game_turn'] = Variable<int>(gameTurn.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (cr.present) {
      map['cr'] = Variable<int>(cr.value);
    }
    if (payout.present) {
      map['payout'] = Variable<int>(payout.value);
    }
    if (bonus.present) {
      map['bonus'] = Variable<String>(bonus.value);
    }
    if (bonusAmt.present) {
      map['bonus_amt'] = Variable<int>(bonusAmt.value);
    }
    if (textContent.present) {
      map['text'] = Variable<String>(textContent.value);
    }
    if (resultFail.present) {
      map['result_fail'] = Variable<String>(resultFail.value);
    }
    if (resultPass.present) {
      map['result_pass'] = Variable<String>(resultPass.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MissionHolderCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('type: $type, ')
          ..write('distance: $distance, ')
          ..write('cr: $cr, ')
          ..write('payout: $payout, ')
          ..write('bonus: $bonus, ')
          ..write('bonusAmt: $bonusAmt, ')
          ..write('textContent: $textContent, ')
          ..write('resultFail: $resultFail, ')
          ..write('resultPass: $resultPass')
          ..write(')'))
        .toString();
  }
}

class $MissionInterruptorsTable extends MissionInterruptors
    with TableInfo<$MissionInterruptorsTable, MissionInterruptorEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MissionInterruptorsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _crMeta = const VerificationMeta('cr');
  @override
  late final GeneratedColumn<int> cr = GeneratedColumn<int>(
    'cr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _openingTextMeta = const VerificationMeta(
    'openingText',
  );
  @override
  late final GeneratedColumn<String> openingText = GeneratedColumn<String>(
    'opening_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultFailMeta = const VerificationMeta(
    'resultFail',
  );
  @override
  late final GeneratedColumn<String> resultFail = GeneratedColumn<String>(
    'result_fail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultPassMeta = const VerificationMeta(
    'resultPass',
  );
  @override
  late final GeneratedColumn<String> resultPass = GeneratedColumn<String>(
    'result_pass',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    distance,
    cr,
    openingText,
    textContent,
    resultFail,
    resultPass,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mission_interruptors';
  @override
  VerificationContext validateIntegrity(
    Insertable<MissionInterruptorEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    }
    if (data.containsKey('cr')) {
      context.handle(_crMeta, cr.isAcceptableOrUnknown(data['cr']!, _crMeta));
    }
    if (data.containsKey('opening_text')) {
      context.handle(
        _openingTextMeta,
        openingText.isAcceptableOrUnknown(
          data['opening_text']!,
          _openingTextMeta,
        ),
      );
    }
    if (data.containsKey('text')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(data['text']!, _textContentMeta),
      );
    }
    if (data.containsKey('result_fail')) {
      context.handle(
        _resultFailMeta,
        resultFail.isAcceptableOrUnknown(data['result_fail']!, _resultFailMeta),
      );
    }
    if (data.containsKey('result_pass')) {
      context.handle(
        _resultPassMeta,
        resultPass.isAcceptableOrUnknown(data['result_pass']!, _resultPassMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MissionInterruptorEntry map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MissionInterruptorEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      ),
      cr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cr'],
      )!,
      openingText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opening_text'],
      ),
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      ),
      resultFail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_fail'],
      ),
      resultPass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_pass'],
      ),
    );
  }

  @override
  $MissionInterruptorsTable createAlias(String alias) {
    return $MissionInterruptorsTable(attachedDatabase, alias);
  }
}

class MissionInterruptorEntry extends DataClass
    implements Insertable<MissionInterruptorEntry> {
  final int id;
  final String? type;
  final double? distance;
  final int cr;
  final String? openingText;
  final String? textContent;
  final String? resultFail;
  final String? resultPass;
  const MissionInterruptorEntry({
    required this.id,
    this.type,
    this.distance,
    required this.cr,
    this.openingText,
    this.textContent,
    this.resultFail,
    this.resultPass,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || distance != null) {
      map['distance'] = Variable<double>(distance);
    }
    map['cr'] = Variable<int>(cr);
    if (!nullToAbsent || openingText != null) {
      map['opening_text'] = Variable<String>(openingText);
    }
    if (!nullToAbsent || textContent != null) {
      map['text'] = Variable<String>(textContent);
    }
    if (!nullToAbsent || resultFail != null) {
      map['result_fail'] = Variable<String>(resultFail);
    }
    if (!nullToAbsent || resultPass != null) {
      map['result_pass'] = Variable<String>(resultPass);
    }
    return map;
  }

  MissionInterruptorsCompanion toCompanion(bool nullToAbsent) {
    return MissionInterruptorsCompanion(
      id: Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      distance: distance == null && nullToAbsent
          ? const Value.absent()
          : Value(distance),
      cr: Value(cr),
      openingText: openingText == null && nullToAbsent
          ? const Value.absent()
          : Value(openingText),
      textContent: textContent == null && nullToAbsent
          ? const Value.absent()
          : Value(textContent),
      resultFail: resultFail == null && nullToAbsent
          ? const Value.absent()
          : Value(resultFail),
      resultPass: resultPass == null && nullToAbsent
          ? const Value.absent()
          : Value(resultPass),
    );
  }

  factory MissionInterruptorEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MissionInterruptorEntry(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String?>(json['type']),
      distance: serializer.fromJson<double?>(json['distance']),
      cr: serializer.fromJson<int>(json['cr']),
      openingText: serializer.fromJson<String?>(json['openingText']),
      textContent: serializer.fromJson<String?>(json['textContent']),
      resultFail: serializer.fromJson<String?>(json['resultFail']),
      resultPass: serializer.fromJson<String?>(json['resultPass']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String?>(type),
      'distance': serializer.toJson<double?>(distance),
      'cr': serializer.toJson<int>(cr),
      'openingText': serializer.toJson<String?>(openingText),
      'textContent': serializer.toJson<String?>(textContent),
      'resultFail': serializer.toJson<String?>(resultFail),
      'resultPass': serializer.toJson<String?>(resultPass),
    };
  }

  MissionInterruptorEntry copyWith({
    int? id,
    Value<String?> type = const Value.absent(),
    Value<double?> distance = const Value.absent(),
    int? cr,
    Value<String?> openingText = const Value.absent(),
    Value<String?> textContent = const Value.absent(),
    Value<String?> resultFail = const Value.absent(),
    Value<String?> resultPass = const Value.absent(),
  }) => MissionInterruptorEntry(
    id: id ?? this.id,
    type: type.present ? type.value : this.type,
    distance: distance.present ? distance.value : this.distance,
    cr: cr ?? this.cr,
    openingText: openingText.present ? openingText.value : this.openingText,
    textContent: textContent.present ? textContent.value : this.textContent,
    resultFail: resultFail.present ? resultFail.value : this.resultFail,
    resultPass: resultPass.present ? resultPass.value : this.resultPass,
  );
  MissionInterruptorEntry copyWithCompanion(MissionInterruptorsCompanion data) {
    return MissionInterruptorEntry(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      distance: data.distance.present ? data.distance.value : this.distance,
      cr: data.cr.present ? data.cr.value : this.cr,
      openingText: data.openingText.present
          ? data.openingText.value
          : this.openingText,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      resultFail: data.resultFail.present
          ? data.resultFail.value
          : this.resultFail,
      resultPass: data.resultPass.present
          ? data.resultPass.value
          : this.resultPass,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MissionInterruptorEntry(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('distance: $distance, ')
          ..write('cr: $cr, ')
          ..write('openingText: $openingText, ')
          ..write('textContent: $textContent, ')
          ..write('resultFail: $resultFail, ')
          ..write('resultPass: $resultPass')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    distance,
    cr,
    openingText,
    textContent,
    resultFail,
    resultPass,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MissionInterruptorEntry &&
          other.id == this.id &&
          other.type == this.type &&
          other.distance == this.distance &&
          other.cr == this.cr &&
          other.openingText == this.openingText &&
          other.textContent == this.textContent &&
          other.resultFail == this.resultFail &&
          other.resultPass == this.resultPass);
}

class MissionInterruptorsCompanion
    extends UpdateCompanion<MissionInterruptorEntry> {
  final Value<int> id;
  final Value<String?> type;
  final Value<double?> distance;
  final Value<int> cr;
  final Value<String?> openingText;
  final Value<String?> textContent;
  final Value<String?> resultFail;
  final Value<String?> resultPass;
  const MissionInterruptorsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.distance = const Value.absent(),
    this.cr = const Value.absent(),
    this.openingText = const Value.absent(),
    this.textContent = const Value.absent(),
    this.resultFail = const Value.absent(),
    this.resultPass = const Value.absent(),
  });
  MissionInterruptorsCompanion.insert({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.distance = const Value.absent(),
    this.cr = const Value.absent(),
    this.openingText = const Value.absent(),
    this.textContent = const Value.absent(),
    this.resultFail = const Value.absent(),
    this.resultPass = const Value.absent(),
  });
  static Insertable<MissionInterruptorEntry> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<double>? distance,
    Expression<int>? cr,
    Expression<String>? openingText,
    Expression<String>? textContent,
    Expression<String>? resultFail,
    Expression<String>? resultPass,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (distance != null) 'distance': distance,
      if (cr != null) 'cr': cr,
      if (openingText != null) 'opening_text': openingText,
      if (textContent != null) 'text': textContent,
      if (resultFail != null) 'result_fail': resultFail,
      if (resultPass != null) 'result_pass': resultPass,
    });
  }

  MissionInterruptorsCompanion copyWith({
    Value<int>? id,
    Value<String?>? type,
    Value<double?>? distance,
    Value<int>? cr,
    Value<String?>? openingText,
    Value<String?>? textContent,
    Value<String?>? resultFail,
    Value<String?>? resultPass,
  }) {
    return MissionInterruptorsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      distance: distance ?? this.distance,
      cr: cr ?? this.cr,
      openingText: openingText ?? this.openingText,
      textContent: textContent ?? this.textContent,
      resultFail: resultFail ?? this.resultFail,
      resultPass: resultPass ?? this.resultPass,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (cr.present) {
      map['cr'] = Variable<int>(cr.value);
    }
    if (openingText.present) {
      map['opening_text'] = Variable<String>(openingText.value);
    }
    if (textContent.present) {
      map['text'] = Variable<String>(textContent.value);
    }
    if (resultFail.present) {
      map['result_fail'] = Variable<String>(resultFail.value);
    }
    if (resultPass.present) {
      map['result_pass'] = Variable<String>(resultPass.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MissionInterruptorsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('distance: $distance, ')
          ..write('cr: $cr, ')
          ..write('openingText: $openingText, ')
          ..write('textContent: $textContent, ')
          ..write('resultFail: $resultFail, ')
          ..write('resultPass: $resultPass')
          ..write(')'))
        .toString();
  }
}

class $MissionTextGeneratorTable extends MissionTextGenerator
    with TableInfo<$MissionTextGeneratorTable, MissionTextGeneratorEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MissionTextGeneratorTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _innerStationMeta = const VerificationMeta(
    'innerStation',
  );
  @override
  late final GeneratedColumn<String> innerStation = GeneratedColumn<String>(
    'inner_station',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _outerStationMeta = const VerificationMeta(
    'outerStation',
  );
  @override
  late final GeneratedColumn<String> outerStation = GeneratedColumn<String>(
    'outer_station',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scienceStationMeta = const VerificationMeta(
    'scienceStation',
  );
  @override
  late final GeneratedColumn<String> scienceStation = GeneratedColumn<String>(
    'science_station',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _corpOrigMeta = const VerificationMeta(
    'corpOrig',
  );
  @override
  late final GeneratedColumn<String> corpOrig = GeneratedColumn<String>(
    'corp_orig',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _corpStyleMeta = const VerificationMeta(
    'corpStyle',
  );
  @override
  late final GeneratedColumn<String> corpStyle = GeneratedColumn<String>(
    'corp_style',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    innerStation,
    outerStation,
    scienceStation,
    corpOrig,
    corpStyle,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mission_text_generator';
  @override
  VerificationContext validateIntegrity(
    Insertable<MissionTextGeneratorEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inner_station')) {
      context.handle(
        _innerStationMeta,
        innerStation.isAcceptableOrUnknown(
          data['inner_station']!,
          _innerStationMeta,
        ),
      );
    }
    if (data.containsKey('outer_station')) {
      context.handle(
        _outerStationMeta,
        outerStation.isAcceptableOrUnknown(
          data['outer_station']!,
          _outerStationMeta,
        ),
      );
    }
    if (data.containsKey('science_station')) {
      context.handle(
        _scienceStationMeta,
        scienceStation.isAcceptableOrUnknown(
          data['science_station']!,
          _scienceStationMeta,
        ),
      );
    }
    if (data.containsKey('corp_orig')) {
      context.handle(
        _corpOrigMeta,
        corpOrig.isAcceptableOrUnknown(data['corp_orig']!, _corpOrigMeta),
      );
    }
    if (data.containsKey('corp_style')) {
      context.handle(
        _corpStyleMeta,
        corpStyle.isAcceptableOrUnknown(data['corp_style']!, _corpStyleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MissionTextGeneratorEntry map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MissionTextGeneratorEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      innerStation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inner_station'],
      ),
      outerStation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outer_station'],
      ),
      scienceStation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}science_station'],
      ),
      corpOrig: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_orig'],
      ),
      corpStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_style'],
      ),
    );
  }

  @override
  $MissionTextGeneratorTable createAlias(String alias) {
    return $MissionTextGeneratorTable(attachedDatabase, alias);
  }
}

class MissionTextGeneratorEntry extends DataClass
    implements Insertable<MissionTextGeneratorEntry> {
  final int id;
  final String? innerStation;
  final String? outerStation;
  final String? scienceStation;
  final String? corpOrig;
  final String? corpStyle;
  const MissionTextGeneratorEntry({
    required this.id,
    this.innerStation,
    this.outerStation,
    this.scienceStation,
    this.corpOrig,
    this.corpStyle,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || innerStation != null) {
      map['inner_station'] = Variable<String>(innerStation);
    }
    if (!nullToAbsent || outerStation != null) {
      map['outer_station'] = Variable<String>(outerStation);
    }
    if (!nullToAbsent || scienceStation != null) {
      map['science_station'] = Variable<String>(scienceStation);
    }
    if (!nullToAbsent || corpOrig != null) {
      map['corp_orig'] = Variable<String>(corpOrig);
    }
    if (!nullToAbsent || corpStyle != null) {
      map['corp_style'] = Variable<String>(corpStyle);
    }
    return map;
  }

  MissionTextGeneratorCompanion toCompanion(bool nullToAbsent) {
    return MissionTextGeneratorCompanion(
      id: Value(id),
      innerStation: innerStation == null && nullToAbsent
          ? const Value.absent()
          : Value(innerStation),
      outerStation: outerStation == null && nullToAbsent
          ? const Value.absent()
          : Value(outerStation),
      scienceStation: scienceStation == null && nullToAbsent
          ? const Value.absent()
          : Value(scienceStation),
      corpOrig: corpOrig == null && nullToAbsent
          ? const Value.absent()
          : Value(corpOrig),
      corpStyle: corpStyle == null && nullToAbsent
          ? const Value.absent()
          : Value(corpStyle),
    );
  }

  factory MissionTextGeneratorEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MissionTextGeneratorEntry(
      id: serializer.fromJson<int>(json['id']),
      innerStation: serializer.fromJson<String?>(json['innerStation']),
      outerStation: serializer.fromJson<String?>(json['outerStation']),
      scienceStation: serializer.fromJson<String?>(json['scienceStation']),
      corpOrig: serializer.fromJson<String?>(json['corpOrig']),
      corpStyle: serializer.fromJson<String?>(json['corpStyle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'innerStation': serializer.toJson<String?>(innerStation),
      'outerStation': serializer.toJson<String?>(outerStation),
      'scienceStation': serializer.toJson<String?>(scienceStation),
      'corpOrig': serializer.toJson<String?>(corpOrig),
      'corpStyle': serializer.toJson<String?>(corpStyle),
    };
  }

  MissionTextGeneratorEntry copyWith({
    int? id,
    Value<String?> innerStation = const Value.absent(),
    Value<String?> outerStation = const Value.absent(),
    Value<String?> scienceStation = const Value.absent(),
    Value<String?> corpOrig = const Value.absent(),
    Value<String?> corpStyle = const Value.absent(),
  }) => MissionTextGeneratorEntry(
    id: id ?? this.id,
    innerStation: innerStation.present ? innerStation.value : this.innerStation,
    outerStation: outerStation.present ? outerStation.value : this.outerStation,
    scienceStation: scienceStation.present
        ? scienceStation.value
        : this.scienceStation,
    corpOrig: corpOrig.present ? corpOrig.value : this.corpOrig,
    corpStyle: corpStyle.present ? corpStyle.value : this.corpStyle,
  );
  MissionTextGeneratorEntry copyWithCompanion(
    MissionTextGeneratorCompanion data,
  ) {
    return MissionTextGeneratorEntry(
      id: data.id.present ? data.id.value : this.id,
      innerStation: data.innerStation.present
          ? data.innerStation.value
          : this.innerStation,
      outerStation: data.outerStation.present
          ? data.outerStation.value
          : this.outerStation,
      scienceStation: data.scienceStation.present
          ? data.scienceStation.value
          : this.scienceStation,
      corpOrig: data.corpOrig.present ? data.corpOrig.value : this.corpOrig,
      corpStyle: data.corpStyle.present ? data.corpStyle.value : this.corpStyle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MissionTextGeneratorEntry(')
          ..write('id: $id, ')
          ..write('innerStation: $innerStation, ')
          ..write('outerStation: $outerStation, ')
          ..write('scienceStation: $scienceStation, ')
          ..write('corpOrig: $corpOrig, ')
          ..write('corpStyle: $corpStyle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    innerStation,
    outerStation,
    scienceStation,
    corpOrig,
    corpStyle,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MissionTextGeneratorEntry &&
          other.id == this.id &&
          other.innerStation == this.innerStation &&
          other.outerStation == this.outerStation &&
          other.scienceStation == this.scienceStation &&
          other.corpOrig == this.corpOrig &&
          other.corpStyle == this.corpStyle);
}

class MissionTextGeneratorCompanion
    extends UpdateCompanion<MissionTextGeneratorEntry> {
  final Value<int> id;
  final Value<String?> innerStation;
  final Value<String?> outerStation;
  final Value<String?> scienceStation;
  final Value<String?> corpOrig;
  final Value<String?> corpStyle;
  const MissionTextGeneratorCompanion({
    this.id = const Value.absent(),
    this.innerStation = const Value.absent(),
    this.outerStation = const Value.absent(),
    this.scienceStation = const Value.absent(),
    this.corpOrig = const Value.absent(),
    this.corpStyle = const Value.absent(),
  });
  MissionTextGeneratorCompanion.insert({
    this.id = const Value.absent(),
    this.innerStation = const Value.absent(),
    this.outerStation = const Value.absent(),
    this.scienceStation = const Value.absent(),
    this.corpOrig = const Value.absent(),
    this.corpStyle = const Value.absent(),
  });
  static Insertable<MissionTextGeneratorEntry> custom({
    Expression<int>? id,
    Expression<String>? innerStation,
    Expression<String>? outerStation,
    Expression<String>? scienceStation,
    Expression<String>? corpOrig,
    Expression<String>? corpStyle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (innerStation != null) 'inner_station': innerStation,
      if (outerStation != null) 'outer_station': outerStation,
      if (scienceStation != null) 'science_station': scienceStation,
      if (corpOrig != null) 'corp_orig': corpOrig,
      if (corpStyle != null) 'corp_style': corpStyle,
    });
  }

  MissionTextGeneratorCompanion copyWith({
    Value<int>? id,
    Value<String?>? innerStation,
    Value<String?>? outerStation,
    Value<String?>? scienceStation,
    Value<String?>? corpOrig,
    Value<String?>? corpStyle,
  }) {
    return MissionTextGeneratorCompanion(
      id: id ?? this.id,
      innerStation: innerStation ?? this.innerStation,
      outerStation: outerStation ?? this.outerStation,
      scienceStation: scienceStation ?? this.scienceStation,
      corpOrig: corpOrig ?? this.corpOrig,
      corpStyle: corpStyle ?? this.corpStyle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (innerStation.present) {
      map['inner_station'] = Variable<String>(innerStation.value);
    }
    if (outerStation.present) {
      map['outer_station'] = Variable<String>(outerStation.value);
    }
    if (scienceStation.present) {
      map['science_station'] = Variable<String>(scienceStation.value);
    }
    if (corpOrig.present) {
      map['corp_orig'] = Variable<String>(corpOrig.value);
    }
    if (corpStyle.present) {
      map['corp_style'] = Variable<String>(corpStyle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MissionTextGeneratorCompanion(')
          ..write('id: $id, ')
          ..write('innerStation: $innerStation, ')
          ..write('outerStation: $outerStation, ')
          ..write('scienceStation: $scienceStation, ')
          ..write('corpOrig: $corpOrig, ')
          ..write('corpStyle: $corpStyle')
          ..write(')'))
        .toString();
  }
}

class $RollsTable extends Rolls with TableInfo<$RollsTable, Roll> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RollsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _dieMeta = const VerificationMeta('die');
  @override
  late final GeneratedColumn<int> die = GeneratedColumn<int>(
    'die',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
    'user',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questMeta = const VerificationMeta('quest');
  @override
  late final GeneratedColumn<String> quest = GeneratedColumn<String>(
    'quest',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stampMeta = const VerificationMeta('stamp');
  @override
  late final GeneratedColumn<DateTime> stamp = GeneratedColumn<DateTime>(
    'stamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, die, value, user, quest, stamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rolls';
  @override
  VerificationContext validateIntegrity(
    Insertable<Roll> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('die')) {
      context.handle(
        _dieMeta,
        die.isAcceptableOrUnknown(data['die']!, _dieMeta),
      );
    } else if (isInserting) {
      context.missing(_dieMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
        _userMeta,
        user.isAcceptableOrUnknown(data['user']!, _userMeta),
      );
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('quest')) {
      context.handle(
        _questMeta,
        quest.isAcceptableOrUnknown(data['quest']!, _questMeta),
      );
    } else if (isInserting) {
      context.missing(_questMeta);
    }
    if (data.containsKey('stamp')) {
      context.handle(
        _stampMeta,
        stamp.isAcceptableOrUnknown(data['stamp']!, _stampMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Roll map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Roll(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      die: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}die'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
      user: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user'],
      )!,
      quest: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quest'],
      )!,
      stamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}stamp'],
      )!,
    );
  }

  @override
  $RollsTable createAlias(String alias) {
    return $RollsTable(attachedDatabase, alias);
  }
}

class Roll extends DataClass implements Insertable<Roll> {
  final int id;
  final int die;
  final int value;
  final String user;
  final String quest;
  final DateTime stamp;
  const Roll({
    required this.id,
    required this.die,
    required this.value,
    required this.user,
    required this.quest,
    required this.stamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['die'] = Variable<int>(die);
    map['value'] = Variable<int>(value);
    map['user'] = Variable<String>(user);
    map['quest'] = Variable<String>(quest);
    map['stamp'] = Variable<DateTime>(stamp);
    return map;
  }

  RollsCompanion toCompanion(bool nullToAbsent) {
    return RollsCompanion(
      id: Value(id),
      die: Value(die),
      value: Value(value),
      user: Value(user),
      quest: Value(quest),
      stamp: Value(stamp),
    );
  }

  factory Roll.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Roll(
      id: serializer.fromJson<int>(json['id']),
      die: serializer.fromJson<int>(json['die']),
      value: serializer.fromJson<int>(json['value']),
      user: serializer.fromJson<String>(json['user']),
      quest: serializer.fromJson<String>(json['quest']),
      stamp: serializer.fromJson<DateTime>(json['stamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'die': serializer.toJson<int>(die),
      'value': serializer.toJson<int>(value),
      'user': serializer.toJson<String>(user),
      'quest': serializer.toJson<String>(quest),
      'stamp': serializer.toJson<DateTime>(stamp),
    };
  }

  Roll copyWith({
    int? id,
    int? die,
    int? value,
    String? user,
    String? quest,
    DateTime? stamp,
  }) => Roll(
    id: id ?? this.id,
    die: die ?? this.die,
    value: value ?? this.value,
    user: user ?? this.user,
    quest: quest ?? this.quest,
    stamp: stamp ?? this.stamp,
  );
  Roll copyWithCompanion(RollsCompanion data) {
    return Roll(
      id: data.id.present ? data.id.value : this.id,
      die: data.die.present ? data.die.value : this.die,
      value: data.value.present ? data.value.value : this.value,
      user: data.user.present ? data.user.value : this.user,
      quest: data.quest.present ? data.quest.value : this.quest,
      stamp: data.stamp.present ? data.stamp.value : this.stamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Roll(')
          ..write('id: $id, ')
          ..write('die: $die, ')
          ..write('value: $value, ')
          ..write('user: $user, ')
          ..write('quest: $quest, ')
          ..write('stamp: $stamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, die, value, user, quest, stamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Roll &&
          other.id == this.id &&
          other.die == this.die &&
          other.value == this.value &&
          other.user == this.user &&
          other.quest == this.quest &&
          other.stamp == this.stamp);
}

class RollsCompanion extends UpdateCompanion<Roll> {
  final Value<int> id;
  final Value<int> die;
  final Value<int> value;
  final Value<String> user;
  final Value<String> quest;
  final Value<DateTime> stamp;
  const RollsCompanion({
    this.id = const Value.absent(),
    this.die = const Value.absent(),
    this.value = const Value.absent(),
    this.user = const Value.absent(),
    this.quest = const Value.absent(),
    this.stamp = const Value.absent(),
  });
  RollsCompanion.insert({
    this.id = const Value.absent(),
    required int die,
    required int value,
    required String user,
    required String quest,
    this.stamp = const Value.absent(),
  }) : die = Value(die),
       value = Value(value),
       user = Value(user),
       quest = Value(quest);
  static Insertable<Roll> custom({
    Expression<int>? id,
    Expression<int>? die,
    Expression<int>? value,
    Expression<String>? user,
    Expression<String>? quest,
    Expression<DateTime>? stamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (die != null) 'die': die,
      if (value != null) 'value': value,
      if (user != null) 'user': user,
      if (quest != null) 'quest': quest,
      if (stamp != null) 'stamp': stamp,
    });
  }

  RollsCompanion copyWith({
    Value<int>? id,
    Value<int>? die,
    Value<int>? value,
    Value<String>? user,
    Value<String>? quest,
    Value<DateTime>? stamp,
  }) {
    return RollsCompanion(
      id: id ?? this.id,
      die: die ?? this.die,
      value: value ?? this.value,
      user: user ?? this.user,
      quest: quest ?? this.quest,
      stamp: stamp ?? this.stamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (die.present) {
      map['die'] = Variable<int>(die.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (quest.present) {
      map['quest'] = Variable<String>(quest.value);
    }
    if (stamp.present) {
      map['stamp'] = Variable<DateTime>(stamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RollsCompanion(')
          ..write('id: $id, ')
          ..write('die: $die, ')
          ..write('value: $value, ')
          ..write('user: $user, ')
          ..write('quest: $quest, ')
          ..write('stamp: $stamp')
          ..write(')'))
        .toString();
  }
}

class $SalvageTable extends Salvage
    with TableInfo<$SalvageTable, SalvageEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalvageTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _salvageNameMeta = const VerificationMeta(
    'salvageName',
  );
  @override
  late final GeneratedColumn<String> salvageName = GeneratedColumn<String>(
    'salvage_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _m3Meta = const VerificationMeta('m3');
  @override
  late final GeneratedColumn<int> m3 = GeneratedColumn<int>(
    'm3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _surfaceMMeta = const VerificationMeta(
    'surfaceM',
  );
  @override
  late final GeneratedColumn<int> surfaceM = GeneratedColumn<int>(
    'surface_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _zeroGMMeta = const VerificationMeta('zeroGM');
  @override
  late final GeneratedColumn<int> zeroGM = GeneratedColumn<int>(
    'zero_g_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _conductiveMMeta = const VerificationMeta(
    'conductiveM',
  );
  @override
  late final GeneratedColumn<int> conductiveM = GeneratedColumn<int>(
    'conductive_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lifeSuppGMeta = const VerificationMeta(
    'lifeSuppG',
  );
  @override
  late final GeneratedColumn<int> lifeSuppG = GeneratedColumn<int>(
    'life_supp_g',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fuelGMeta = const VerificationMeta('fuelG');
  @override
  late final GeneratedColumn<int> fuelG = GeneratedColumn<int>(
    'fuel_g',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _oveMeta = const VerificationMeta('ove');
  @override
  late final GeneratedColumn<int> ove = GeneratedColumn<int>(
    'ove',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _waterIceMeta = const VerificationMeta(
    'waterIce',
  );
  @override
  late final GeneratedColumn<int> waterIce = GeneratedColumn<int>(
    'water_ice',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    salvageName,
    corpName,
    m3,
    surfaceM,
    zeroGM,
    conductiveM,
    lifeSuppG,
    fuelG,
    ove,
    waterIce,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'salvage';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalvageEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('salvage_name')) {
      context.handle(
        _salvageNameMeta,
        salvageName.isAcceptableOrUnknown(
          data['salvage_name']!,
          _salvageNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_salvageNameMeta);
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('m3')) {
      context.handle(_m3Meta, m3.isAcceptableOrUnknown(data['m3']!, _m3Meta));
    }
    if (data.containsKey('surface_m')) {
      context.handle(
        _surfaceMMeta,
        surfaceM.isAcceptableOrUnknown(data['surface_m']!, _surfaceMMeta),
      );
    }
    if (data.containsKey('zero_g_m')) {
      context.handle(
        _zeroGMMeta,
        zeroGM.isAcceptableOrUnknown(data['zero_g_m']!, _zeroGMMeta),
      );
    }
    if (data.containsKey('conductive_m')) {
      context.handle(
        _conductiveMMeta,
        conductiveM.isAcceptableOrUnknown(
          data['conductive_m']!,
          _conductiveMMeta,
        ),
      );
    }
    if (data.containsKey('life_supp_g')) {
      context.handle(
        _lifeSuppGMeta,
        lifeSuppG.isAcceptableOrUnknown(data['life_supp_g']!, _lifeSuppGMeta),
      );
    }
    if (data.containsKey('fuel_g')) {
      context.handle(
        _fuelGMeta,
        fuelG.isAcceptableOrUnknown(data['fuel_g']!, _fuelGMeta),
      );
    }
    if (data.containsKey('ove')) {
      context.handle(
        _oveMeta,
        ove.isAcceptableOrUnknown(data['ove']!, _oveMeta),
      );
    }
    if (data.containsKey('water_ice')) {
      context.handle(
        _waterIceMeta,
        waterIce.isAcceptableOrUnknown(data['water_ice']!, _waterIceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalvageEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalvageEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      salvageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}salvage_name'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      m3: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}m3'],
      )!,
      surfaceM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surface_m'],
      )!,
      zeroGM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}zero_g_m'],
      )!,
      conductiveM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}conductive_m'],
      )!,
      lifeSuppG: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}life_supp_g'],
      )!,
      fuelG: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fuel_g'],
      )!,
      ove: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ove'],
      )!,
      waterIce: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}water_ice'],
      )!,
    );
  }

  @override
  $SalvageTable createAlias(String alias) {
    return $SalvageTable(attachedDatabase, alias);
  }
}

class SalvageEntry extends DataClass implements Insertable<SalvageEntry> {
  final int id;
  final String salvageName;
  final String corpName;
  final int m3;
  final int surfaceM;
  final int zeroGM;
  final int conductiveM;
  final int lifeSuppG;
  final int fuelG;
  final int ove;
  final int waterIce;
  const SalvageEntry({
    required this.id,
    required this.salvageName,
    required this.corpName,
    required this.m3,
    required this.surfaceM,
    required this.zeroGM,
    required this.conductiveM,
    required this.lifeSuppG,
    required this.fuelG,
    required this.ove,
    required this.waterIce,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['salvage_name'] = Variable<String>(salvageName);
    map['corp_name'] = Variable<String>(corpName);
    map['m3'] = Variable<int>(m3);
    map['surface_m'] = Variable<int>(surfaceM);
    map['zero_g_m'] = Variable<int>(zeroGM);
    map['conductive_m'] = Variable<int>(conductiveM);
    map['life_supp_g'] = Variable<int>(lifeSuppG);
    map['fuel_g'] = Variable<int>(fuelG);
    map['ove'] = Variable<int>(ove);
    map['water_ice'] = Variable<int>(waterIce);
    return map;
  }

  SalvageCompanion toCompanion(bool nullToAbsent) {
    return SalvageCompanion(
      id: Value(id),
      salvageName: Value(salvageName),
      corpName: Value(corpName),
      m3: Value(m3),
      surfaceM: Value(surfaceM),
      zeroGM: Value(zeroGM),
      conductiveM: Value(conductiveM),
      lifeSuppG: Value(lifeSuppG),
      fuelG: Value(fuelG),
      ove: Value(ove),
      waterIce: Value(waterIce),
    );
  }

  factory SalvageEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalvageEntry(
      id: serializer.fromJson<int>(json['id']),
      salvageName: serializer.fromJson<String>(json['salvageName']),
      corpName: serializer.fromJson<String>(json['corpName']),
      m3: serializer.fromJson<int>(json['m3']),
      surfaceM: serializer.fromJson<int>(json['surfaceM']),
      zeroGM: serializer.fromJson<int>(json['zeroGM']),
      conductiveM: serializer.fromJson<int>(json['conductiveM']),
      lifeSuppG: serializer.fromJson<int>(json['lifeSuppG']),
      fuelG: serializer.fromJson<int>(json['fuelG']),
      ove: serializer.fromJson<int>(json['ove']),
      waterIce: serializer.fromJson<int>(json['waterIce']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'salvageName': serializer.toJson<String>(salvageName),
      'corpName': serializer.toJson<String>(corpName),
      'm3': serializer.toJson<int>(m3),
      'surfaceM': serializer.toJson<int>(surfaceM),
      'zeroGM': serializer.toJson<int>(zeroGM),
      'conductiveM': serializer.toJson<int>(conductiveM),
      'lifeSuppG': serializer.toJson<int>(lifeSuppG),
      'fuelG': serializer.toJson<int>(fuelG),
      'ove': serializer.toJson<int>(ove),
      'waterIce': serializer.toJson<int>(waterIce),
    };
  }

  SalvageEntry copyWith({
    int? id,
    String? salvageName,
    String? corpName,
    int? m3,
    int? surfaceM,
    int? zeroGM,
    int? conductiveM,
    int? lifeSuppG,
    int? fuelG,
    int? ove,
    int? waterIce,
  }) => SalvageEntry(
    id: id ?? this.id,
    salvageName: salvageName ?? this.salvageName,
    corpName: corpName ?? this.corpName,
    m3: m3 ?? this.m3,
    surfaceM: surfaceM ?? this.surfaceM,
    zeroGM: zeroGM ?? this.zeroGM,
    conductiveM: conductiveM ?? this.conductiveM,
    lifeSuppG: lifeSuppG ?? this.lifeSuppG,
    fuelG: fuelG ?? this.fuelG,
    ove: ove ?? this.ove,
    waterIce: waterIce ?? this.waterIce,
  );
  SalvageEntry copyWithCompanion(SalvageCompanion data) {
    return SalvageEntry(
      id: data.id.present ? data.id.value : this.id,
      salvageName: data.salvageName.present
          ? data.salvageName.value
          : this.salvageName,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      m3: data.m3.present ? data.m3.value : this.m3,
      surfaceM: data.surfaceM.present ? data.surfaceM.value : this.surfaceM,
      zeroGM: data.zeroGM.present ? data.zeroGM.value : this.zeroGM,
      conductiveM: data.conductiveM.present
          ? data.conductiveM.value
          : this.conductiveM,
      lifeSuppG: data.lifeSuppG.present ? data.lifeSuppG.value : this.lifeSuppG,
      fuelG: data.fuelG.present ? data.fuelG.value : this.fuelG,
      ove: data.ove.present ? data.ove.value : this.ove,
      waterIce: data.waterIce.present ? data.waterIce.value : this.waterIce,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalvageEntry(')
          ..write('id: $id, ')
          ..write('salvageName: $salvageName, ')
          ..write('corpName: $corpName, ')
          ..write('m3: $m3, ')
          ..write('surfaceM: $surfaceM, ')
          ..write('zeroGM: $zeroGM, ')
          ..write('conductiveM: $conductiveM, ')
          ..write('lifeSuppG: $lifeSuppG, ')
          ..write('fuelG: $fuelG, ')
          ..write('ove: $ove, ')
          ..write('waterIce: $waterIce')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    salvageName,
    corpName,
    m3,
    surfaceM,
    zeroGM,
    conductiveM,
    lifeSuppG,
    fuelG,
    ove,
    waterIce,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalvageEntry &&
          other.id == this.id &&
          other.salvageName == this.salvageName &&
          other.corpName == this.corpName &&
          other.m3 == this.m3 &&
          other.surfaceM == this.surfaceM &&
          other.zeroGM == this.zeroGM &&
          other.conductiveM == this.conductiveM &&
          other.lifeSuppG == this.lifeSuppG &&
          other.fuelG == this.fuelG &&
          other.ove == this.ove &&
          other.waterIce == this.waterIce);
}

class SalvageCompanion extends UpdateCompanion<SalvageEntry> {
  final Value<int> id;
  final Value<String> salvageName;
  final Value<String> corpName;
  final Value<int> m3;
  final Value<int> surfaceM;
  final Value<int> zeroGM;
  final Value<int> conductiveM;
  final Value<int> lifeSuppG;
  final Value<int> fuelG;
  final Value<int> ove;
  final Value<int> waterIce;
  const SalvageCompanion({
    this.id = const Value.absent(),
    this.salvageName = const Value.absent(),
    this.corpName = const Value.absent(),
    this.m3 = const Value.absent(),
    this.surfaceM = const Value.absent(),
    this.zeroGM = const Value.absent(),
    this.conductiveM = const Value.absent(),
    this.lifeSuppG = const Value.absent(),
    this.fuelG = const Value.absent(),
    this.ove = const Value.absent(),
    this.waterIce = const Value.absent(),
  });
  SalvageCompanion.insert({
    this.id = const Value.absent(),
    required String salvageName,
    required String corpName,
    this.m3 = const Value.absent(),
    this.surfaceM = const Value.absent(),
    this.zeroGM = const Value.absent(),
    this.conductiveM = const Value.absent(),
    this.lifeSuppG = const Value.absent(),
    this.fuelG = const Value.absent(),
    this.ove = const Value.absent(),
    this.waterIce = const Value.absent(),
  }) : salvageName = Value(salvageName),
       corpName = Value(corpName);
  static Insertable<SalvageEntry> custom({
    Expression<int>? id,
    Expression<String>? salvageName,
    Expression<String>? corpName,
    Expression<int>? m3,
    Expression<int>? surfaceM,
    Expression<int>? zeroGM,
    Expression<int>? conductiveM,
    Expression<int>? lifeSuppG,
    Expression<int>? fuelG,
    Expression<int>? ove,
    Expression<int>? waterIce,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (salvageName != null) 'salvage_name': salvageName,
      if (corpName != null) 'corp_name': corpName,
      if (m3 != null) 'm3': m3,
      if (surfaceM != null) 'surface_m': surfaceM,
      if (zeroGM != null) 'zero_g_m': zeroGM,
      if (conductiveM != null) 'conductive_m': conductiveM,
      if (lifeSuppG != null) 'life_supp_g': lifeSuppG,
      if (fuelG != null) 'fuel_g': fuelG,
      if (ove != null) 'ove': ove,
      if (waterIce != null) 'water_ice': waterIce,
    });
  }

  SalvageCompanion copyWith({
    Value<int>? id,
    Value<String>? salvageName,
    Value<String>? corpName,
    Value<int>? m3,
    Value<int>? surfaceM,
    Value<int>? zeroGM,
    Value<int>? conductiveM,
    Value<int>? lifeSuppG,
    Value<int>? fuelG,
    Value<int>? ove,
    Value<int>? waterIce,
  }) {
    return SalvageCompanion(
      id: id ?? this.id,
      salvageName: salvageName ?? this.salvageName,
      corpName: corpName ?? this.corpName,
      m3: m3 ?? this.m3,
      surfaceM: surfaceM ?? this.surfaceM,
      zeroGM: zeroGM ?? this.zeroGM,
      conductiveM: conductiveM ?? this.conductiveM,
      lifeSuppG: lifeSuppG ?? this.lifeSuppG,
      fuelG: fuelG ?? this.fuelG,
      ove: ove ?? this.ove,
      waterIce: waterIce ?? this.waterIce,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (salvageName.present) {
      map['salvage_name'] = Variable<String>(salvageName.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (m3.present) {
      map['m3'] = Variable<int>(m3.value);
    }
    if (surfaceM.present) {
      map['surface_m'] = Variable<int>(surfaceM.value);
    }
    if (zeroGM.present) {
      map['zero_g_m'] = Variable<int>(zeroGM.value);
    }
    if (conductiveM.present) {
      map['conductive_m'] = Variable<int>(conductiveM.value);
    }
    if (lifeSuppG.present) {
      map['life_supp_g'] = Variable<int>(lifeSuppG.value);
    }
    if (fuelG.present) {
      map['fuel_g'] = Variable<int>(fuelG.value);
    }
    if (ove.present) {
      map['ove'] = Variable<int>(ove.value);
    }
    if (waterIce.present) {
      map['water_ice'] = Variable<int>(waterIce.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalvageCompanion(')
          ..write('id: $id, ')
          ..write('salvageName: $salvageName, ')
          ..write('corpName: $corpName, ')
          ..write('m3: $m3, ')
          ..write('surfaceM: $surfaceM, ')
          ..write('zeroGM: $zeroGM, ')
          ..write('conductiveM: $conductiveM, ')
          ..write('lifeSuppG: $lifeSuppG, ')
          ..write('fuelG: $fuelG, ')
          ..write('ove: $ove, ')
          ..write('waterIce: $waterIce')
          ..write(')'))
        .toString();
  }
}

class $ScavengeListTable extends ScavengeList
    with TableInfo<$ScavengeListTable, ScavengeListEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScavengeListTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _houseNumberMeta = const VerificationMeta(
    'houseNumber',
  );
  @override
  late final GeneratedColumn<String> houseNumber = GeneratedColumn<String>(
    'house_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _houseItemMeta = const VerificationMeta(
    'houseItem',
  );
  @override
  late final GeneratedColumn<String> houseItem = GeneratedColumn<String>(
    'house_item',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawNumberMeta = const VerificationMeta(
    'rawNumber',
  );
  @override
  late final GeneratedColumn<String> rawNumber = GeneratedColumn<String>(
    'raw_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawLengthMeta = const VerificationMeta(
    'rawLength',
  );
  @override
  late final GeneratedColumn<String> rawLength = GeneratedColumn<String>(
    'raw_length',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawItemMeta = const VerificationMeta(
    'rawItem',
  );
  @override
  late final GeneratedColumn<String> rawItem = GeneratedColumn<String>(
    'raw_item',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseNumber,
    houseItem,
    rawNumber,
    rawLength,
    rawItem,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scavenge_list';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScavengeListEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('house_number')) {
      context.handle(
        _houseNumberMeta,
        houseNumber.isAcceptableOrUnknown(
          data['house_number']!,
          _houseNumberMeta,
        ),
      );
    }
    if (data.containsKey('house_item')) {
      context.handle(
        _houseItemMeta,
        houseItem.isAcceptableOrUnknown(data['house_item']!, _houseItemMeta),
      );
    }
    if (data.containsKey('raw_number')) {
      context.handle(
        _rawNumberMeta,
        rawNumber.isAcceptableOrUnknown(data['raw_number']!, _rawNumberMeta),
      );
    }
    if (data.containsKey('raw_length')) {
      context.handle(
        _rawLengthMeta,
        rawLength.isAcceptableOrUnknown(data['raw_length']!, _rawLengthMeta),
      );
    }
    if (data.containsKey('raw_item')) {
      context.handle(
        _rawItemMeta,
        rawItem.isAcceptableOrUnknown(data['raw_item']!, _rawItemMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScavengeListEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScavengeListEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      houseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_number'],
      ),
      houseItem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_item'],
      ),
      rawNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_number'],
      ),
      rawLength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_length'],
      ),
      rawItem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_item'],
      ),
    );
  }

  @override
  $ScavengeListTable createAlias(String alias) {
    return $ScavengeListTable(attachedDatabase, alias);
  }
}

class ScavengeListEntry extends DataClass
    implements Insertable<ScavengeListEntry> {
  final int id;
  final String? houseNumber;
  final String? houseItem;
  final String? rawNumber;
  final String? rawLength;
  final String? rawItem;
  const ScavengeListEntry({
    required this.id,
    this.houseNumber,
    this.houseItem,
    this.rawNumber,
    this.rawLength,
    this.rawItem,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || houseNumber != null) {
      map['house_number'] = Variable<String>(houseNumber);
    }
    if (!nullToAbsent || houseItem != null) {
      map['house_item'] = Variable<String>(houseItem);
    }
    if (!nullToAbsent || rawNumber != null) {
      map['raw_number'] = Variable<String>(rawNumber);
    }
    if (!nullToAbsent || rawLength != null) {
      map['raw_length'] = Variable<String>(rawLength);
    }
    if (!nullToAbsent || rawItem != null) {
      map['raw_item'] = Variable<String>(rawItem);
    }
    return map;
  }

  ScavengeListCompanion toCompanion(bool nullToAbsent) {
    return ScavengeListCompanion(
      id: Value(id),
      houseNumber: houseNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(houseNumber),
      houseItem: houseItem == null && nullToAbsent
          ? const Value.absent()
          : Value(houseItem),
      rawNumber: rawNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(rawNumber),
      rawLength: rawLength == null && nullToAbsent
          ? const Value.absent()
          : Value(rawLength),
      rawItem: rawItem == null && nullToAbsent
          ? const Value.absent()
          : Value(rawItem),
    );
  }

  factory ScavengeListEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScavengeListEntry(
      id: serializer.fromJson<int>(json['id']),
      houseNumber: serializer.fromJson<String?>(json['houseNumber']),
      houseItem: serializer.fromJson<String?>(json['houseItem']),
      rawNumber: serializer.fromJson<String?>(json['rawNumber']),
      rawLength: serializer.fromJson<String?>(json['rawLength']),
      rawItem: serializer.fromJson<String?>(json['rawItem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'houseNumber': serializer.toJson<String?>(houseNumber),
      'houseItem': serializer.toJson<String?>(houseItem),
      'rawNumber': serializer.toJson<String?>(rawNumber),
      'rawLength': serializer.toJson<String?>(rawLength),
      'rawItem': serializer.toJson<String?>(rawItem),
    };
  }

  ScavengeListEntry copyWith({
    int? id,
    Value<String?> houseNumber = const Value.absent(),
    Value<String?> houseItem = const Value.absent(),
    Value<String?> rawNumber = const Value.absent(),
    Value<String?> rawLength = const Value.absent(),
    Value<String?> rawItem = const Value.absent(),
  }) => ScavengeListEntry(
    id: id ?? this.id,
    houseNumber: houseNumber.present ? houseNumber.value : this.houseNumber,
    houseItem: houseItem.present ? houseItem.value : this.houseItem,
    rawNumber: rawNumber.present ? rawNumber.value : this.rawNumber,
    rawLength: rawLength.present ? rawLength.value : this.rawLength,
    rawItem: rawItem.present ? rawItem.value : this.rawItem,
  );
  ScavengeListEntry copyWithCompanion(ScavengeListCompanion data) {
    return ScavengeListEntry(
      id: data.id.present ? data.id.value : this.id,
      houseNumber: data.houseNumber.present
          ? data.houseNumber.value
          : this.houseNumber,
      houseItem: data.houseItem.present ? data.houseItem.value : this.houseItem,
      rawNumber: data.rawNumber.present ? data.rawNumber.value : this.rawNumber,
      rawLength: data.rawLength.present ? data.rawLength.value : this.rawLength,
      rawItem: data.rawItem.present ? data.rawItem.value : this.rawItem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScavengeListEntry(')
          ..write('id: $id, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('houseItem: $houseItem, ')
          ..write('rawNumber: $rawNumber, ')
          ..write('rawLength: $rawLength, ')
          ..write('rawItem: $rawItem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, houseNumber, houseItem, rawNumber, rawLength, rawItem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScavengeListEntry &&
          other.id == this.id &&
          other.houseNumber == this.houseNumber &&
          other.houseItem == this.houseItem &&
          other.rawNumber == this.rawNumber &&
          other.rawLength == this.rawLength &&
          other.rawItem == this.rawItem);
}

class ScavengeListCompanion extends UpdateCompanion<ScavengeListEntry> {
  final Value<int> id;
  final Value<String?> houseNumber;
  final Value<String?> houseItem;
  final Value<String?> rawNumber;
  final Value<String?> rawLength;
  final Value<String?> rawItem;
  const ScavengeListCompanion({
    this.id = const Value.absent(),
    this.houseNumber = const Value.absent(),
    this.houseItem = const Value.absent(),
    this.rawNumber = const Value.absent(),
    this.rawLength = const Value.absent(),
    this.rawItem = const Value.absent(),
  });
  ScavengeListCompanion.insert({
    this.id = const Value.absent(),
    this.houseNumber = const Value.absent(),
    this.houseItem = const Value.absent(),
    this.rawNumber = const Value.absent(),
    this.rawLength = const Value.absent(),
    this.rawItem = const Value.absent(),
  });
  static Insertable<ScavengeListEntry> custom({
    Expression<int>? id,
    Expression<String>? houseNumber,
    Expression<String>? houseItem,
    Expression<String>? rawNumber,
    Expression<String>? rawLength,
    Expression<String>? rawItem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseNumber != null) 'house_number': houseNumber,
      if (houseItem != null) 'house_item': houseItem,
      if (rawNumber != null) 'raw_number': rawNumber,
      if (rawLength != null) 'raw_length': rawLength,
      if (rawItem != null) 'raw_item': rawItem,
    });
  }

  ScavengeListCompanion copyWith({
    Value<int>? id,
    Value<String?>? houseNumber,
    Value<String?>? houseItem,
    Value<String?>? rawNumber,
    Value<String?>? rawLength,
    Value<String?>? rawItem,
  }) {
    return ScavengeListCompanion(
      id: id ?? this.id,
      houseNumber: houseNumber ?? this.houseNumber,
      houseItem: houseItem ?? this.houseItem,
      rawNumber: rawNumber ?? this.rawNumber,
      rawLength: rawLength ?? this.rawLength,
      rawItem: rawItem ?? this.rawItem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (houseNumber.present) {
      map['house_number'] = Variable<String>(houseNumber.value);
    }
    if (houseItem.present) {
      map['house_item'] = Variable<String>(houseItem.value);
    }
    if (rawNumber.present) {
      map['raw_number'] = Variable<String>(rawNumber.value);
    }
    if (rawLength.present) {
      map['raw_length'] = Variable<String>(rawLength.value);
    }
    if (rawItem.present) {
      map['raw_item'] = Variable<String>(rawItem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScavengeListCompanion(')
          ..write('id: $id, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('houseItem: $houseItem, ')
          ..write('rawNumber: $rawNumber, ')
          ..write('rawLength: $rawLength, ')
          ..write('rawItem: $rawItem')
          ..write(')'))
        .toString();
  }
}

class $ShipModelsTable extends ShipModels
    with TableInfo<$ShipModelsTable, ShipModelEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipModelsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _milCivMeta = const VerificationMeta('milCiv');
  @override
  late final GeneratedColumn<String> milCiv = GeneratedColumn<String>(
    'mil_civ',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mfgMeta = const VerificationMeta('mfg');
  @override
  late final GeneratedColumn<String> mfg = GeneratedColumn<String>(
    'mfg',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shipClassMeta = const VerificationMeta(
    'shipClass',
  );
  @override
  late final GeneratedColumn<String> shipClass = GeneratedColumn<String>(
    'ship_class',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weapMeta = const VerificationMeta('weap');
  @override
  late final GeneratedColumn<int> weap = GeneratedColumn<int>(
    'weap',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _armorMeta = const VerificationMeta('armor');
  @override
  late final GeneratedColumn<int> armor = GeneratedColumn<int>(
    'armor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _baysMeta = const VerificationMeta('bays');
  @override
  late final GeneratedColumn<int> bays = GeneratedColumn<int>(
    'bays',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _cargoMeta = const VerificationMeta('cargo');
  @override
  late final GeneratedColumn<int> cargo = GeneratedColumn<int>(
    'cargo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _enginesMeta = const VerificationMeta(
    'engines',
  );
  @override
  late final GeneratedColumn<int> engines = GeneratedColumn<int>(
    'engines',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maneuvMeta = const VerificationMeta('maneuv');
  @override
  late final GeneratedColumn<int> maneuv = GeneratedColumn<int>(
    'maneuv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weapCtrlMeta = const VerificationMeta(
    'weapCtrl',
  );
  @override
  late final GeneratedColumn<int> weapCtrl = GeneratedColumn<int>(
    'weap_ctrl',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _cloakMeta = const VerificationMeta('cloak');
  @override
  late final GeneratedColumn<int> cloak = GeneratedColumn<int>(
    'cloak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lifeSuppMeta = const VerificationMeta(
    'lifeSupp',
  );
  @override
  late final GeneratedColumn<int> lifeSupp = GeneratedColumn<int>(
    'life_supp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxCargoMeta = const VerificationMeta(
    'maxCargo',
  );
  @override
  late final GeneratedColumn<int> maxCargo = GeneratedColumn<int>(
    'max_cargo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxEnginesMeta = const VerificationMeta(
    'maxEngines',
  );
  @override
  late final GeneratedColumn<int> maxEngines = GeneratedColumn<int>(
    'max_engines',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxManeuvMeta = const VerificationMeta(
    'maxManeuv',
  );
  @override
  late final GeneratedColumn<int> maxManeuv = GeneratedColumn<int>(
    'max_maneuv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxWeapCtrlMeta = const VerificationMeta(
    'maxWeapCtrl',
  );
  @override
  late final GeneratedColumn<int> maxWeapCtrl = GeneratedColumn<int>(
    'max_weap_ctrl',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maxLifeSuppMeta = const VerificationMeta(
    'maxLifeSupp',
  );
  @override
  late final GeneratedColumn<int> maxLifeSupp = GeneratedColumn<int>(
    'max_life_supp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _hpMeta = const VerificationMeta('hp');
  @override
  late final GeneratedColumn<int> hp = GeneratedColumn<int>(
    'hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _maxHpMeta = const VerificationMeta('maxHp');
  @override
  late final GeneratedColumn<int> maxHp = GeneratedColumn<int>(
    'max_hp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _baseValueMeta = const VerificationMeta(
    'baseValue',
  );
  @override
  late final GeneratedColumn<int> baseValue = GeneratedColumn<int>(
    'base_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    milCiv,
    mfg,
    shipClass,
    size,
    model,
    weap,
    armor,
    bays,
    cargo,
    engines,
    maneuv,
    weapCtrl,
    cloak,
    lifeSupp,
    maxCargo,
    maxEngines,
    maxManeuv,
    maxWeapCtrl,
    maxLifeSupp,
    hp,
    maxHp,
    baseValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ship_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShipModelEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mil_civ')) {
      context.handle(
        _milCivMeta,
        milCiv.isAcceptableOrUnknown(data['mil_civ']!, _milCivMeta),
      );
    }
    if (data.containsKey('mfg')) {
      context.handle(
        _mfgMeta,
        mfg.isAcceptableOrUnknown(data['mfg']!, _mfgMeta),
      );
    }
    if (data.containsKey('ship_class')) {
      context.handle(
        _shipClassMeta,
        shipClass.isAcceptableOrUnknown(data['ship_class']!, _shipClassMeta),
      );
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('weap')) {
      context.handle(
        _weapMeta,
        weap.isAcceptableOrUnknown(data['weap']!, _weapMeta),
      );
    }
    if (data.containsKey('armor')) {
      context.handle(
        _armorMeta,
        armor.isAcceptableOrUnknown(data['armor']!, _armorMeta),
      );
    }
    if (data.containsKey('bays')) {
      context.handle(
        _baysMeta,
        bays.isAcceptableOrUnknown(data['bays']!, _baysMeta),
      );
    }
    if (data.containsKey('cargo')) {
      context.handle(
        _cargoMeta,
        cargo.isAcceptableOrUnknown(data['cargo']!, _cargoMeta),
      );
    }
    if (data.containsKey('engines')) {
      context.handle(
        _enginesMeta,
        engines.isAcceptableOrUnknown(data['engines']!, _enginesMeta),
      );
    }
    if (data.containsKey('maneuv')) {
      context.handle(
        _maneuvMeta,
        maneuv.isAcceptableOrUnknown(data['maneuv']!, _maneuvMeta),
      );
    }
    if (data.containsKey('weap_ctrl')) {
      context.handle(
        _weapCtrlMeta,
        weapCtrl.isAcceptableOrUnknown(data['weap_ctrl']!, _weapCtrlMeta),
      );
    }
    if (data.containsKey('cloak')) {
      context.handle(
        _cloakMeta,
        cloak.isAcceptableOrUnknown(data['cloak']!, _cloakMeta),
      );
    }
    if (data.containsKey('life_supp')) {
      context.handle(
        _lifeSuppMeta,
        lifeSupp.isAcceptableOrUnknown(data['life_supp']!, _lifeSuppMeta),
      );
    }
    if (data.containsKey('max_cargo')) {
      context.handle(
        _maxCargoMeta,
        maxCargo.isAcceptableOrUnknown(data['max_cargo']!, _maxCargoMeta),
      );
    }
    if (data.containsKey('max_engines')) {
      context.handle(
        _maxEnginesMeta,
        maxEngines.isAcceptableOrUnknown(data['max_engines']!, _maxEnginesMeta),
      );
    }
    if (data.containsKey('max_maneuv')) {
      context.handle(
        _maxManeuvMeta,
        maxManeuv.isAcceptableOrUnknown(data['max_maneuv']!, _maxManeuvMeta),
      );
    }
    if (data.containsKey('max_weap_ctrl')) {
      context.handle(
        _maxWeapCtrlMeta,
        maxWeapCtrl.isAcceptableOrUnknown(
          data['max_weap_ctrl']!,
          _maxWeapCtrlMeta,
        ),
      );
    }
    if (data.containsKey('max_life_supp')) {
      context.handle(
        _maxLifeSuppMeta,
        maxLifeSupp.isAcceptableOrUnknown(
          data['max_life_supp']!,
          _maxLifeSuppMeta,
        ),
      );
    }
    if (data.containsKey('hp')) {
      context.handle(_hpMeta, hp.isAcceptableOrUnknown(data['hp']!, _hpMeta));
    }
    if (data.containsKey('max_hp')) {
      context.handle(
        _maxHpMeta,
        maxHp.isAcceptableOrUnknown(data['max_hp']!, _maxHpMeta),
      );
    }
    if (data.containsKey('base_value')) {
      context.handle(
        _baseValueMeta,
        baseValue.isAcceptableOrUnknown(data['base_value']!, _baseValueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShipModelEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShipModelEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      milCiv: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mil_civ'],
      ),
      mfg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mfg'],
      ),
      shipClass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ship_class'],
      ),
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size'],
      )!,
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      )!,
      weap: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weap'],
      )!,
      armor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}armor'],
      )!,
      bays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bays'],
      )!,
      cargo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cargo'],
      )!,
      engines: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}engines'],
      )!,
      maneuv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}maneuv'],
      )!,
      weapCtrl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weap_ctrl'],
      )!,
      cloak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cloak'],
      )!,
      lifeSupp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}life_supp'],
      )!,
      maxCargo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_cargo'],
      )!,
      maxEngines: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_engines'],
      )!,
      maxManeuv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_maneuv'],
      )!,
      maxWeapCtrl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_weap_ctrl'],
      )!,
      maxLifeSupp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_life_supp'],
      )!,
      hp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hp'],
      )!,
      maxHp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_hp'],
      )!,
      baseValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_value'],
      )!,
    );
  }

  @override
  $ShipModelsTable createAlias(String alias) {
    return $ShipModelsTable(attachedDatabase, alias);
  }
}

class ShipModelEntry extends DataClass implements Insertable<ShipModelEntry> {
  final int id;
  final String? milCiv;
  final String? mfg;
  final String? shipClass;
  final int size;
  final String model;
  final int weap;
  final int armor;
  final int bays;
  final int cargo;
  final int engines;
  final int maneuv;
  final int weapCtrl;
  final int cloak;
  final int lifeSupp;
  final int maxCargo;
  final int maxEngines;
  final int maxManeuv;
  final int maxWeapCtrl;
  final int maxLifeSupp;
  final int hp;
  final int maxHp;
  final int baseValue;
  const ShipModelEntry({
    required this.id,
    this.milCiv,
    this.mfg,
    this.shipClass,
    required this.size,
    required this.model,
    required this.weap,
    required this.armor,
    required this.bays,
    required this.cargo,
    required this.engines,
    required this.maneuv,
    required this.weapCtrl,
    required this.cloak,
    required this.lifeSupp,
    required this.maxCargo,
    required this.maxEngines,
    required this.maxManeuv,
    required this.maxWeapCtrl,
    required this.maxLifeSupp,
    required this.hp,
    required this.maxHp,
    required this.baseValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || milCiv != null) {
      map['mil_civ'] = Variable<String>(milCiv);
    }
    if (!nullToAbsent || mfg != null) {
      map['mfg'] = Variable<String>(mfg);
    }
    if (!nullToAbsent || shipClass != null) {
      map['ship_class'] = Variable<String>(shipClass);
    }
    map['size'] = Variable<int>(size);
    map['model'] = Variable<String>(model);
    map['weap'] = Variable<int>(weap);
    map['armor'] = Variable<int>(armor);
    map['bays'] = Variable<int>(bays);
    map['cargo'] = Variable<int>(cargo);
    map['engines'] = Variable<int>(engines);
    map['maneuv'] = Variable<int>(maneuv);
    map['weap_ctrl'] = Variable<int>(weapCtrl);
    map['cloak'] = Variable<int>(cloak);
    map['life_supp'] = Variable<int>(lifeSupp);
    map['max_cargo'] = Variable<int>(maxCargo);
    map['max_engines'] = Variable<int>(maxEngines);
    map['max_maneuv'] = Variable<int>(maxManeuv);
    map['max_weap_ctrl'] = Variable<int>(maxWeapCtrl);
    map['max_life_supp'] = Variable<int>(maxLifeSupp);
    map['hp'] = Variable<int>(hp);
    map['max_hp'] = Variable<int>(maxHp);
    map['base_value'] = Variable<int>(baseValue);
    return map;
  }

  ShipModelsCompanion toCompanion(bool nullToAbsent) {
    return ShipModelsCompanion(
      id: Value(id),
      milCiv: milCiv == null && nullToAbsent
          ? const Value.absent()
          : Value(milCiv),
      mfg: mfg == null && nullToAbsent ? const Value.absent() : Value(mfg),
      shipClass: shipClass == null && nullToAbsent
          ? const Value.absent()
          : Value(shipClass),
      size: Value(size),
      model: Value(model),
      weap: Value(weap),
      armor: Value(armor),
      bays: Value(bays),
      cargo: Value(cargo),
      engines: Value(engines),
      maneuv: Value(maneuv),
      weapCtrl: Value(weapCtrl),
      cloak: Value(cloak),
      lifeSupp: Value(lifeSupp),
      maxCargo: Value(maxCargo),
      maxEngines: Value(maxEngines),
      maxManeuv: Value(maxManeuv),
      maxWeapCtrl: Value(maxWeapCtrl),
      maxLifeSupp: Value(maxLifeSupp),
      hp: Value(hp),
      maxHp: Value(maxHp),
      baseValue: Value(baseValue),
    );
  }

  factory ShipModelEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShipModelEntry(
      id: serializer.fromJson<int>(json['id']),
      milCiv: serializer.fromJson<String?>(json['milCiv']),
      mfg: serializer.fromJson<String?>(json['mfg']),
      shipClass: serializer.fromJson<String?>(json['shipClass']),
      size: serializer.fromJson<int>(json['size']),
      model: serializer.fromJson<String>(json['model']),
      weap: serializer.fromJson<int>(json['weap']),
      armor: serializer.fromJson<int>(json['armor']),
      bays: serializer.fromJson<int>(json['bays']),
      cargo: serializer.fromJson<int>(json['cargo']),
      engines: serializer.fromJson<int>(json['engines']),
      maneuv: serializer.fromJson<int>(json['maneuv']),
      weapCtrl: serializer.fromJson<int>(json['weapCtrl']),
      cloak: serializer.fromJson<int>(json['cloak']),
      lifeSupp: serializer.fromJson<int>(json['lifeSupp']),
      maxCargo: serializer.fromJson<int>(json['maxCargo']),
      maxEngines: serializer.fromJson<int>(json['maxEngines']),
      maxManeuv: serializer.fromJson<int>(json['maxManeuv']),
      maxWeapCtrl: serializer.fromJson<int>(json['maxWeapCtrl']),
      maxLifeSupp: serializer.fromJson<int>(json['maxLifeSupp']),
      hp: serializer.fromJson<int>(json['hp']),
      maxHp: serializer.fromJson<int>(json['maxHp']),
      baseValue: serializer.fromJson<int>(json['baseValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'milCiv': serializer.toJson<String?>(milCiv),
      'mfg': serializer.toJson<String?>(mfg),
      'shipClass': serializer.toJson<String?>(shipClass),
      'size': serializer.toJson<int>(size),
      'model': serializer.toJson<String>(model),
      'weap': serializer.toJson<int>(weap),
      'armor': serializer.toJson<int>(armor),
      'bays': serializer.toJson<int>(bays),
      'cargo': serializer.toJson<int>(cargo),
      'engines': serializer.toJson<int>(engines),
      'maneuv': serializer.toJson<int>(maneuv),
      'weapCtrl': serializer.toJson<int>(weapCtrl),
      'cloak': serializer.toJson<int>(cloak),
      'lifeSupp': serializer.toJson<int>(lifeSupp),
      'maxCargo': serializer.toJson<int>(maxCargo),
      'maxEngines': serializer.toJson<int>(maxEngines),
      'maxManeuv': serializer.toJson<int>(maxManeuv),
      'maxWeapCtrl': serializer.toJson<int>(maxWeapCtrl),
      'maxLifeSupp': serializer.toJson<int>(maxLifeSupp),
      'hp': serializer.toJson<int>(hp),
      'maxHp': serializer.toJson<int>(maxHp),
      'baseValue': serializer.toJson<int>(baseValue),
    };
  }

  ShipModelEntry copyWith({
    int? id,
    Value<String?> milCiv = const Value.absent(),
    Value<String?> mfg = const Value.absent(),
    Value<String?> shipClass = const Value.absent(),
    int? size,
    String? model,
    int? weap,
    int? armor,
    int? bays,
    int? cargo,
    int? engines,
    int? maneuv,
    int? weapCtrl,
    int? cloak,
    int? lifeSupp,
    int? maxCargo,
    int? maxEngines,
    int? maxManeuv,
    int? maxWeapCtrl,
    int? maxLifeSupp,
    int? hp,
    int? maxHp,
    int? baseValue,
  }) => ShipModelEntry(
    id: id ?? this.id,
    milCiv: milCiv.present ? milCiv.value : this.milCiv,
    mfg: mfg.present ? mfg.value : this.mfg,
    shipClass: shipClass.present ? shipClass.value : this.shipClass,
    size: size ?? this.size,
    model: model ?? this.model,
    weap: weap ?? this.weap,
    armor: armor ?? this.armor,
    bays: bays ?? this.bays,
    cargo: cargo ?? this.cargo,
    engines: engines ?? this.engines,
    maneuv: maneuv ?? this.maneuv,
    weapCtrl: weapCtrl ?? this.weapCtrl,
    cloak: cloak ?? this.cloak,
    lifeSupp: lifeSupp ?? this.lifeSupp,
    maxCargo: maxCargo ?? this.maxCargo,
    maxEngines: maxEngines ?? this.maxEngines,
    maxManeuv: maxManeuv ?? this.maxManeuv,
    maxWeapCtrl: maxWeapCtrl ?? this.maxWeapCtrl,
    maxLifeSupp: maxLifeSupp ?? this.maxLifeSupp,
    hp: hp ?? this.hp,
    maxHp: maxHp ?? this.maxHp,
    baseValue: baseValue ?? this.baseValue,
  );
  ShipModelEntry copyWithCompanion(ShipModelsCompanion data) {
    return ShipModelEntry(
      id: data.id.present ? data.id.value : this.id,
      milCiv: data.milCiv.present ? data.milCiv.value : this.milCiv,
      mfg: data.mfg.present ? data.mfg.value : this.mfg,
      shipClass: data.shipClass.present ? data.shipClass.value : this.shipClass,
      size: data.size.present ? data.size.value : this.size,
      model: data.model.present ? data.model.value : this.model,
      weap: data.weap.present ? data.weap.value : this.weap,
      armor: data.armor.present ? data.armor.value : this.armor,
      bays: data.bays.present ? data.bays.value : this.bays,
      cargo: data.cargo.present ? data.cargo.value : this.cargo,
      engines: data.engines.present ? data.engines.value : this.engines,
      maneuv: data.maneuv.present ? data.maneuv.value : this.maneuv,
      weapCtrl: data.weapCtrl.present ? data.weapCtrl.value : this.weapCtrl,
      cloak: data.cloak.present ? data.cloak.value : this.cloak,
      lifeSupp: data.lifeSupp.present ? data.lifeSupp.value : this.lifeSupp,
      maxCargo: data.maxCargo.present ? data.maxCargo.value : this.maxCargo,
      maxEngines: data.maxEngines.present
          ? data.maxEngines.value
          : this.maxEngines,
      maxManeuv: data.maxManeuv.present ? data.maxManeuv.value : this.maxManeuv,
      maxWeapCtrl: data.maxWeapCtrl.present
          ? data.maxWeapCtrl.value
          : this.maxWeapCtrl,
      maxLifeSupp: data.maxLifeSupp.present
          ? data.maxLifeSupp.value
          : this.maxLifeSupp,
      hp: data.hp.present ? data.hp.value : this.hp,
      maxHp: data.maxHp.present ? data.maxHp.value : this.maxHp,
      baseValue: data.baseValue.present ? data.baseValue.value : this.baseValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShipModelEntry(')
          ..write('id: $id, ')
          ..write('milCiv: $milCiv, ')
          ..write('mfg: $mfg, ')
          ..write('shipClass: $shipClass, ')
          ..write('size: $size, ')
          ..write('model: $model, ')
          ..write('weap: $weap, ')
          ..write('armor: $armor, ')
          ..write('bays: $bays, ')
          ..write('cargo: $cargo, ')
          ..write('engines: $engines, ')
          ..write('maneuv: $maneuv, ')
          ..write('weapCtrl: $weapCtrl, ')
          ..write('cloak: $cloak, ')
          ..write('lifeSupp: $lifeSupp, ')
          ..write('maxCargo: $maxCargo, ')
          ..write('maxEngines: $maxEngines, ')
          ..write('maxManeuv: $maxManeuv, ')
          ..write('maxWeapCtrl: $maxWeapCtrl, ')
          ..write('maxLifeSupp: $maxLifeSupp, ')
          ..write('hp: $hp, ')
          ..write('maxHp: $maxHp, ')
          ..write('baseValue: $baseValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    milCiv,
    mfg,
    shipClass,
    size,
    model,
    weap,
    armor,
    bays,
    cargo,
    engines,
    maneuv,
    weapCtrl,
    cloak,
    lifeSupp,
    maxCargo,
    maxEngines,
    maxManeuv,
    maxWeapCtrl,
    maxLifeSupp,
    hp,
    maxHp,
    baseValue,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShipModelEntry &&
          other.id == this.id &&
          other.milCiv == this.milCiv &&
          other.mfg == this.mfg &&
          other.shipClass == this.shipClass &&
          other.size == this.size &&
          other.model == this.model &&
          other.weap == this.weap &&
          other.armor == this.armor &&
          other.bays == this.bays &&
          other.cargo == this.cargo &&
          other.engines == this.engines &&
          other.maneuv == this.maneuv &&
          other.weapCtrl == this.weapCtrl &&
          other.cloak == this.cloak &&
          other.lifeSupp == this.lifeSupp &&
          other.maxCargo == this.maxCargo &&
          other.maxEngines == this.maxEngines &&
          other.maxManeuv == this.maxManeuv &&
          other.maxWeapCtrl == this.maxWeapCtrl &&
          other.maxLifeSupp == this.maxLifeSupp &&
          other.hp == this.hp &&
          other.maxHp == this.maxHp &&
          other.baseValue == this.baseValue);
}

class ShipModelsCompanion extends UpdateCompanion<ShipModelEntry> {
  final Value<int> id;
  final Value<String?> milCiv;
  final Value<String?> mfg;
  final Value<String?> shipClass;
  final Value<int> size;
  final Value<String> model;
  final Value<int> weap;
  final Value<int> armor;
  final Value<int> bays;
  final Value<int> cargo;
  final Value<int> engines;
  final Value<int> maneuv;
  final Value<int> weapCtrl;
  final Value<int> cloak;
  final Value<int> lifeSupp;
  final Value<int> maxCargo;
  final Value<int> maxEngines;
  final Value<int> maxManeuv;
  final Value<int> maxWeapCtrl;
  final Value<int> maxLifeSupp;
  final Value<int> hp;
  final Value<int> maxHp;
  final Value<int> baseValue;
  const ShipModelsCompanion({
    this.id = const Value.absent(),
    this.milCiv = const Value.absent(),
    this.mfg = const Value.absent(),
    this.shipClass = const Value.absent(),
    this.size = const Value.absent(),
    this.model = const Value.absent(),
    this.weap = const Value.absent(),
    this.armor = const Value.absent(),
    this.bays = const Value.absent(),
    this.cargo = const Value.absent(),
    this.engines = const Value.absent(),
    this.maneuv = const Value.absent(),
    this.weapCtrl = const Value.absent(),
    this.cloak = const Value.absent(),
    this.lifeSupp = const Value.absent(),
    this.maxCargo = const Value.absent(),
    this.maxEngines = const Value.absent(),
    this.maxManeuv = const Value.absent(),
    this.maxWeapCtrl = const Value.absent(),
    this.maxLifeSupp = const Value.absent(),
    this.hp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.baseValue = const Value.absent(),
  });
  ShipModelsCompanion.insert({
    this.id = const Value.absent(),
    this.milCiv = const Value.absent(),
    this.mfg = const Value.absent(),
    this.shipClass = const Value.absent(),
    this.size = const Value.absent(),
    required String model,
    this.weap = const Value.absent(),
    this.armor = const Value.absent(),
    this.bays = const Value.absent(),
    this.cargo = const Value.absent(),
    this.engines = const Value.absent(),
    this.maneuv = const Value.absent(),
    this.weapCtrl = const Value.absent(),
    this.cloak = const Value.absent(),
    this.lifeSupp = const Value.absent(),
    this.maxCargo = const Value.absent(),
    this.maxEngines = const Value.absent(),
    this.maxManeuv = const Value.absent(),
    this.maxWeapCtrl = const Value.absent(),
    this.maxLifeSupp = const Value.absent(),
    this.hp = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.baseValue = const Value.absent(),
  }) : model = Value(model);
  static Insertable<ShipModelEntry> custom({
    Expression<int>? id,
    Expression<String>? milCiv,
    Expression<String>? mfg,
    Expression<String>? shipClass,
    Expression<int>? size,
    Expression<String>? model,
    Expression<int>? weap,
    Expression<int>? armor,
    Expression<int>? bays,
    Expression<int>? cargo,
    Expression<int>? engines,
    Expression<int>? maneuv,
    Expression<int>? weapCtrl,
    Expression<int>? cloak,
    Expression<int>? lifeSupp,
    Expression<int>? maxCargo,
    Expression<int>? maxEngines,
    Expression<int>? maxManeuv,
    Expression<int>? maxWeapCtrl,
    Expression<int>? maxLifeSupp,
    Expression<int>? hp,
    Expression<int>? maxHp,
    Expression<int>? baseValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (milCiv != null) 'mil_civ': milCiv,
      if (mfg != null) 'mfg': mfg,
      if (shipClass != null) 'ship_class': shipClass,
      if (size != null) 'size': size,
      if (model != null) 'model': model,
      if (weap != null) 'weap': weap,
      if (armor != null) 'armor': armor,
      if (bays != null) 'bays': bays,
      if (cargo != null) 'cargo': cargo,
      if (engines != null) 'engines': engines,
      if (maneuv != null) 'maneuv': maneuv,
      if (weapCtrl != null) 'weap_ctrl': weapCtrl,
      if (cloak != null) 'cloak': cloak,
      if (lifeSupp != null) 'life_supp': lifeSupp,
      if (maxCargo != null) 'max_cargo': maxCargo,
      if (maxEngines != null) 'max_engines': maxEngines,
      if (maxManeuv != null) 'max_maneuv': maxManeuv,
      if (maxWeapCtrl != null) 'max_weap_ctrl': maxWeapCtrl,
      if (maxLifeSupp != null) 'max_life_supp': maxLifeSupp,
      if (hp != null) 'hp': hp,
      if (maxHp != null) 'max_hp': maxHp,
      if (baseValue != null) 'base_value': baseValue,
    });
  }

  ShipModelsCompanion copyWith({
    Value<int>? id,
    Value<String?>? milCiv,
    Value<String?>? mfg,
    Value<String?>? shipClass,
    Value<int>? size,
    Value<String>? model,
    Value<int>? weap,
    Value<int>? armor,
    Value<int>? bays,
    Value<int>? cargo,
    Value<int>? engines,
    Value<int>? maneuv,
    Value<int>? weapCtrl,
    Value<int>? cloak,
    Value<int>? lifeSupp,
    Value<int>? maxCargo,
    Value<int>? maxEngines,
    Value<int>? maxManeuv,
    Value<int>? maxWeapCtrl,
    Value<int>? maxLifeSupp,
    Value<int>? hp,
    Value<int>? maxHp,
    Value<int>? baseValue,
  }) {
    return ShipModelsCompanion(
      id: id ?? this.id,
      milCiv: milCiv ?? this.milCiv,
      mfg: mfg ?? this.mfg,
      shipClass: shipClass ?? this.shipClass,
      size: size ?? this.size,
      model: model ?? this.model,
      weap: weap ?? this.weap,
      armor: armor ?? this.armor,
      bays: bays ?? this.bays,
      cargo: cargo ?? this.cargo,
      engines: engines ?? this.engines,
      maneuv: maneuv ?? this.maneuv,
      weapCtrl: weapCtrl ?? this.weapCtrl,
      cloak: cloak ?? this.cloak,
      lifeSupp: lifeSupp ?? this.lifeSupp,
      maxCargo: maxCargo ?? this.maxCargo,
      maxEngines: maxEngines ?? this.maxEngines,
      maxManeuv: maxManeuv ?? this.maxManeuv,
      maxWeapCtrl: maxWeapCtrl ?? this.maxWeapCtrl,
      maxLifeSupp: maxLifeSupp ?? this.maxLifeSupp,
      hp: hp ?? this.hp,
      maxHp: maxHp ?? this.maxHp,
      baseValue: baseValue ?? this.baseValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (milCiv.present) {
      map['mil_civ'] = Variable<String>(milCiv.value);
    }
    if (mfg.present) {
      map['mfg'] = Variable<String>(mfg.value);
    }
    if (shipClass.present) {
      map['ship_class'] = Variable<String>(shipClass.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (weap.present) {
      map['weap'] = Variable<int>(weap.value);
    }
    if (armor.present) {
      map['armor'] = Variable<int>(armor.value);
    }
    if (bays.present) {
      map['bays'] = Variable<int>(bays.value);
    }
    if (cargo.present) {
      map['cargo'] = Variable<int>(cargo.value);
    }
    if (engines.present) {
      map['engines'] = Variable<int>(engines.value);
    }
    if (maneuv.present) {
      map['maneuv'] = Variable<int>(maneuv.value);
    }
    if (weapCtrl.present) {
      map['weap_ctrl'] = Variable<int>(weapCtrl.value);
    }
    if (cloak.present) {
      map['cloak'] = Variable<int>(cloak.value);
    }
    if (lifeSupp.present) {
      map['life_supp'] = Variable<int>(lifeSupp.value);
    }
    if (maxCargo.present) {
      map['max_cargo'] = Variable<int>(maxCargo.value);
    }
    if (maxEngines.present) {
      map['max_engines'] = Variable<int>(maxEngines.value);
    }
    if (maxManeuv.present) {
      map['max_maneuv'] = Variable<int>(maxManeuv.value);
    }
    if (maxWeapCtrl.present) {
      map['max_weap_ctrl'] = Variable<int>(maxWeapCtrl.value);
    }
    if (maxLifeSupp.present) {
      map['max_life_supp'] = Variable<int>(maxLifeSupp.value);
    }
    if (hp.present) {
      map['hp'] = Variable<int>(hp.value);
    }
    if (maxHp.present) {
      map['max_hp'] = Variable<int>(maxHp.value);
    }
    if (baseValue.present) {
      map['base_value'] = Variable<int>(baseValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipModelsCompanion(')
          ..write('id: $id, ')
          ..write('milCiv: $milCiv, ')
          ..write('mfg: $mfg, ')
          ..write('shipClass: $shipClass, ')
          ..write('size: $size, ')
          ..write('model: $model, ')
          ..write('weap: $weap, ')
          ..write('armor: $armor, ')
          ..write('bays: $bays, ')
          ..write('cargo: $cargo, ')
          ..write('engines: $engines, ')
          ..write('maneuv: $maneuv, ')
          ..write('weapCtrl: $weapCtrl, ')
          ..write('cloak: $cloak, ')
          ..write('lifeSupp: $lifeSupp, ')
          ..write('maxCargo: $maxCargo, ')
          ..write('maxEngines: $maxEngines, ')
          ..write('maxManeuv: $maxManeuv, ')
          ..write('maxWeapCtrl: $maxWeapCtrl, ')
          ..write('maxLifeSupp: $maxLifeSupp, ')
          ..write('hp: $hp, ')
          ..write('maxHp: $maxHp, ')
          ..write('baseValue: $baseValue')
          ..write(')'))
        .toString();
  }
}

class $ShipModsTable extends ShipMods with TableInfo<$ShipModsTable, ShipMod> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipModsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _modIdMeta = const VerificationMeta('modId');
  @override
  late final GeneratedColumn<int> modId = GeneratedColumn<int>(
    'mod_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shipNameMeta = const VerificationMeta(
    'shipName',
  );
  @override
  late final GeneratedColumn<String> shipName = GeneratedColumn<String>(
    'ship_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modTypeMeta = const VerificationMeta(
    'modType',
  );
  @override
  late final GeneratedColumn<String> modType = GeneratedColumn<String>(
    'mod_type',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modNameMeta = const VerificationMeta(
    'modName',
  );
  @override
  late final GeneratedColumn<String> modName = GeneratedColumn<String>(
    'mod_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _powerMeta = const VerificationMeta('power');
  @override
  late final GeneratedColumn<int> power = GeneratedColumn<int>(
    'power',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    modId,
    shipName,
    modType,
    modName,
    power,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ship_mods';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShipMod> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mod_id')) {
      context.handle(
        _modIdMeta,
        modId.isAcceptableOrUnknown(data['mod_id']!, _modIdMeta),
      );
    }
    if (data.containsKey('ship_name')) {
      context.handle(
        _shipNameMeta,
        shipName.isAcceptableOrUnknown(data['ship_name']!, _shipNameMeta),
      );
    }
    if (data.containsKey('mod_type')) {
      context.handle(
        _modTypeMeta,
        modType.isAcceptableOrUnknown(data['mod_type']!, _modTypeMeta),
      );
    }
    if (data.containsKey('mod_name')) {
      context.handle(
        _modNameMeta,
        modName.isAcceptableOrUnknown(data['mod_name']!, _modNameMeta),
      );
    }
    if (data.containsKey('power')) {
      context.handle(
        _powerMeta,
        power.isAcceptableOrUnknown(data['power']!, _powerMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {modId};
  @override
  ShipMod map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShipMod(
      modId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mod_id'],
      )!,
      shipName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ship_name'],
      ),
      modType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mod_type'],
      ),
      modName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mod_name'],
      ),
      power: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}power'],
      )!,
    );
  }

  @override
  $ShipModsTable createAlias(String alias) {
    return $ShipModsTable(attachedDatabase, alias);
  }
}

class ShipMod extends DataClass implements Insertable<ShipMod> {
  final int modId;
  final String? shipName;
  final String? modType;
  final String? modName;
  final int power;
  const ShipMod({
    required this.modId,
    this.shipName,
    this.modType,
    this.modName,
    required this.power,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mod_id'] = Variable<int>(modId);
    if (!nullToAbsent || shipName != null) {
      map['ship_name'] = Variable<String>(shipName);
    }
    if (!nullToAbsent || modType != null) {
      map['mod_type'] = Variable<String>(modType);
    }
    if (!nullToAbsent || modName != null) {
      map['mod_name'] = Variable<String>(modName);
    }
    map['power'] = Variable<int>(power);
    return map;
  }

  ShipModsCompanion toCompanion(bool nullToAbsent) {
    return ShipModsCompanion(
      modId: Value(modId),
      shipName: shipName == null && nullToAbsent
          ? const Value.absent()
          : Value(shipName),
      modType: modType == null && nullToAbsent
          ? const Value.absent()
          : Value(modType),
      modName: modName == null && nullToAbsent
          ? const Value.absent()
          : Value(modName),
      power: Value(power),
    );
  }

  factory ShipMod.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShipMod(
      modId: serializer.fromJson<int>(json['modId']),
      shipName: serializer.fromJson<String?>(json['shipName']),
      modType: serializer.fromJson<String?>(json['modType']),
      modName: serializer.fromJson<String?>(json['modName']),
      power: serializer.fromJson<int>(json['power']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'modId': serializer.toJson<int>(modId),
      'shipName': serializer.toJson<String?>(shipName),
      'modType': serializer.toJson<String?>(modType),
      'modName': serializer.toJson<String?>(modName),
      'power': serializer.toJson<int>(power),
    };
  }

  ShipMod copyWith({
    int? modId,
    Value<String?> shipName = const Value.absent(),
    Value<String?> modType = const Value.absent(),
    Value<String?> modName = const Value.absent(),
    int? power,
  }) => ShipMod(
    modId: modId ?? this.modId,
    shipName: shipName.present ? shipName.value : this.shipName,
    modType: modType.present ? modType.value : this.modType,
    modName: modName.present ? modName.value : this.modName,
    power: power ?? this.power,
  );
  ShipMod copyWithCompanion(ShipModsCompanion data) {
    return ShipMod(
      modId: data.modId.present ? data.modId.value : this.modId,
      shipName: data.shipName.present ? data.shipName.value : this.shipName,
      modType: data.modType.present ? data.modType.value : this.modType,
      modName: data.modName.present ? data.modName.value : this.modName,
      power: data.power.present ? data.power.value : this.power,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShipMod(')
          ..write('modId: $modId, ')
          ..write('shipName: $shipName, ')
          ..write('modType: $modType, ')
          ..write('modName: $modName, ')
          ..write('power: $power')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(modId, shipName, modType, modName, power);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShipMod &&
          other.modId == this.modId &&
          other.shipName == this.shipName &&
          other.modType == this.modType &&
          other.modName == this.modName &&
          other.power == this.power);
}

class ShipModsCompanion extends UpdateCompanion<ShipMod> {
  final Value<int> modId;
  final Value<String?> shipName;
  final Value<String?> modType;
  final Value<String?> modName;
  final Value<int> power;
  const ShipModsCompanion({
    this.modId = const Value.absent(),
    this.shipName = const Value.absent(),
    this.modType = const Value.absent(),
    this.modName = const Value.absent(),
    this.power = const Value.absent(),
  });
  ShipModsCompanion.insert({
    this.modId = const Value.absent(),
    this.shipName = const Value.absent(),
    this.modType = const Value.absent(),
    this.modName = const Value.absent(),
    this.power = const Value.absent(),
  });
  static Insertable<ShipMod> custom({
    Expression<int>? modId,
    Expression<String>? shipName,
    Expression<String>? modType,
    Expression<String>? modName,
    Expression<int>? power,
  }) {
    return RawValuesInsertable({
      if (modId != null) 'mod_id': modId,
      if (shipName != null) 'ship_name': shipName,
      if (modType != null) 'mod_type': modType,
      if (modName != null) 'mod_name': modName,
      if (power != null) 'power': power,
    });
  }

  ShipModsCompanion copyWith({
    Value<int>? modId,
    Value<String?>? shipName,
    Value<String?>? modType,
    Value<String?>? modName,
    Value<int>? power,
  }) {
    return ShipModsCompanion(
      modId: modId ?? this.modId,
      shipName: shipName ?? this.shipName,
      modType: modType ?? this.modType,
      modName: modName ?? this.modName,
      power: power ?? this.power,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (modId.present) {
      map['mod_id'] = Variable<int>(modId.value);
    }
    if (shipName.present) {
      map['ship_name'] = Variable<String>(shipName.value);
    }
    if (modType.present) {
      map['mod_type'] = Variable<String>(modType.value);
    }
    if (modName.present) {
      map['mod_name'] = Variable<String>(modName.value);
    }
    if (power.present) {
      map['power'] = Variable<int>(power.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipModsCompanion(')
          ..write('modId: $modId, ')
          ..write('shipName: $shipName, ')
          ..write('modType: $modType, ')
          ..write('modName: $modName, ')
          ..write('power: $power')
          ..write(')'))
        .toString();
  }
}

class $ShipModsAvailableTable extends ShipModsAvailable
    with TableInfo<$ShipModsAvailableTable, ShipModAvailable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipModsAvailableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _modTypeMeta = const VerificationMeta(
    'modType',
  );
  @override
  late final GeneratedColumn<String> modType = GeneratedColumn<String>(
    'mod_type',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modNameMeta = const VerificationMeta(
    'modName',
  );
  @override
  late final GeneratedColumn<String> modName = GeneratedColumn<String>(
    'mod_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _powerMeta = const VerificationMeta('power');
  @override
  late final GeneratedColumn<int> power = GeneratedColumn<int>(
    'power',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, modType, modName, power, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ship_mods_available';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShipModAvailable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mod_type')) {
      context.handle(
        _modTypeMeta,
        modType.isAcceptableOrUnknown(data['mod_type']!, _modTypeMeta),
      );
    }
    if (data.containsKey('mod_name')) {
      context.handle(
        _modNameMeta,
        modName.isAcceptableOrUnknown(data['mod_name']!, _modNameMeta),
      );
    } else if (isInserting) {
      context.missing(_modNameMeta);
    }
    if (data.containsKey('power')) {
      context.handle(
        _powerMeta,
        power.isAcceptableOrUnknown(data['power']!, _powerMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShipModAvailable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShipModAvailable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      modType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mod_type'],
      ),
      modName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mod_name'],
      )!,
      power: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}power'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
    );
  }

  @override
  $ShipModsAvailableTable createAlias(String alias) {
    return $ShipModsAvailableTable(attachedDatabase, alias);
  }
}

class ShipModAvailable extends DataClass
    implements Insertable<ShipModAvailable> {
  final int id;
  final String? modType;
  final String modName;
  final int power;
  final int price;
  const ShipModAvailable({
    required this.id,
    this.modType,
    required this.modName,
    required this.power,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || modType != null) {
      map['mod_type'] = Variable<String>(modType);
    }
    map['mod_name'] = Variable<String>(modName);
    map['power'] = Variable<int>(power);
    map['price'] = Variable<int>(price);
    return map;
  }

  ShipModsAvailableCompanion toCompanion(bool nullToAbsent) {
    return ShipModsAvailableCompanion(
      id: Value(id),
      modType: modType == null && nullToAbsent
          ? const Value.absent()
          : Value(modType),
      modName: Value(modName),
      power: Value(power),
      price: Value(price),
    );
  }

  factory ShipModAvailable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShipModAvailable(
      id: serializer.fromJson<int>(json['id']),
      modType: serializer.fromJson<String?>(json['modType']),
      modName: serializer.fromJson<String>(json['modName']),
      power: serializer.fromJson<int>(json['power']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'modType': serializer.toJson<String?>(modType),
      'modName': serializer.toJson<String>(modName),
      'power': serializer.toJson<int>(power),
      'price': serializer.toJson<int>(price),
    };
  }

  ShipModAvailable copyWith({
    int? id,
    Value<String?> modType = const Value.absent(),
    String? modName,
    int? power,
    int? price,
  }) => ShipModAvailable(
    id: id ?? this.id,
    modType: modType.present ? modType.value : this.modType,
    modName: modName ?? this.modName,
    power: power ?? this.power,
    price: price ?? this.price,
  );
  ShipModAvailable copyWithCompanion(ShipModsAvailableCompanion data) {
    return ShipModAvailable(
      id: data.id.present ? data.id.value : this.id,
      modType: data.modType.present ? data.modType.value : this.modType,
      modName: data.modName.present ? data.modName.value : this.modName,
      power: data.power.present ? data.power.value : this.power,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShipModAvailable(')
          ..write('id: $id, ')
          ..write('modType: $modType, ')
          ..write('modName: $modName, ')
          ..write('power: $power, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, modType, modName, power, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShipModAvailable &&
          other.id == this.id &&
          other.modType == this.modType &&
          other.modName == this.modName &&
          other.power == this.power &&
          other.price == this.price);
}

class ShipModsAvailableCompanion extends UpdateCompanion<ShipModAvailable> {
  final Value<int> id;
  final Value<String?> modType;
  final Value<String> modName;
  final Value<int> power;
  final Value<int> price;
  const ShipModsAvailableCompanion({
    this.id = const Value.absent(),
    this.modType = const Value.absent(),
    this.modName = const Value.absent(),
    this.power = const Value.absent(),
    this.price = const Value.absent(),
  });
  ShipModsAvailableCompanion.insert({
    this.id = const Value.absent(),
    this.modType = const Value.absent(),
    required String modName,
    this.power = const Value.absent(),
    this.price = const Value.absent(),
  }) : modName = Value(modName);
  static Insertable<ShipModAvailable> custom({
    Expression<int>? id,
    Expression<String>? modType,
    Expression<String>? modName,
    Expression<int>? power,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (modType != null) 'mod_type': modType,
      if (modName != null) 'mod_name': modName,
      if (power != null) 'power': power,
      if (price != null) 'price': price,
    });
  }

  ShipModsAvailableCompanion copyWith({
    Value<int>? id,
    Value<String?>? modType,
    Value<String>? modName,
    Value<int>? power,
    Value<int>? price,
  }) {
    return ShipModsAvailableCompanion(
      id: id ?? this.id,
      modType: modType ?? this.modType,
      modName: modName ?? this.modName,
      power: power ?? this.power,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (modType.present) {
      map['mod_type'] = Variable<String>(modType.value);
    }
    if (modName.present) {
      map['mod_name'] = Variable<String>(modName.value);
    }
    if (power.present) {
      map['power'] = Variable<int>(power.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipModsAvailableCompanion(')
          ..write('id: $id, ')
          ..write('modType: $modType, ')
          ..write('modName: $modName, ')
          ..write('power: $power, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $ShipPersonalitiesTable extends ShipPersonalities
    with TableInfo<$ShipPersonalitiesTable, ShipPersonality> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipPersonalitiesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _shipNameMeta = const VerificationMeta(
    'shipName',
  );
  @override
  late final GeneratedColumn<String> shipName = GeneratedColumn<String>(
    'ship_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personalityMeta = const VerificationMeta(
    'personality',
  );
  @override
  late final GeneratedColumn<String> personality = GeneratedColumn<String>(
    'personality',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [id, shipName, personality, level];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ship_personalities';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShipPersonality> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ship_name')) {
      context.handle(
        _shipNameMeta,
        shipName.isAcceptableOrUnknown(data['ship_name']!, _shipNameMeta),
      );
    } else if (isInserting) {
      context.missing(_shipNameMeta);
    }
    if (data.containsKey('personality')) {
      context.handle(
        _personalityMeta,
        personality.isAcceptableOrUnknown(
          data['personality']!,
          _personalityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_personalityMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShipPersonality map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShipPersonality(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shipName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ship_name'],
      )!,
      personality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personality'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
    );
  }

  @override
  $ShipPersonalitiesTable createAlias(String alias) {
    return $ShipPersonalitiesTable(attachedDatabase, alias);
  }
}

class ShipPersonality extends DataClass implements Insertable<ShipPersonality> {
  final int id;
  final String shipName;
  final String personality;
  final int level;
  const ShipPersonality({
    required this.id,
    required this.shipName,
    required this.personality,
    required this.level,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ship_name'] = Variable<String>(shipName);
    map['personality'] = Variable<String>(personality);
    map['level'] = Variable<int>(level);
    return map;
  }

  ShipPersonalitiesCompanion toCompanion(bool nullToAbsent) {
    return ShipPersonalitiesCompanion(
      id: Value(id),
      shipName: Value(shipName),
      personality: Value(personality),
      level: Value(level),
    );
  }

  factory ShipPersonality.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShipPersonality(
      id: serializer.fromJson<int>(json['id']),
      shipName: serializer.fromJson<String>(json['shipName']),
      personality: serializer.fromJson<String>(json['personality']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shipName': serializer.toJson<String>(shipName),
      'personality': serializer.toJson<String>(personality),
      'level': serializer.toJson<int>(level),
    };
  }

  ShipPersonality copyWith({
    int? id,
    String? shipName,
    String? personality,
    int? level,
  }) => ShipPersonality(
    id: id ?? this.id,
    shipName: shipName ?? this.shipName,
    personality: personality ?? this.personality,
    level: level ?? this.level,
  );
  ShipPersonality copyWithCompanion(ShipPersonalitiesCompanion data) {
    return ShipPersonality(
      id: data.id.present ? data.id.value : this.id,
      shipName: data.shipName.present ? data.shipName.value : this.shipName,
      personality: data.personality.present
          ? data.personality.value
          : this.personality,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShipPersonality(')
          ..write('id: $id, ')
          ..write('shipName: $shipName, ')
          ..write('personality: $personality, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, shipName, personality, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShipPersonality &&
          other.id == this.id &&
          other.shipName == this.shipName &&
          other.personality == this.personality &&
          other.level == this.level);
}

class ShipPersonalitiesCompanion extends UpdateCompanion<ShipPersonality> {
  final Value<int> id;
  final Value<String> shipName;
  final Value<String> personality;
  final Value<int> level;
  const ShipPersonalitiesCompanion({
    this.id = const Value.absent(),
    this.shipName = const Value.absent(),
    this.personality = const Value.absent(),
    this.level = const Value.absent(),
  });
  ShipPersonalitiesCompanion.insert({
    this.id = const Value.absent(),
    required String shipName,
    required String personality,
    this.level = const Value.absent(),
  }) : shipName = Value(shipName),
       personality = Value(personality);
  static Insertable<ShipPersonality> custom({
    Expression<int>? id,
    Expression<String>? shipName,
    Expression<String>? personality,
    Expression<int>? level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shipName != null) 'ship_name': shipName,
      if (personality != null) 'personality': personality,
      if (level != null) 'level': level,
    });
  }

  ShipPersonalitiesCompanion copyWith({
    Value<int>? id,
    Value<String>? shipName,
    Value<String>? personality,
    Value<int>? level,
  }) {
    return ShipPersonalitiesCompanion(
      id: id ?? this.id,
      shipName: shipName ?? this.shipName,
      personality: personality ?? this.personality,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shipName.present) {
      map['ship_name'] = Variable<String>(shipName.value);
    }
    if (personality.present) {
      map['personality'] = Variable<String>(personality.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipPersonalitiesCompanion(')
          ..write('id: $id, ')
          ..write('shipName: $shipName, ')
          ..write('personality: $personality, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $StationBuildingsTable extends StationBuildings
    with TableInfo<$StationBuildingsTable, StationBuilding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StationBuildingsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stationNameMeta = const VerificationMeta(
    'stationName',
  );
  @override
  late final GeneratedColumn<String> stationName = GeneratedColumn<String>(
    'station_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buildingTypeMeta = const VerificationMeta(
    'buildingType',
  );
  @override
  late final GeneratedColumn<String> buildingType = GeneratedColumn<String>(
    'building_type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buildingNameMeta = const VerificationMeta(
    'buildingName',
  );
  @override
  late final GeneratedColumn<String> buildingName = GeneratedColumn<String>(
    'building_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _powerMeta = const VerificationMeta('power');
  @override
  late final GeneratedColumn<int> power = GeneratedColumn<int>(
    'power',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    stationName,
    buildingType,
    buildingName,
    power,
    level,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'station_buildings';
  @override
  VerificationContext validateIntegrity(
    Insertable<StationBuilding> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    }
    if (data.containsKey('station_name')) {
      context.handle(
        _stationNameMeta,
        stationName.isAcceptableOrUnknown(
          data['station_name']!,
          _stationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stationNameMeta);
    }
    if (data.containsKey('building_type')) {
      context.handle(
        _buildingTypeMeta,
        buildingType.isAcceptableOrUnknown(
          data['building_type']!,
          _buildingTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_buildingTypeMeta);
    }
    if (data.containsKey('building_name')) {
      context.handle(
        _buildingNameMeta,
        buildingName.isAcceptableOrUnknown(
          data['building_name']!,
          _buildingNameMeta,
        ),
      );
    }
    if (data.containsKey('power')) {
      context.handle(
        _powerMeta,
        power.isAcceptableOrUnknown(data['power']!, _powerMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StationBuilding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StationBuilding(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      ),
      stationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}station_name'],
      )!,
      buildingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}building_type'],
      )!,
      buildingName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}building_name'],
      ),
      power: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}power'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
    );
  }

  @override
  $StationBuildingsTable createAlias(String alias) {
    return $StationBuildingsTable(attachedDatabase, alias);
  }
}

class StationBuilding extends DataClass implements Insertable<StationBuilding> {
  final int id;
  final String? corpName;
  final String stationName;
  final String buildingType;
  final String? buildingName;
  final int power;
  final int level;
  const StationBuilding({
    required this.id,
    this.corpName,
    required this.stationName,
    required this.buildingType,
    this.buildingName,
    required this.power,
    required this.level,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || corpName != null) {
      map['corp_name'] = Variable<String>(corpName);
    }
    map['station_name'] = Variable<String>(stationName);
    map['building_type'] = Variable<String>(buildingType);
    if (!nullToAbsent || buildingName != null) {
      map['building_name'] = Variable<String>(buildingName);
    }
    map['power'] = Variable<int>(power);
    map['level'] = Variable<int>(level);
    return map;
  }

  StationBuildingsCompanion toCompanion(bool nullToAbsent) {
    return StationBuildingsCompanion(
      id: Value(id),
      corpName: corpName == null && nullToAbsent
          ? const Value.absent()
          : Value(corpName),
      stationName: Value(stationName),
      buildingType: Value(buildingType),
      buildingName: buildingName == null && nullToAbsent
          ? const Value.absent()
          : Value(buildingName),
      power: Value(power),
      level: Value(level),
    );
  }

  factory StationBuilding.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StationBuilding(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String?>(json['corpName']),
      stationName: serializer.fromJson<String>(json['stationName']),
      buildingType: serializer.fromJson<String>(json['buildingType']),
      buildingName: serializer.fromJson<String?>(json['buildingName']),
      power: serializer.fromJson<int>(json['power']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String?>(corpName),
      'stationName': serializer.toJson<String>(stationName),
      'buildingType': serializer.toJson<String>(buildingType),
      'buildingName': serializer.toJson<String?>(buildingName),
      'power': serializer.toJson<int>(power),
      'level': serializer.toJson<int>(level),
    };
  }

  StationBuilding copyWith({
    int? id,
    Value<String?> corpName = const Value.absent(),
    String? stationName,
    String? buildingType,
    Value<String?> buildingName = const Value.absent(),
    int? power,
    int? level,
  }) => StationBuilding(
    id: id ?? this.id,
    corpName: corpName.present ? corpName.value : this.corpName,
    stationName: stationName ?? this.stationName,
    buildingType: buildingType ?? this.buildingType,
    buildingName: buildingName.present ? buildingName.value : this.buildingName,
    power: power ?? this.power,
    level: level ?? this.level,
  );
  StationBuilding copyWithCompanion(StationBuildingsCompanion data) {
    return StationBuilding(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      stationName: data.stationName.present
          ? data.stationName.value
          : this.stationName,
      buildingType: data.buildingType.present
          ? data.buildingType.value
          : this.buildingType,
      buildingName: data.buildingName.present
          ? data.buildingName.value
          : this.buildingName,
      power: data.power.present ? data.power.value : this.power,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StationBuilding(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('stationName: $stationName, ')
          ..write('buildingType: $buildingType, ')
          ..write('buildingName: $buildingName, ')
          ..write('power: $power, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    corpName,
    stationName,
    buildingType,
    buildingName,
    power,
    level,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StationBuilding &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.stationName == this.stationName &&
          other.buildingType == this.buildingType &&
          other.buildingName == this.buildingName &&
          other.power == this.power &&
          other.level == this.level);
}

class StationBuildingsCompanion extends UpdateCompanion<StationBuilding> {
  final Value<int> id;
  final Value<String?> corpName;
  final Value<String> stationName;
  final Value<String> buildingType;
  final Value<String?> buildingName;
  final Value<int> power;
  final Value<int> level;
  const StationBuildingsCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.stationName = const Value.absent(),
    this.buildingType = const Value.absent(),
    this.buildingName = const Value.absent(),
    this.power = const Value.absent(),
    this.level = const Value.absent(),
  });
  StationBuildingsCompanion.insert({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    required String stationName,
    required String buildingType,
    this.buildingName = const Value.absent(),
    this.power = const Value.absent(),
    this.level = const Value.absent(),
  }) : stationName = Value(stationName),
       buildingType = Value(buildingType);
  static Insertable<StationBuilding> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<String>? stationName,
    Expression<String>? buildingType,
    Expression<String>? buildingName,
    Expression<int>? power,
    Expression<int>? level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (stationName != null) 'station_name': stationName,
      if (buildingType != null) 'building_type': buildingType,
      if (buildingName != null) 'building_name': buildingName,
      if (power != null) 'power': power,
      if (level != null) 'level': level,
    });
  }

  StationBuildingsCompanion copyWith({
    Value<int>? id,
    Value<String?>? corpName,
    Value<String>? stationName,
    Value<String>? buildingType,
    Value<String?>? buildingName,
    Value<int>? power,
    Value<int>? level,
  }) {
    return StationBuildingsCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      stationName: stationName ?? this.stationName,
      buildingType: buildingType ?? this.buildingType,
      buildingName: buildingName ?? this.buildingName,
      power: power ?? this.power,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (stationName.present) {
      map['station_name'] = Variable<String>(stationName.value);
    }
    if (buildingType.present) {
      map['building_type'] = Variable<String>(buildingType.value);
    }
    if (buildingName.present) {
      map['building_name'] = Variable<String>(buildingName.value);
    }
    if (power.present) {
      map['power'] = Variable<int>(power.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StationBuildingsCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('stationName: $stationName, ')
          ..write('buildingType: $buildingType, ')
          ..write('buildingName: $buildingName, ')
          ..write('power: $power, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $CorpTurnActionsTable extends CorpTurnActions
    with TableInfo<$CorpTurnActionsTable, CorpTurnAction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CorpTurnActionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gameTurnMeta = const VerificationMeta(
    'gameTurn',
  );
  @override
  late final GeneratedColumn<int> gameTurn = GeneratedColumn<int>(
    'game_turn',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scanDoneMeta = const VerificationMeta(
    'scanDone',
  );
  @override
  late final GeneratedColumn<bool> scanDone = GeneratedColumn<bool>(
    'scan_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("scan_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _mineDoneMeta = const VerificationMeta(
    'mineDone',
  );
  @override
  late final GeneratedColumn<bool> mineDone = GeneratedColumn<bool>(
    'mine_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("mine_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _researchDoneMeta = const VerificationMeta(
    'researchDone',
  );
  @override
  late final GeneratedColumn<bool> researchDone = GeneratedColumn<bool>(
    'research_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("research_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cadetsDoneMeta = const VerificationMeta(
    'cadetsDone',
  );
  @override
  late final GeneratedColumn<bool> cadetsDone = GeneratedColumn<bool>(
    'cadets_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("cadets_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _expeditionDoneMeta = const VerificationMeta(
    'expeditionDone',
  );
  @override
  late final GeneratedColumn<bool> expeditionDone = GeneratedColumn<bool>(
    'expedition_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("expedition_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _marketDoneMeta = const VerificationMeta(
    'marketDone',
  );
  @override
  late final GeneratedColumn<bool> marketDone = GeneratedColumn<bool>(
    'market_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("market_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    gameTurn,
    scanDone,
    mineDone,
    researchDone,
    cadetsDone,
    expeditionDone,
    marketDone,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corp_turn_actions';
  @override
  VerificationContext validateIntegrity(
    Insertable<CorpTurnAction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('game_turn')) {
      context.handle(
        _gameTurnMeta,
        gameTurn.isAcceptableOrUnknown(data['game_turn']!, _gameTurnMeta),
      );
    } else if (isInserting) {
      context.missing(_gameTurnMeta);
    }
    if (data.containsKey('scan_done')) {
      context.handle(
        _scanDoneMeta,
        scanDone.isAcceptableOrUnknown(data['scan_done']!, _scanDoneMeta),
      );
    }
    if (data.containsKey('mine_done')) {
      context.handle(
        _mineDoneMeta,
        mineDone.isAcceptableOrUnknown(data['mine_done']!, _mineDoneMeta),
      );
    }
    if (data.containsKey('research_done')) {
      context.handle(
        _researchDoneMeta,
        researchDone.isAcceptableOrUnknown(
          data['research_done']!,
          _researchDoneMeta,
        ),
      );
    }
    if (data.containsKey('cadets_done')) {
      context.handle(
        _cadetsDoneMeta,
        cadetsDone.isAcceptableOrUnknown(data['cadets_done']!, _cadetsDoneMeta),
      );
    }
    if (data.containsKey('expedition_done')) {
      context.handle(
        _expeditionDoneMeta,
        expeditionDone.isAcceptableOrUnknown(
          data['expedition_done']!,
          _expeditionDoneMeta,
        ),
      );
    }
    if (data.containsKey('market_done')) {
      context.handle(
        _marketDoneMeta,
        marketDone.isAcceptableOrUnknown(data['market_done']!, _marketDoneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CorpTurnAction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CorpTurnAction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      gameTurn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_turn'],
      )!,
      scanDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}scan_done'],
      )!,
      mineDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}mine_done'],
      )!,
      researchDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}research_done'],
      )!,
      cadetsDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}cadets_done'],
      )!,
      expeditionDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}expedition_done'],
      )!,
      marketDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}market_done'],
      )!,
    );
  }

  @override
  $CorpTurnActionsTable createAlias(String alias) {
    return $CorpTurnActionsTable(attachedDatabase, alias);
  }
}

class CorpTurnAction extends DataClass implements Insertable<CorpTurnAction> {
  final int id;
  final String corpName;
  final int gameTurn;
  final bool scanDone;
  final bool mineDone;
  final bool researchDone;
  final bool cadetsDone;
  final bool expeditionDone;
  final bool marketDone;
  const CorpTurnAction({
    required this.id,
    required this.corpName,
    required this.gameTurn,
    required this.scanDone,
    required this.mineDone,
    required this.researchDone,
    required this.cadetsDone,
    required this.expeditionDone,
    required this.marketDone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['corp_name'] = Variable<String>(corpName);
    map['game_turn'] = Variable<int>(gameTurn);
    map['scan_done'] = Variable<bool>(scanDone);
    map['mine_done'] = Variable<bool>(mineDone);
    map['research_done'] = Variable<bool>(researchDone);
    map['cadets_done'] = Variable<bool>(cadetsDone);
    map['expedition_done'] = Variable<bool>(expeditionDone);
    map['market_done'] = Variable<bool>(marketDone);
    return map;
  }

  CorpTurnActionsCompanion toCompanion(bool nullToAbsent) {
    return CorpTurnActionsCompanion(
      id: Value(id),
      corpName: Value(corpName),
      gameTurn: Value(gameTurn),
      scanDone: Value(scanDone),
      mineDone: Value(mineDone),
      researchDone: Value(researchDone),
      cadetsDone: Value(cadetsDone),
      expeditionDone: Value(expeditionDone),
      marketDone: Value(marketDone),
    );
  }

  factory CorpTurnAction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CorpTurnAction(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String>(json['corpName']),
      gameTurn: serializer.fromJson<int>(json['gameTurn']),
      scanDone: serializer.fromJson<bool>(json['scanDone']),
      mineDone: serializer.fromJson<bool>(json['mineDone']),
      researchDone: serializer.fromJson<bool>(json['researchDone']),
      cadetsDone: serializer.fromJson<bool>(json['cadetsDone']),
      expeditionDone: serializer.fromJson<bool>(json['expeditionDone']),
      marketDone: serializer.fromJson<bool>(json['marketDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String>(corpName),
      'gameTurn': serializer.toJson<int>(gameTurn),
      'scanDone': serializer.toJson<bool>(scanDone),
      'mineDone': serializer.toJson<bool>(mineDone),
      'researchDone': serializer.toJson<bool>(researchDone),
      'cadetsDone': serializer.toJson<bool>(cadetsDone),
      'expeditionDone': serializer.toJson<bool>(expeditionDone),
      'marketDone': serializer.toJson<bool>(marketDone),
    };
  }

  CorpTurnAction copyWith({
    int? id,
    String? corpName,
    int? gameTurn,
    bool? scanDone,
    bool? mineDone,
    bool? researchDone,
    bool? cadetsDone,
    bool? expeditionDone,
    bool? marketDone,
  }) => CorpTurnAction(
    id: id ?? this.id,
    corpName: corpName ?? this.corpName,
    gameTurn: gameTurn ?? this.gameTurn,
    scanDone: scanDone ?? this.scanDone,
    mineDone: mineDone ?? this.mineDone,
    researchDone: researchDone ?? this.researchDone,
    cadetsDone: cadetsDone ?? this.cadetsDone,
    expeditionDone: expeditionDone ?? this.expeditionDone,
    marketDone: marketDone ?? this.marketDone,
  );
  CorpTurnAction copyWithCompanion(CorpTurnActionsCompanion data) {
    return CorpTurnAction(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      gameTurn: data.gameTurn.present ? data.gameTurn.value : this.gameTurn,
      scanDone: data.scanDone.present ? data.scanDone.value : this.scanDone,
      mineDone: data.mineDone.present ? data.mineDone.value : this.mineDone,
      researchDone: data.researchDone.present
          ? data.researchDone.value
          : this.researchDone,
      cadetsDone: data.cadetsDone.present
          ? data.cadetsDone.value
          : this.cadetsDone,
      expeditionDone: data.expeditionDone.present
          ? data.expeditionDone.value
          : this.expeditionDone,
      marketDone: data.marketDone.present
          ? data.marketDone.value
          : this.marketDone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CorpTurnAction(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('scanDone: $scanDone, ')
          ..write('mineDone: $mineDone, ')
          ..write('researchDone: $researchDone, ')
          ..write('cadetsDone: $cadetsDone, ')
          ..write('expeditionDone: $expeditionDone, ')
          ..write('marketDone: $marketDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    corpName,
    gameTurn,
    scanDone,
    mineDone,
    researchDone,
    cadetsDone,
    expeditionDone,
    marketDone,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CorpTurnAction &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.gameTurn == this.gameTurn &&
          other.scanDone == this.scanDone &&
          other.mineDone == this.mineDone &&
          other.researchDone == this.researchDone &&
          other.cadetsDone == this.cadetsDone &&
          other.expeditionDone == this.expeditionDone &&
          other.marketDone == this.marketDone);
}

class CorpTurnActionsCompanion extends UpdateCompanion<CorpTurnAction> {
  final Value<int> id;
  final Value<String> corpName;
  final Value<int> gameTurn;
  final Value<bool> scanDone;
  final Value<bool> mineDone;
  final Value<bool> researchDone;
  final Value<bool> cadetsDone;
  final Value<bool> expeditionDone;
  final Value<bool> marketDone;
  const CorpTurnActionsCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.scanDone = const Value.absent(),
    this.mineDone = const Value.absent(),
    this.researchDone = const Value.absent(),
    this.cadetsDone = const Value.absent(),
    this.expeditionDone = const Value.absent(),
    this.marketDone = const Value.absent(),
  });
  CorpTurnActionsCompanion.insert({
    this.id = const Value.absent(),
    required String corpName,
    required int gameTurn,
    this.scanDone = const Value.absent(),
    this.mineDone = const Value.absent(),
    this.researchDone = const Value.absent(),
    this.cadetsDone = const Value.absent(),
    this.expeditionDone = const Value.absent(),
    this.marketDone = const Value.absent(),
  }) : corpName = Value(corpName),
       gameTurn = Value(gameTurn);
  static Insertable<CorpTurnAction> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<int>? gameTurn,
    Expression<bool>? scanDone,
    Expression<bool>? mineDone,
    Expression<bool>? researchDone,
    Expression<bool>? cadetsDone,
    Expression<bool>? expeditionDone,
    Expression<bool>? marketDone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (gameTurn != null) 'game_turn': gameTurn,
      if (scanDone != null) 'scan_done': scanDone,
      if (mineDone != null) 'mine_done': mineDone,
      if (researchDone != null) 'research_done': researchDone,
      if (cadetsDone != null) 'cadets_done': cadetsDone,
      if (expeditionDone != null) 'expedition_done': expeditionDone,
      if (marketDone != null) 'market_done': marketDone,
    });
  }

  CorpTurnActionsCompanion copyWith({
    Value<int>? id,
    Value<String>? corpName,
    Value<int>? gameTurn,
    Value<bool>? scanDone,
    Value<bool>? mineDone,
    Value<bool>? researchDone,
    Value<bool>? cadetsDone,
    Value<bool>? expeditionDone,
    Value<bool>? marketDone,
  }) {
    return CorpTurnActionsCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      gameTurn: gameTurn ?? this.gameTurn,
      scanDone: scanDone ?? this.scanDone,
      mineDone: mineDone ?? this.mineDone,
      researchDone: researchDone ?? this.researchDone,
      cadetsDone: cadetsDone ?? this.cadetsDone,
      expeditionDone: expeditionDone ?? this.expeditionDone,
      marketDone: marketDone ?? this.marketDone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (gameTurn.present) {
      map['game_turn'] = Variable<int>(gameTurn.value);
    }
    if (scanDone.present) {
      map['scan_done'] = Variable<bool>(scanDone.value);
    }
    if (mineDone.present) {
      map['mine_done'] = Variable<bool>(mineDone.value);
    }
    if (researchDone.present) {
      map['research_done'] = Variable<bool>(researchDone.value);
    }
    if (cadetsDone.present) {
      map['cadets_done'] = Variable<bool>(cadetsDone.value);
    }
    if (expeditionDone.present) {
      map['expedition_done'] = Variable<bool>(expeditionDone.value);
    }
    if (marketDone.present) {
      map['market_done'] = Variable<bool>(marketDone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorpTurnActionsCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('scanDone: $scanDone, ')
          ..write('mineDone: $mineDone, ')
          ..write('researchDone: $researchDone, ')
          ..write('cadetsDone: $cadetsDone, ')
          ..write('expeditionDone: $expeditionDone, ')
          ..write('marketDone: $marketDone')
          ..write(')'))
        .toString();
  }
}

class $CorpFinanceLedgerTable extends CorpFinanceLedger
    with TableInfo<$CorpFinanceLedgerTable, CorpFinanceLedgerEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CorpFinanceLedgerTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _corpNameMeta = const VerificationMeta(
    'corpName',
  );
  @override
  late final GeneratedColumn<String> corpName = GeneratedColumn<String>(
    'corp_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 65,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gameTurnMeta = const VerificationMeta(
    'gameTurn',
  );
  @override
  late final GeneratedColumn<int> gameTurn = GeneratedColumn<int>(
    'game_turn',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _netWorthMeta = const VerificationMeta(
    'netWorth',
  );
  @override
  late final GeneratedColumn<int> netWorth = GeneratedColumn<int>(
    'net_worth',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _solarsMeta = const VerificationMeta('solars');
  @override
  late final GeneratedColumn<int> solars = GeneratedColumn<int>(
    'solars',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fleetValMeta = const VerificationMeta(
    'fleetVal',
  );
  @override
  late final GeneratedColumn<int> fleetVal = GeneratedColumn<int>(
    'fleet_val',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _materialsValMeta = const VerificationMeta(
    'materialsVal',
  );
  @override
  late final GeneratedColumn<int> materialsVal = GeneratedColumn<int>(
    'materials_val',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _revenueMeta = const VerificationMeta(
    'revenue',
  );
  @override
  late final GeneratedColumn<int> revenue = GeneratedColumn<int>(
    'revenue',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _expensesMeta = const VerificationMeta(
    'expenses',
  );
  @override
  late final GeneratedColumn<int> expenses = GeneratedColumn<int>(
    'expenses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    corpName,
    gameTurn,
    netWorth,
    solars,
    fleetVal,
    materialsVal,
    revenue,
    expenses,
    notes,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corp_finance_ledger';
  @override
  VerificationContext validateIntegrity(
    Insertable<CorpFinanceLedgerEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('corp_name')) {
      context.handle(
        _corpNameMeta,
        corpName.isAcceptableOrUnknown(data['corp_name']!, _corpNameMeta),
      );
    } else if (isInserting) {
      context.missing(_corpNameMeta);
    }
    if (data.containsKey('game_turn')) {
      context.handle(
        _gameTurnMeta,
        gameTurn.isAcceptableOrUnknown(data['game_turn']!, _gameTurnMeta),
      );
    } else if (isInserting) {
      context.missing(_gameTurnMeta);
    }
    if (data.containsKey('net_worth')) {
      context.handle(
        _netWorthMeta,
        netWorth.isAcceptableOrUnknown(data['net_worth']!, _netWorthMeta),
      );
    }
    if (data.containsKey('solars')) {
      context.handle(
        _solarsMeta,
        solars.isAcceptableOrUnknown(data['solars']!, _solarsMeta),
      );
    }
    if (data.containsKey('fleet_val')) {
      context.handle(
        _fleetValMeta,
        fleetVal.isAcceptableOrUnknown(data['fleet_val']!, _fleetValMeta),
      );
    }
    if (data.containsKey('materials_val')) {
      context.handle(
        _materialsValMeta,
        materialsVal.isAcceptableOrUnknown(
          data['materials_val']!,
          _materialsValMeta,
        ),
      );
    }
    if (data.containsKey('revenue')) {
      context.handle(
        _revenueMeta,
        revenue.isAcceptableOrUnknown(data['revenue']!, _revenueMeta),
      );
    }
    if (data.containsKey('expenses')) {
      context.handle(
        _expensesMeta,
        expenses.isAcceptableOrUnknown(data['expenses']!, _expensesMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CorpFinanceLedgerEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CorpFinanceLedgerEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      corpName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corp_name'],
      )!,
      gameTurn: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_turn'],
      )!,
      netWorth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}net_worth'],
      )!,
      solars: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}solars'],
      )!,
      fleetVal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fleet_val'],
      )!,
      materialsVal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}materials_val'],
      )!,
      revenue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revenue'],
      )!,
      expenses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expenses'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $CorpFinanceLedgerTable createAlias(String alias) {
    return $CorpFinanceLedgerTable(attachedDatabase, alias);
  }
}

class CorpFinanceLedgerEntry extends DataClass
    implements Insertable<CorpFinanceLedgerEntry> {
  final int id;
  final String corpName;
  final int gameTurn;
  final int netWorth;
  final int solars;
  final int fleetVal;
  final int materialsVal;
  final int revenue;
  final int expenses;
  final String? notes;
  final DateTime recordedAt;
  const CorpFinanceLedgerEntry({
    required this.id,
    required this.corpName,
    required this.gameTurn,
    required this.netWorth,
    required this.solars,
    required this.fleetVal,
    required this.materialsVal,
    required this.revenue,
    required this.expenses,
    this.notes,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['corp_name'] = Variable<String>(corpName);
    map['game_turn'] = Variable<int>(gameTurn);
    map['net_worth'] = Variable<int>(netWorth);
    map['solars'] = Variable<int>(solars);
    map['fleet_val'] = Variable<int>(fleetVal);
    map['materials_val'] = Variable<int>(materialsVal);
    map['revenue'] = Variable<int>(revenue);
    map['expenses'] = Variable<int>(expenses);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  CorpFinanceLedgerCompanion toCompanion(bool nullToAbsent) {
    return CorpFinanceLedgerCompanion(
      id: Value(id),
      corpName: Value(corpName),
      gameTurn: Value(gameTurn),
      netWorth: Value(netWorth),
      solars: Value(solars),
      fleetVal: Value(fleetVal),
      materialsVal: Value(materialsVal),
      revenue: Value(revenue),
      expenses: Value(expenses),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      recordedAt: Value(recordedAt),
    );
  }

  factory CorpFinanceLedgerEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CorpFinanceLedgerEntry(
      id: serializer.fromJson<int>(json['id']),
      corpName: serializer.fromJson<String>(json['corpName']),
      gameTurn: serializer.fromJson<int>(json['gameTurn']),
      netWorth: serializer.fromJson<int>(json['netWorth']),
      solars: serializer.fromJson<int>(json['solars']),
      fleetVal: serializer.fromJson<int>(json['fleetVal']),
      materialsVal: serializer.fromJson<int>(json['materialsVal']),
      revenue: serializer.fromJson<int>(json['revenue']),
      expenses: serializer.fromJson<int>(json['expenses']),
      notes: serializer.fromJson<String?>(json['notes']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'corpName': serializer.toJson<String>(corpName),
      'gameTurn': serializer.toJson<int>(gameTurn),
      'netWorth': serializer.toJson<int>(netWorth),
      'solars': serializer.toJson<int>(solars),
      'fleetVal': serializer.toJson<int>(fleetVal),
      'materialsVal': serializer.toJson<int>(materialsVal),
      'revenue': serializer.toJson<int>(revenue),
      'expenses': serializer.toJson<int>(expenses),
      'notes': serializer.toJson<String?>(notes),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  CorpFinanceLedgerEntry copyWith({
    int? id,
    String? corpName,
    int? gameTurn,
    int? netWorth,
    int? solars,
    int? fleetVal,
    int? materialsVal,
    int? revenue,
    int? expenses,
    Value<String?> notes = const Value.absent(),
    DateTime? recordedAt,
  }) => CorpFinanceLedgerEntry(
    id: id ?? this.id,
    corpName: corpName ?? this.corpName,
    gameTurn: gameTurn ?? this.gameTurn,
    netWorth: netWorth ?? this.netWorth,
    solars: solars ?? this.solars,
    fleetVal: fleetVal ?? this.fleetVal,
    materialsVal: materialsVal ?? this.materialsVal,
    revenue: revenue ?? this.revenue,
    expenses: expenses ?? this.expenses,
    notes: notes.present ? notes.value : this.notes,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  CorpFinanceLedgerEntry copyWithCompanion(CorpFinanceLedgerCompanion data) {
    return CorpFinanceLedgerEntry(
      id: data.id.present ? data.id.value : this.id,
      corpName: data.corpName.present ? data.corpName.value : this.corpName,
      gameTurn: data.gameTurn.present ? data.gameTurn.value : this.gameTurn,
      netWorth: data.netWorth.present ? data.netWorth.value : this.netWorth,
      solars: data.solars.present ? data.solars.value : this.solars,
      fleetVal: data.fleetVal.present ? data.fleetVal.value : this.fleetVal,
      materialsVal: data.materialsVal.present
          ? data.materialsVal.value
          : this.materialsVal,
      revenue: data.revenue.present ? data.revenue.value : this.revenue,
      expenses: data.expenses.present ? data.expenses.value : this.expenses,
      notes: data.notes.present ? data.notes.value : this.notes,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CorpFinanceLedgerEntry(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('netWorth: $netWorth, ')
          ..write('solars: $solars, ')
          ..write('fleetVal: $fleetVal, ')
          ..write('materialsVal: $materialsVal, ')
          ..write('revenue: $revenue, ')
          ..write('expenses: $expenses, ')
          ..write('notes: $notes, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    corpName,
    gameTurn,
    netWorth,
    solars,
    fleetVal,
    materialsVal,
    revenue,
    expenses,
    notes,
    recordedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CorpFinanceLedgerEntry &&
          other.id == this.id &&
          other.corpName == this.corpName &&
          other.gameTurn == this.gameTurn &&
          other.netWorth == this.netWorth &&
          other.solars == this.solars &&
          other.fleetVal == this.fleetVal &&
          other.materialsVal == this.materialsVal &&
          other.revenue == this.revenue &&
          other.expenses == this.expenses &&
          other.notes == this.notes &&
          other.recordedAt == this.recordedAt);
}

class CorpFinanceLedgerCompanion
    extends UpdateCompanion<CorpFinanceLedgerEntry> {
  final Value<int> id;
  final Value<String> corpName;
  final Value<int> gameTurn;
  final Value<int> netWorth;
  final Value<int> solars;
  final Value<int> fleetVal;
  final Value<int> materialsVal;
  final Value<int> revenue;
  final Value<int> expenses;
  final Value<String?> notes;
  final Value<DateTime> recordedAt;
  const CorpFinanceLedgerCompanion({
    this.id = const Value.absent(),
    this.corpName = const Value.absent(),
    this.gameTurn = const Value.absent(),
    this.netWorth = const Value.absent(),
    this.solars = const Value.absent(),
    this.fleetVal = const Value.absent(),
    this.materialsVal = const Value.absent(),
    this.revenue = const Value.absent(),
    this.expenses = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  CorpFinanceLedgerCompanion.insert({
    this.id = const Value.absent(),
    required String corpName,
    required int gameTurn,
    this.netWorth = const Value.absent(),
    this.solars = const Value.absent(),
    this.fleetVal = const Value.absent(),
    this.materialsVal = const Value.absent(),
    this.revenue = const Value.absent(),
    this.expenses = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedAt = const Value.absent(),
  }) : corpName = Value(corpName),
       gameTurn = Value(gameTurn);
  static Insertable<CorpFinanceLedgerEntry> custom({
    Expression<int>? id,
    Expression<String>? corpName,
    Expression<int>? gameTurn,
    Expression<int>? netWorth,
    Expression<int>? solars,
    Expression<int>? fleetVal,
    Expression<int>? materialsVal,
    Expression<int>? revenue,
    Expression<int>? expenses,
    Expression<String>? notes,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (corpName != null) 'corp_name': corpName,
      if (gameTurn != null) 'game_turn': gameTurn,
      if (netWorth != null) 'net_worth': netWorth,
      if (solars != null) 'solars': solars,
      if (fleetVal != null) 'fleet_val': fleetVal,
      if (materialsVal != null) 'materials_val': materialsVal,
      if (revenue != null) 'revenue': revenue,
      if (expenses != null) 'expenses': expenses,
      if (notes != null) 'notes': notes,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  CorpFinanceLedgerCompanion copyWith({
    Value<int>? id,
    Value<String>? corpName,
    Value<int>? gameTurn,
    Value<int>? netWorth,
    Value<int>? solars,
    Value<int>? fleetVal,
    Value<int>? materialsVal,
    Value<int>? revenue,
    Value<int>? expenses,
    Value<String?>? notes,
    Value<DateTime>? recordedAt,
  }) {
    return CorpFinanceLedgerCompanion(
      id: id ?? this.id,
      corpName: corpName ?? this.corpName,
      gameTurn: gameTurn ?? this.gameTurn,
      netWorth: netWorth ?? this.netWorth,
      solars: solars ?? this.solars,
      fleetVal: fleetVal ?? this.fleetVal,
      materialsVal: materialsVal ?? this.materialsVal,
      revenue: revenue ?? this.revenue,
      expenses: expenses ?? this.expenses,
      notes: notes ?? this.notes,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (corpName.present) {
      map['corp_name'] = Variable<String>(corpName.value);
    }
    if (gameTurn.present) {
      map['game_turn'] = Variable<int>(gameTurn.value);
    }
    if (netWorth.present) {
      map['net_worth'] = Variable<int>(netWorth.value);
    }
    if (solars.present) {
      map['solars'] = Variable<int>(solars.value);
    }
    if (fleetVal.present) {
      map['fleet_val'] = Variable<int>(fleetVal.value);
    }
    if (materialsVal.present) {
      map['materials_val'] = Variable<int>(materialsVal.value);
    }
    if (revenue.present) {
      map['revenue'] = Variable<int>(revenue.value);
    }
    if (expenses.present) {
      map['expenses'] = Variable<int>(expenses.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorpFinanceLedgerCompanion(')
          ..write('id: $id, ')
          ..write('corpName: $corpName, ')
          ..write('gameTurn: $gameTurn, ')
          ..write('netWorth: $netWorth, ')
          ..write('solars: $solars, ')
          ..write('fleetVal: $fleetVal, ')
          ..write('materialsVal: $materialsVal, ')
          ..write('revenue: $revenue, ')
          ..write('expenses: $expenses, ')
          ..write('notes: $notes, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AsteroidsTable asteroids = $AsteroidsTable(this);
  late final $AsteroidsScannedTable asteroidsScanned = $AsteroidsScannedTable(
    this,
  );
  late final $TempAsteroidsScannedTable tempAsteroidsScanned =
      $TempAsteroidsScannedTable(this);
  late final $CadetsTable cadets = $CadetsTable(this);
  late final $CadetsProgressTable cadetsProgress = $CadetsProgressTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $CombatStatsTable combatStats = $CombatStatsTable(this);
  late final $CorpInventoryTable corpInventory = $CorpInventoryTable(this);
  late final $CorpResearchTable corpResearch = $CorpResearchTable(this);
  late final $CrewTable crew = $CrewTable(this);
  late final $CrewGenerateTable crewGenerate = $CrewGenerateTable(this);
  late final $FleetTable fleet = $FleetTable(this);
  late final $GameDataTable gameData = $GameDataTable(this);
  late final $MembersTable members = $MembersTable(this);
  late final $MissionHolderTable missionHolder = $MissionHolderTable(this);
  late final $MissionInterruptorsTable missionInterruptors =
      $MissionInterruptorsTable(this);
  late final $MissionTextGeneratorTable missionTextGenerator =
      $MissionTextGeneratorTable(this);
  late final $RollsTable rolls = $RollsTable(this);
  late final $SalvageTable salvage = $SalvageTable(this);
  late final $ScavengeListTable scavengeList = $ScavengeListTable(this);
  late final $ShipModelsTable shipModels = $ShipModelsTable(this);
  late final $ShipModsTable shipMods = $ShipModsTable(this);
  late final $ShipModsAvailableTable shipModsAvailable =
      $ShipModsAvailableTable(this);
  late final $ShipPersonalitiesTable shipPersonalities =
      $ShipPersonalitiesTable(this);
  late final $StationBuildingsTable stationBuildings = $StationBuildingsTable(
    this,
  );
  late final $CorpTurnActionsTable corpTurnActions = $CorpTurnActionsTable(
    this,
  );
  late final $CorpFinanceLedgerTable corpFinanceLedger =
      $CorpFinanceLedgerTable(this);
  late final GameDataDao gameDataDao = GameDataDao(this as AppDatabase);
  late final CorpDao corpDao = CorpDao(this as AppDatabase);
  late final InventoryDao inventoryDao = InventoryDao(this as AppDatabase);
  late final ResearchDao researchDao = ResearchDao(this as AppDatabase);
  late final StationDao stationDao = StationDao(this as AppDatabase);
  late final FleetDao fleetDao = FleetDao(this as AppDatabase);
  late final CrewDao crewDao = CrewDao(this as AppDatabase);
  late final AsteroidDao asteroidDao = AsteroidDao(this as AppDatabase);
  late final MissionDao missionDao = MissionDao(this as AppDatabase);
  late final LedgerDao ledgerDao = LedgerDao(this as AppDatabase);
  late final CatalogDao catalogDao = CatalogDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    asteroids,
    asteroidsScanned,
    tempAsteroidsScanned,
    cadets,
    cadetsProgress,
    characters,
    combatStats,
    corpInventory,
    corpResearch,
    crew,
    crewGenerate,
    fleet,
    gameData,
    members,
    missionHolder,
    missionInterruptors,
    missionTextGenerator,
    rolls,
    salvage,
    scavengeList,
    shipModels,
    shipMods,
    shipModsAvailable,
    shipPersonalities,
    stationBuildings,
    corpTurnActions,
    corpFinanceLedger,
  ];
}

typedef $$AsteroidsTableCreateCompanionBuilder =
    AsteroidsCompanion Function({
      Value<int> id,
      required String asteroidName,
      Value<int> m3,
      Value<int> surfaceM,
      Value<int> zeroGM,
      Value<int> conductiveM,
      Value<int> lifeSuppG,
      Value<int> fuelG,
      Value<int> ove,
      Value<int> waterIce,
    });
typedef $$AsteroidsTableUpdateCompanionBuilder =
    AsteroidsCompanion Function({
      Value<int> id,
      Value<String> asteroidName,
      Value<int> m3,
      Value<int> surfaceM,
      Value<int> zeroGM,
      Value<int> conductiveM,
      Value<int> lifeSuppG,
      Value<int> fuelG,
      Value<int> ove,
      Value<int> waterIce,
    });

class $$AsteroidsTableFilterComposer
    extends Composer<_$AppDatabase, $AsteroidsTable> {
  $$AsteroidsTableFilterComposer({
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

  ColumnFilters<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get m3 => $composableBuilder(
    column: $table.m3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surfaceM => $composableBuilder(
    column: $table.surfaceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get zeroGM => $composableBuilder(
    column: $table.zeroGM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get conductiveM => $composableBuilder(
    column: $table.conductiveM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lifeSuppG => $composableBuilder(
    column: $table.lifeSuppG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fuelG => $composableBuilder(
    column: $table.fuelG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ove => $composableBuilder(
    column: $table.ove,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waterIce => $composableBuilder(
    column: $table.waterIce,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AsteroidsTableOrderingComposer
    extends Composer<_$AppDatabase, $AsteroidsTable> {
  $$AsteroidsTableOrderingComposer({
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

  ColumnOrderings<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get m3 => $composableBuilder(
    column: $table.m3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surfaceM => $composableBuilder(
    column: $table.surfaceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get zeroGM => $composableBuilder(
    column: $table.zeroGM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get conductiveM => $composableBuilder(
    column: $table.conductiveM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lifeSuppG => $composableBuilder(
    column: $table.lifeSuppG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fuelG => $composableBuilder(
    column: $table.fuelG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ove => $composableBuilder(
    column: $table.ove,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waterIce => $composableBuilder(
    column: $table.waterIce,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AsteroidsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AsteroidsTable> {
  $$AsteroidsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get m3 =>
      $composableBuilder(column: $table.m3, builder: (column) => column);

  GeneratedColumn<int> get surfaceM =>
      $composableBuilder(column: $table.surfaceM, builder: (column) => column);

  GeneratedColumn<int> get zeroGM =>
      $composableBuilder(column: $table.zeroGM, builder: (column) => column);

  GeneratedColumn<int> get conductiveM => $composableBuilder(
    column: $table.conductiveM,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lifeSuppG =>
      $composableBuilder(column: $table.lifeSuppG, builder: (column) => column);

  GeneratedColumn<int> get fuelG =>
      $composableBuilder(column: $table.fuelG, builder: (column) => column);

  GeneratedColumn<int> get ove =>
      $composableBuilder(column: $table.ove, builder: (column) => column);

  GeneratedColumn<int> get waterIce =>
      $composableBuilder(column: $table.waterIce, builder: (column) => column);
}

class $$AsteroidsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AsteroidsTable,
          Asteroid,
          $$AsteroidsTableFilterComposer,
          $$AsteroidsTableOrderingComposer,
          $$AsteroidsTableAnnotationComposer,
          $$AsteroidsTableCreateCompanionBuilder,
          $$AsteroidsTableUpdateCompanionBuilder,
          (Asteroid, BaseReferences<_$AppDatabase, $AsteroidsTable, Asteroid>),
          Asteroid,
          PrefetchHooks Function()
        > {
  $$AsteroidsTableTableManager(_$AppDatabase db, $AsteroidsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AsteroidsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AsteroidsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AsteroidsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> asteroidName = const Value.absent(),
                Value<int> m3 = const Value.absent(),
                Value<int> surfaceM = const Value.absent(),
                Value<int> zeroGM = const Value.absent(),
                Value<int> conductiveM = const Value.absent(),
                Value<int> lifeSuppG = const Value.absent(),
                Value<int> fuelG = const Value.absent(),
                Value<int> ove = const Value.absent(),
                Value<int> waterIce = const Value.absent(),
              }) => AsteroidsCompanion(
                id: id,
                asteroidName: asteroidName,
                m3: m3,
                surfaceM: surfaceM,
                zeroGM: zeroGM,
                conductiveM: conductiveM,
                lifeSuppG: lifeSuppG,
                fuelG: fuelG,
                ove: ove,
                waterIce: waterIce,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String asteroidName,
                Value<int> m3 = const Value.absent(),
                Value<int> surfaceM = const Value.absent(),
                Value<int> zeroGM = const Value.absent(),
                Value<int> conductiveM = const Value.absent(),
                Value<int> lifeSuppG = const Value.absent(),
                Value<int> fuelG = const Value.absent(),
                Value<int> ove = const Value.absent(),
                Value<int> waterIce = const Value.absent(),
              }) => AsteroidsCompanion.insert(
                id: id,
                asteroidName: asteroidName,
                m3: m3,
                surfaceM: surfaceM,
                zeroGM: zeroGM,
                conductiveM: conductiveM,
                lifeSuppG: lifeSuppG,
                fuelG: fuelG,
                ove: ove,
                waterIce: waterIce,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AsteroidsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AsteroidsTable,
      Asteroid,
      $$AsteroidsTableFilterComposer,
      $$AsteroidsTableOrderingComposer,
      $$AsteroidsTableAnnotationComposer,
      $$AsteroidsTableCreateCompanionBuilder,
      $$AsteroidsTableUpdateCompanionBuilder,
      (Asteroid, BaseReferences<_$AppDatabase, $AsteroidsTable, Asteroid>),
      Asteroid,
      PrefetchHooks Function()
    >;
typedef $$AsteroidsScannedTableCreateCompanionBuilder =
    AsteroidsScannedCompanion Function({
      Value<int> id,
      required int gameTurn,
      required String corpName,
      required String asteroidName,
    });
typedef $$AsteroidsScannedTableUpdateCompanionBuilder =
    AsteroidsScannedCompanion Function({
      Value<int> id,
      Value<int> gameTurn,
      Value<String> corpName,
      Value<String> asteroidName,
    });

class $$AsteroidsScannedTableFilterComposer
    extends Composer<_$AppDatabase, $AsteroidsScannedTable> {
  $$AsteroidsScannedTableFilterComposer({
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

  ColumnFilters<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AsteroidsScannedTableOrderingComposer
    extends Composer<_$AppDatabase, $AsteroidsScannedTable> {
  $$AsteroidsScannedTableOrderingComposer({
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

  ColumnOrderings<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AsteroidsScannedTableAnnotationComposer
    extends Composer<_$AppDatabase, $AsteroidsScannedTable> {
  $$AsteroidsScannedTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get gameTurn =>
      $composableBuilder(column: $table.gameTurn, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => column,
  );
}

class $$AsteroidsScannedTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AsteroidsScannedTable,
          AsteroidScanned,
          $$AsteroidsScannedTableFilterComposer,
          $$AsteroidsScannedTableOrderingComposer,
          $$AsteroidsScannedTableAnnotationComposer,
          $$AsteroidsScannedTableCreateCompanionBuilder,
          $$AsteroidsScannedTableUpdateCompanionBuilder,
          (
            AsteroidScanned,
            BaseReferences<
              _$AppDatabase,
              $AsteroidsScannedTable,
              AsteroidScanned
            >,
          ),
          AsteroidScanned,
          PrefetchHooks Function()
        > {
  $$AsteroidsScannedTableTableManager(
    _$AppDatabase db,
    $AsteroidsScannedTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AsteroidsScannedTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AsteroidsScannedTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AsteroidsScannedTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameTurn = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<String> asteroidName = const Value.absent(),
              }) => AsteroidsScannedCompanion(
                id: id,
                gameTurn: gameTurn,
                corpName: corpName,
                asteroidName: asteroidName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameTurn,
                required String corpName,
                required String asteroidName,
              }) => AsteroidsScannedCompanion.insert(
                id: id,
                gameTurn: gameTurn,
                corpName: corpName,
                asteroidName: asteroidName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AsteroidsScannedTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AsteroidsScannedTable,
      AsteroidScanned,
      $$AsteroidsScannedTableFilterComposer,
      $$AsteroidsScannedTableOrderingComposer,
      $$AsteroidsScannedTableAnnotationComposer,
      $$AsteroidsScannedTableCreateCompanionBuilder,
      $$AsteroidsScannedTableUpdateCompanionBuilder,
      (
        AsteroidScanned,
        BaseReferences<_$AppDatabase, $AsteroidsScannedTable, AsteroidScanned>,
      ),
      AsteroidScanned,
      PrefetchHooks Function()
    >;
typedef $$TempAsteroidsScannedTableCreateCompanionBuilder =
    TempAsteroidsScannedCompanion Function({
      Value<int> id,
      required int gameTurn,
      required String corpName,
      required String asteroidName,
    });
typedef $$TempAsteroidsScannedTableUpdateCompanionBuilder =
    TempAsteroidsScannedCompanion Function({
      Value<int> id,
      Value<int> gameTurn,
      Value<String> corpName,
      Value<String> asteroidName,
    });

class $$TempAsteroidsScannedTableFilterComposer
    extends Composer<_$AppDatabase, $TempAsteroidsScannedTable> {
  $$TempAsteroidsScannedTableFilterComposer({
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

  ColumnFilters<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TempAsteroidsScannedTableOrderingComposer
    extends Composer<_$AppDatabase, $TempAsteroidsScannedTable> {
  $$TempAsteroidsScannedTableOrderingComposer({
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

  ColumnOrderings<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TempAsteroidsScannedTableAnnotationComposer
    extends Composer<_$AppDatabase, $TempAsteroidsScannedTable> {
  $$TempAsteroidsScannedTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get gameTurn =>
      $composableBuilder(column: $table.gameTurn, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get asteroidName => $composableBuilder(
    column: $table.asteroidName,
    builder: (column) => column,
  );
}

class $$TempAsteroidsScannedTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TempAsteroidsScannedTable,
          TempAsteroidScanned,
          $$TempAsteroidsScannedTableFilterComposer,
          $$TempAsteroidsScannedTableOrderingComposer,
          $$TempAsteroidsScannedTableAnnotationComposer,
          $$TempAsteroidsScannedTableCreateCompanionBuilder,
          $$TempAsteroidsScannedTableUpdateCompanionBuilder,
          (
            TempAsteroidScanned,
            BaseReferences<
              _$AppDatabase,
              $TempAsteroidsScannedTable,
              TempAsteroidScanned
            >,
          ),
          TempAsteroidScanned,
          PrefetchHooks Function()
        > {
  $$TempAsteroidsScannedTableTableManager(
    _$AppDatabase db,
    $TempAsteroidsScannedTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TempAsteroidsScannedTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TempAsteroidsScannedTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TempAsteroidsScannedTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameTurn = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<String> asteroidName = const Value.absent(),
              }) => TempAsteroidsScannedCompanion(
                id: id,
                gameTurn: gameTurn,
                corpName: corpName,
                asteroidName: asteroidName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameTurn,
                required String corpName,
                required String asteroidName,
              }) => TempAsteroidsScannedCompanion.insert(
                id: id,
                gameTurn: gameTurn,
                corpName: corpName,
                asteroidName: asteroidName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TempAsteroidsScannedTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TempAsteroidsScannedTable,
      TempAsteroidScanned,
      $$TempAsteroidsScannedTableFilterComposer,
      $$TempAsteroidsScannedTableOrderingComposer,
      $$TempAsteroidsScannedTableAnnotationComposer,
      $$TempAsteroidsScannedTableCreateCompanionBuilder,
      $$TempAsteroidsScannedTableUpdateCompanionBuilder,
      (
        TempAsteroidScanned,
        BaseReferences<
          _$AppDatabase,
          $TempAsteroidsScannedTable,
          TempAsteroidScanned
        >,
      ),
      TempAsteroidScanned,
      PrefetchHooks Function()
    >;
typedef $$CadetsTableCreateCompanionBuilder =
    CadetsCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      required String name,
      Value<String> status,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> firearms,
      Value<int> melee,
      Value<int> athletics,
      Value<String?> gender,
      Value<String?> nationality,
    });
typedef $$CadetsTableUpdateCompanionBuilder =
    CadetsCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<String> name,
      Value<String> status,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> firearms,
      Value<int> melee,
      Value<int> athletics,
      Value<String?> gender,
      Value<String?> nationality,
    });

class $$CadetsTableFilterComposer
    extends Composer<_$AppDatabase, $CadetsTable> {
  $$CadetsTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firearms => $composableBuilder(
    column: $table.firearms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get melee => $composableBuilder(
    column: $table.melee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CadetsTableOrderingComposer
    extends Composer<_$AppDatabase, $CadetsTable> {
  $$CadetsTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firearms => $composableBuilder(
    column: $table.firearms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get melee => $composableBuilder(
    column: $table.melee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CadetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CadetsTable> {
  $$CadetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => column,
  );

  GeneratedColumn<int> get influence =>
      $composableBuilder(column: $table.influence, builder: (column) => column);

  GeneratedColumn<int> get pilot =>
      $composableBuilder(column: $table.pilot, builder: (column) => column);

  GeneratedColumn<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repair =>
      $composableBuilder(column: $table.repair, builder: (column) => column);

  GeneratedColumn<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firearms =>
      $composableBuilder(column: $table.firearms, builder: (column) => column);

  GeneratedColumn<int> get melee =>
      $composableBuilder(column: $table.melee, builder: (column) => column);

  GeneratedColumn<int> get athletics =>
      $composableBuilder(column: $table.athletics, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => column,
  );
}

class $$CadetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CadetsTable,
          Cadet,
          $$CadetsTableFilterComposer,
          $$CadetsTableOrderingComposer,
          $$CadetsTableAnnotationComposer,
          $$CadetsTableCreateCompanionBuilder,
          $$CadetsTableUpdateCompanionBuilder,
          (Cadet, BaseReferences<_$AppDatabase, $CadetsTable, Cadet>),
          Cadet,
          PrefetchHooks Function()
        > {
  $$CadetsTableTableManager(_$AppDatabase db, $CadetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CadetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CadetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CadetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> firearms = const Value.absent(),
                Value<int> melee = const Value.absent(),
                Value<int> athletics = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> nationality = const Value.absent(),
              }) => CadetsCompanion(
                id: id,
                corpName: corpName,
                name: name,
                status: status,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                firearms: firearms,
                melee: melee,
                athletics: athletics,
                gender: gender,
                nationality: nationality,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                required String name,
                Value<String> status = const Value.absent(),
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> firearms = const Value.absent(),
                Value<int> melee = const Value.absent(),
                Value<int> athletics = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> nationality = const Value.absent(),
              }) => CadetsCompanion.insert(
                id: id,
                corpName: corpName,
                name: name,
                status: status,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                firearms: firearms,
                melee: melee,
                athletics: athletics,
                gender: gender,
                nationality: nationality,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CadetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CadetsTable,
      Cadet,
      $$CadetsTableFilterComposer,
      $$CadetsTableOrderingComposer,
      $$CadetsTableAnnotationComposer,
      $$CadetsTableCreateCompanionBuilder,
      $$CadetsTableUpdateCompanionBuilder,
      (Cadet, BaseReferences<_$AppDatabase, $CadetsTable, Cadet>),
      Cadet,
      PrefetchHooks Function()
    >;
typedef $$CadetsProgressTableCreateCompanionBuilder =
    CadetsProgressCompanion Function({
      Value<int> id,
      required int gameTurn,
      Value<int?> cadetId,
      required String corpName,
      required String name,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> fighting,
      Value<int> athletics,
    });
typedef $$CadetsProgressTableUpdateCompanionBuilder =
    CadetsProgressCompanion Function({
      Value<int> id,
      Value<int> gameTurn,
      Value<int?> cadetId,
      Value<String> corpName,
      Value<String> name,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> fighting,
      Value<int> athletics,
    });

class $$CadetsProgressTableFilterComposer
    extends Composer<_$AppDatabase, $CadetsProgressTable> {
  $$CadetsProgressTableFilterComposer({
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

  ColumnFilters<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cadetId => $composableBuilder(
    column: $table.cadetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fighting => $composableBuilder(
    column: $table.fighting,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CadetsProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $CadetsProgressTable> {
  $$CadetsProgressTableOrderingComposer({
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

  ColumnOrderings<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cadetId => $composableBuilder(
    column: $table.cadetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fighting => $composableBuilder(
    column: $table.fighting,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CadetsProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $CadetsProgressTable> {
  $$CadetsProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get gameTurn =>
      $composableBuilder(column: $table.gameTurn, builder: (column) => column);

  GeneratedColumn<int> get cadetId =>
      $composableBuilder(column: $table.cadetId, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => column,
  );

  GeneratedColumn<int> get influence =>
      $composableBuilder(column: $table.influence, builder: (column) => column);

  GeneratedColumn<int> get pilot =>
      $composableBuilder(column: $table.pilot, builder: (column) => column);

  GeneratedColumn<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repair =>
      $composableBuilder(column: $table.repair, builder: (column) => column);

  GeneratedColumn<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fighting =>
      $composableBuilder(column: $table.fighting, builder: (column) => column);

  GeneratedColumn<int> get athletics =>
      $composableBuilder(column: $table.athletics, builder: (column) => column);
}

class $$CadetsProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CadetsProgressTable,
          CadetProgress,
          $$CadetsProgressTableFilterComposer,
          $$CadetsProgressTableOrderingComposer,
          $$CadetsProgressTableAnnotationComposer,
          $$CadetsProgressTableCreateCompanionBuilder,
          $$CadetsProgressTableUpdateCompanionBuilder,
          (
            CadetProgress,
            BaseReferences<_$AppDatabase, $CadetsProgressTable, CadetProgress>,
          ),
          CadetProgress,
          PrefetchHooks Function()
        > {
  $$CadetsProgressTableTableManager(
    _$AppDatabase db,
    $CadetsProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CadetsProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CadetsProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CadetsProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameTurn = const Value.absent(),
                Value<int?> cadetId = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> fighting = const Value.absent(),
                Value<int> athletics = const Value.absent(),
              }) => CadetsProgressCompanion(
                id: id,
                gameTurn: gameTurn,
                cadetId: cadetId,
                corpName: corpName,
                name: name,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                fighting: fighting,
                athletics: athletics,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameTurn,
                Value<int?> cadetId = const Value.absent(),
                required String corpName,
                required String name,
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> fighting = const Value.absent(),
                Value<int> athletics = const Value.absent(),
              }) => CadetsProgressCompanion.insert(
                id: id,
                gameTurn: gameTurn,
                cadetId: cadetId,
                corpName: corpName,
                name: name,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                fighting: fighting,
                athletics: athletics,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CadetsProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CadetsProgressTable,
      CadetProgress,
      $$CadetsProgressTableFilterComposer,
      $$CadetsProgressTableOrderingComposer,
      $$CadetsProgressTableAnnotationComposer,
      $$CadetsProgressTableCreateCompanionBuilder,
      $$CadetsProgressTableUpdateCompanionBuilder,
      (
        CadetProgress,
        BaseReferences<_$AppDatabase, $CadetsProgressTable, CadetProgress>,
      ),
      CadetProgress,
      PrefetchHooks Function()
    >;
typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      Value<int?> cid,
      Value<String?> corp,
      required String name,
      Value<String?> race,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> astrogation,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> firearms,
      Value<int> melee,
      Value<int> athletics,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      Value<int?> cid,
      Value<String?> corp,
      Value<String> name,
      Value<String?> race,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> astrogation,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> firearms,
      Value<int> melee,
      Value<int> athletics,
    });

class $$CharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
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

  ColumnFilters<int> get cid => $composableBuilder(
    column: $table.cid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corp => $composableBuilder(
    column: $table.corp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get astrogation => $composableBuilder(
    column: $table.astrogation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firearms => $composableBuilder(
    column: $table.firearms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get melee => $composableBuilder(
    column: $table.melee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
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

  ColumnOrderings<int> get cid => $composableBuilder(
    column: $table.cid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corp => $composableBuilder(
    column: $table.corp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get astrogation => $composableBuilder(
    column: $table.astrogation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firearms => $composableBuilder(
    column: $table.firearms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get melee => $composableBuilder(
    column: $table.melee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get cid =>
      $composableBuilder(column: $table.cid, builder: (column) => column);

  GeneratedColumn<String> get corp =>
      $composableBuilder(column: $table.corp, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get race =>
      $composableBuilder(column: $table.race, builder: (column) => column);

  GeneratedColumn<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => column,
  );

  GeneratedColumn<int> get influence =>
      $composableBuilder(column: $table.influence, builder: (column) => column);

  GeneratedColumn<int> get pilot =>
      $composableBuilder(column: $table.pilot, builder: (column) => column);

  GeneratedColumn<int> get astrogation => $composableBuilder(
    column: $table.astrogation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repair =>
      $composableBuilder(column: $table.repair, builder: (column) => column);

  GeneratedColumn<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firearms =>
      $composableBuilder(column: $table.firearms, builder: (column) => column);

  GeneratedColumn<int> get melee =>
      $composableBuilder(column: $table.melee, builder: (column) => column);

  GeneratedColumn<int> get athletics =>
      $composableBuilder(column: $table.athletics, builder: (column) => column);
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharactersTable,
          GameCharacter,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (
            GameCharacter,
            BaseReferences<_$AppDatabase, $CharactersTable, GameCharacter>,
          ),
          GameCharacter,
          PrefetchHooks Function()
        > {
  $$CharactersTableTableManager(_$AppDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> cid = const Value.absent(),
                Value<String?> corp = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> race = const Value.absent(),
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> astrogation = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> firearms = const Value.absent(),
                Value<int> melee = const Value.absent(),
                Value<int> athletics = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                cid: cid,
                corp: corp,
                name: name,
                race: race,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                astrogation: astrogation,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                firearms: firearms,
                melee: melee,
                athletics: athletics,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> cid = const Value.absent(),
                Value<String?> corp = const Value.absent(),
                required String name,
                Value<String?> race = const Value.absent(),
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> astrogation = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> firearms = const Value.absent(),
                Value<int> melee = const Value.absent(),
                Value<int> athletics = const Value.absent(),
              }) => CharactersCompanion.insert(
                id: id,
                cid: cid,
                corp: corp,
                name: name,
                race: race,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                astrogation: astrogation,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                firearms: firearms,
                melee: melee,
                athletics: athletics,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharactersTable,
      GameCharacter,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (
        GameCharacter,
        BaseReferences<_$AppDatabase, $CharactersTable, GameCharacter>,
      ),
      GameCharacter,
      PrefetchHooks Function()
    >;
typedef $$CombatStatsTableCreateCompanionBuilder =
    CombatStatsCompanion Function({
      Value<int> attackId,
      Value<int?> battleId,
      required String attackSquadron,
      Value<String?> attacker,
      Value<String?> weapon,
      Value<int> damage,
      Value<String?> target,
      Value<String?> destroyed,
    });
typedef $$CombatStatsTableUpdateCompanionBuilder =
    CombatStatsCompanion Function({
      Value<int> attackId,
      Value<int?> battleId,
      Value<String> attackSquadron,
      Value<String?> attacker,
      Value<String?> weapon,
      Value<int> damage,
      Value<String?> target,
      Value<String?> destroyed,
    });

class $$CombatStatsTableFilterComposer
    extends Composer<_$AppDatabase, $CombatStatsTable> {
  $$CombatStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get attackId => $composableBuilder(
    column: $table.attackId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get battleId => $composableBuilder(
    column: $table.battleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attackSquadron => $composableBuilder(
    column: $table.attackSquadron,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attacker => $composableBuilder(
    column: $table.attacker,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weapon => $composableBuilder(
    column: $table.weapon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get damage => $composableBuilder(
    column: $table.damage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destroyed => $composableBuilder(
    column: $table.destroyed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CombatStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $CombatStatsTable> {
  $$CombatStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get attackId => $composableBuilder(
    column: $table.attackId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get battleId => $composableBuilder(
    column: $table.battleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attackSquadron => $composableBuilder(
    column: $table.attackSquadron,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attacker => $composableBuilder(
    column: $table.attacker,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weapon => $composableBuilder(
    column: $table.weapon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get damage => $composableBuilder(
    column: $table.damage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destroyed => $composableBuilder(
    column: $table.destroyed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CombatStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CombatStatsTable> {
  $$CombatStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get attackId =>
      $composableBuilder(column: $table.attackId, builder: (column) => column);

  GeneratedColumn<int> get battleId =>
      $composableBuilder(column: $table.battleId, builder: (column) => column);

  GeneratedColumn<String> get attackSquadron => $composableBuilder(
    column: $table.attackSquadron,
    builder: (column) => column,
  );

  GeneratedColumn<String> get attacker =>
      $composableBuilder(column: $table.attacker, builder: (column) => column);

  GeneratedColumn<String> get weapon =>
      $composableBuilder(column: $table.weapon, builder: (column) => column);

  GeneratedColumn<int> get damage =>
      $composableBuilder(column: $table.damage, builder: (column) => column);

  GeneratedColumn<String> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<String> get destroyed =>
      $composableBuilder(column: $table.destroyed, builder: (column) => column);
}

class $$CombatStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CombatStatsTable,
          CombatStat,
          $$CombatStatsTableFilterComposer,
          $$CombatStatsTableOrderingComposer,
          $$CombatStatsTableAnnotationComposer,
          $$CombatStatsTableCreateCompanionBuilder,
          $$CombatStatsTableUpdateCompanionBuilder,
          (
            CombatStat,
            BaseReferences<_$AppDatabase, $CombatStatsTable, CombatStat>,
          ),
          CombatStat,
          PrefetchHooks Function()
        > {
  $$CombatStatsTableTableManager(_$AppDatabase db, $CombatStatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CombatStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CombatStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CombatStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> attackId = const Value.absent(),
                Value<int?> battleId = const Value.absent(),
                Value<String> attackSquadron = const Value.absent(),
                Value<String?> attacker = const Value.absent(),
                Value<String?> weapon = const Value.absent(),
                Value<int> damage = const Value.absent(),
                Value<String?> target = const Value.absent(),
                Value<String?> destroyed = const Value.absent(),
              }) => CombatStatsCompanion(
                attackId: attackId,
                battleId: battleId,
                attackSquadron: attackSquadron,
                attacker: attacker,
                weapon: weapon,
                damage: damage,
                target: target,
                destroyed: destroyed,
              ),
          createCompanionCallback:
              ({
                Value<int> attackId = const Value.absent(),
                Value<int?> battleId = const Value.absent(),
                required String attackSquadron,
                Value<String?> attacker = const Value.absent(),
                Value<String?> weapon = const Value.absent(),
                Value<int> damage = const Value.absent(),
                Value<String?> target = const Value.absent(),
                Value<String?> destroyed = const Value.absent(),
              }) => CombatStatsCompanion.insert(
                attackId: attackId,
                battleId: battleId,
                attackSquadron: attackSquadron,
                attacker: attacker,
                weapon: weapon,
                damage: damage,
                target: target,
                destroyed: destroyed,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CombatStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CombatStatsTable,
      CombatStat,
      $$CombatStatsTableFilterComposer,
      $$CombatStatsTableOrderingComposer,
      $$CombatStatsTableAnnotationComposer,
      $$CombatStatsTableCreateCompanionBuilder,
      $$CombatStatsTableUpdateCompanionBuilder,
      (
        CombatStat,
        BaseReferences<_$AppDatabase, $CombatStatsTable, CombatStat>,
      ),
      CombatStat,
      PrefetchHooks Function()
    >;
typedef $$CorpInventoryTableCreateCompanionBuilder =
    CorpInventoryCompanion Function({
      Value<int> id,
      required String corpName,
      required String item,
      Value<int> qty,
    });
typedef $$CorpInventoryTableUpdateCompanionBuilder =
    CorpInventoryCompanion Function({
      Value<int> id,
      Value<String> corpName,
      Value<String> item,
      Value<int> qty,
    });

class $$CorpInventoryTableFilterComposer
    extends Composer<_$AppDatabase, $CorpInventoryTable> {
  $$CorpInventoryTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get item => $composableBuilder(
    column: $table.item,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CorpInventoryTableOrderingComposer
    extends Composer<_$AppDatabase, $CorpInventoryTable> {
  $$CorpInventoryTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get item => $composableBuilder(
    column: $table.item,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get qty => $composableBuilder(
    column: $table.qty,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CorpInventoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $CorpInventoryTable> {
  $$CorpInventoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get item =>
      $composableBuilder(column: $table.item, builder: (column) => column);

  GeneratedColumn<int> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);
}

class $$CorpInventoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CorpInventoryTable,
          CorpInventoryItem,
          $$CorpInventoryTableFilterComposer,
          $$CorpInventoryTableOrderingComposer,
          $$CorpInventoryTableAnnotationComposer,
          $$CorpInventoryTableCreateCompanionBuilder,
          $$CorpInventoryTableUpdateCompanionBuilder,
          (
            CorpInventoryItem,
            BaseReferences<
              _$AppDatabase,
              $CorpInventoryTable,
              CorpInventoryItem
            >,
          ),
          CorpInventoryItem,
          PrefetchHooks Function()
        > {
  $$CorpInventoryTableTableManager(_$AppDatabase db, $CorpInventoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CorpInventoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CorpInventoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CorpInventoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<String> item = const Value.absent(),
                Value<int> qty = const Value.absent(),
              }) => CorpInventoryCompanion(
                id: id,
                corpName: corpName,
                item: item,
                qty: qty,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String corpName,
                required String item,
                Value<int> qty = const Value.absent(),
              }) => CorpInventoryCompanion.insert(
                id: id,
                corpName: corpName,
                item: item,
                qty: qty,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CorpInventoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CorpInventoryTable,
      CorpInventoryItem,
      $$CorpInventoryTableFilterComposer,
      $$CorpInventoryTableOrderingComposer,
      $$CorpInventoryTableAnnotationComposer,
      $$CorpInventoryTableCreateCompanionBuilder,
      $$CorpInventoryTableUpdateCompanionBuilder,
      (
        CorpInventoryItem,
        BaseReferences<_$AppDatabase, $CorpInventoryTable, CorpInventoryItem>,
      ),
      CorpInventoryItem,
      PrefetchHooks Function()
    >;
typedef $$CorpResearchTableCreateCompanionBuilder =
    CorpResearchCompanion Function({
      Value<int> id,
      required String corpName,
      required String researchType,
      Value<int> level,
      Value<int> progress,
      Value<int> nextGoal,
    });
typedef $$CorpResearchTableUpdateCompanionBuilder =
    CorpResearchCompanion Function({
      Value<int> id,
      Value<String> corpName,
      Value<String> researchType,
      Value<int> level,
      Value<int> progress,
      Value<int> nextGoal,
    });

class $$CorpResearchTableFilterComposer
    extends Composer<_$AppDatabase, $CorpResearchTable> {
  $$CorpResearchTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get researchType => $composableBuilder(
    column: $table.researchType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextGoal => $composableBuilder(
    column: $table.nextGoal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CorpResearchTableOrderingComposer
    extends Composer<_$AppDatabase, $CorpResearchTable> {
  $$CorpResearchTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get researchType => $composableBuilder(
    column: $table.researchType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextGoal => $composableBuilder(
    column: $table.nextGoal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CorpResearchTableAnnotationComposer
    extends Composer<_$AppDatabase, $CorpResearchTable> {
  $$CorpResearchTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get researchType => $composableBuilder(
    column: $table.researchType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get nextGoal =>
      $composableBuilder(column: $table.nextGoal, builder: (column) => column);
}

class $$CorpResearchTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CorpResearchTable,
          CorpResearchItem,
          $$CorpResearchTableFilterComposer,
          $$CorpResearchTableOrderingComposer,
          $$CorpResearchTableAnnotationComposer,
          $$CorpResearchTableCreateCompanionBuilder,
          $$CorpResearchTableUpdateCompanionBuilder,
          (
            CorpResearchItem,
            BaseReferences<_$AppDatabase, $CorpResearchTable, CorpResearchItem>,
          ),
          CorpResearchItem,
          PrefetchHooks Function()
        > {
  $$CorpResearchTableTableManager(_$AppDatabase db, $CorpResearchTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CorpResearchTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CorpResearchTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CorpResearchTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<String> researchType = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<int> nextGoal = const Value.absent(),
              }) => CorpResearchCompanion(
                id: id,
                corpName: corpName,
                researchType: researchType,
                level: level,
                progress: progress,
                nextGoal: nextGoal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String corpName,
                required String researchType,
                Value<int> level = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<int> nextGoal = const Value.absent(),
              }) => CorpResearchCompanion.insert(
                id: id,
                corpName: corpName,
                researchType: researchType,
                level: level,
                progress: progress,
                nextGoal: nextGoal,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CorpResearchTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CorpResearchTable,
      CorpResearchItem,
      $$CorpResearchTableFilterComposer,
      $$CorpResearchTableOrderingComposer,
      $$CorpResearchTableAnnotationComposer,
      $$CorpResearchTableCreateCompanionBuilder,
      $$CorpResearchTableUpdateCompanionBuilder,
      (
        CorpResearchItem,
        BaseReferences<_$AppDatabase, $CorpResearchTable, CorpResearchItem>,
      ),
      CorpResearchItem,
      PrefetchHooks Function()
    >;
typedef $$CrewTableCreateCompanionBuilder =
    CrewCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<String?> squadron,
      Value<String?> shipName,
      Value<String> assignment,
      Value<String> status,
      required String name,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> fighting,
      Value<int> athletics,
    });
typedef $$CrewTableUpdateCompanionBuilder =
    CrewCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<String?> squadron,
      Value<String?> shipName,
      Value<String> assignment,
      Value<String> status,
      Value<String> name,
      Value<int> leadership,
      Value<int> influence,
      Value<int> pilot,
      Value<int> computation,
      Value<int> repair,
      Value<int> shipWeapons,
      Value<int> fighting,
      Value<int> athletics,
    });

class $$CrewTableFilterComposer extends Composer<_$AppDatabase, $CrewTable> {
  $$CrewTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get squadron => $composableBuilder(
    column: $table.squadron,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignment => $composableBuilder(
    column: $table.assignment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fighting => $composableBuilder(
    column: $table.fighting,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CrewTableOrderingComposer extends Composer<_$AppDatabase, $CrewTable> {
  $$CrewTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get squadron => $composableBuilder(
    column: $table.squadron,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignment => $composableBuilder(
    column: $table.assignment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get influence => $composableBuilder(
    column: $table.influence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pilot => $composableBuilder(
    column: $table.pilot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repair => $composableBuilder(
    column: $table.repair,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fighting => $composableBuilder(
    column: $table.fighting,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get athletics => $composableBuilder(
    column: $table.athletics,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CrewTableAnnotationComposer
    extends Composer<_$AppDatabase, $CrewTable> {
  $$CrewTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get squadron =>
      $composableBuilder(column: $table.squadron, builder: (column) => column);

  GeneratedColumn<String> get shipName =>
      $composableBuilder(column: $table.shipName, builder: (column) => column);

  GeneratedColumn<String> get assignment => $composableBuilder(
    column: $table.assignment,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => column,
  );

  GeneratedColumn<int> get influence =>
      $composableBuilder(column: $table.influence, builder: (column) => column);

  GeneratedColumn<int> get pilot =>
      $composableBuilder(column: $table.pilot, builder: (column) => column);

  GeneratedColumn<int> get computation => $composableBuilder(
    column: $table.computation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repair =>
      $composableBuilder(column: $table.repair, builder: (column) => column);

  GeneratedColumn<int> get shipWeapons => $composableBuilder(
    column: $table.shipWeapons,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fighting =>
      $composableBuilder(column: $table.fighting, builder: (column) => column);

  GeneratedColumn<int> get athletics =>
      $composableBuilder(column: $table.athletics, builder: (column) => column);
}

class $$CrewTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CrewTable,
          CrewMember,
          $$CrewTableFilterComposer,
          $$CrewTableOrderingComposer,
          $$CrewTableAnnotationComposer,
          $$CrewTableCreateCompanionBuilder,
          $$CrewTableUpdateCompanionBuilder,
          (CrewMember, BaseReferences<_$AppDatabase, $CrewTable, CrewMember>),
          CrewMember,
          PrefetchHooks Function()
        > {
  $$CrewTableTableManager(_$AppDatabase db, $CrewTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CrewTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CrewTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CrewTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<String?> squadron = const Value.absent(),
                Value<String?> shipName = const Value.absent(),
                Value<String> assignment = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> fighting = const Value.absent(),
                Value<int> athletics = const Value.absent(),
              }) => CrewCompanion(
                id: id,
                corpName: corpName,
                squadron: squadron,
                shipName: shipName,
                assignment: assignment,
                status: status,
                name: name,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                fighting: fighting,
                athletics: athletics,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<String?> squadron = const Value.absent(),
                Value<String?> shipName = const Value.absent(),
                Value<String> assignment = const Value.absent(),
                Value<String> status = const Value.absent(),
                required String name,
                Value<int> leadership = const Value.absent(),
                Value<int> influence = const Value.absent(),
                Value<int> pilot = const Value.absent(),
                Value<int> computation = const Value.absent(),
                Value<int> repair = const Value.absent(),
                Value<int> shipWeapons = const Value.absent(),
                Value<int> fighting = const Value.absent(),
                Value<int> athletics = const Value.absent(),
              }) => CrewCompanion.insert(
                id: id,
                corpName: corpName,
                squadron: squadron,
                shipName: shipName,
                assignment: assignment,
                status: status,
                name: name,
                leadership: leadership,
                influence: influence,
                pilot: pilot,
                computation: computation,
                repair: repair,
                shipWeapons: shipWeapons,
                fighting: fighting,
                athletics: athletics,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CrewTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CrewTable,
      CrewMember,
      $$CrewTableFilterComposer,
      $$CrewTableOrderingComposer,
      $$CrewTableAnnotationComposer,
      $$CrewTableCreateCompanionBuilder,
      $$CrewTableUpdateCompanionBuilder,
      (CrewMember, BaseReferences<_$AppDatabase, $CrewTable, CrewMember>),
      CrewMember,
      PrefetchHooks Function()
    >;
typedef $$CrewGenerateTableCreateCompanionBuilder =
    CrewGenerateCompanion Function({
      Value<int> id,
      Value<String?> nationality,
      Value<String?> gender,
      Value<String?> forename,
      Value<String?> surname,
    });
typedef $$CrewGenerateTableUpdateCompanionBuilder =
    CrewGenerateCompanion Function({
      Value<int> id,
      Value<String?> nationality,
      Value<String?> gender,
      Value<String?> forename,
      Value<String?> surname,
    });

class $$CrewGenerateTableFilterComposer
    extends Composer<_$AppDatabase, $CrewGenerateTable> {
  $$CrewGenerateTableFilterComposer({
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

  ColumnFilters<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get forename => $composableBuilder(
    column: $table.forename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CrewGenerateTableOrderingComposer
    extends Composer<_$AppDatabase, $CrewGenerateTable> {
  $$CrewGenerateTableOrderingComposer({
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

  ColumnOrderings<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get forename => $composableBuilder(
    column: $table.forename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CrewGenerateTableAnnotationComposer
    extends Composer<_$AppDatabase, $CrewGenerateTable> {
  $$CrewGenerateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nationality => $composableBuilder(
    column: $table.nationality,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get forename =>
      $composableBuilder(column: $table.forename, builder: (column) => column);

  GeneratedColumn<String> get surname =>
      $composableBuilder(column: $table.surname, builder: (column) => column);
}

class $$CrewGenerateTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CrewGenerateTable,
          CrewGenerateEntry,
          $$CrewGenerateTableFilterComposer,
          $$CrewGenerateTableOrderingComposer,
          $$CrewGenerateTableAnnotationComposer,
          $$CrewGenerateTableCreateCompanionBuilder,
          $$CrewGenerateTableUpdateCompanionBuilder,
          (
            CrewGenerateEntry,
            BaseReferences<
              _$AppDatabase,
              $CrewGenerateTable,
              CrewGenerateEntry
            >,
          ),
          CrewGenerateEntry,
          PrefetchHooks Function()
        > {
  $$CrewGenerateTableTableManager(_$AppDatabase db, $CrewGenerateTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CrewGenerateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CrewGenerateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CrewGenerateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nationality = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> forename = const Value.absent(),
                Value<String?> surname = const Value.absent(),
              }) => CrewGenerateCompanion(
                id: id,
                nationality: nationality,
                gender: gender,
                forename: forename,
                surname: surname,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nationality = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> forename = const Value.absent(),
                Value<String?> surname = const Value.absent(),
              }) => CrewGenerateCompanion.insert(
                id: id,
                nationality: nationality,
                gender: gender,
                forename: forename,
                surname: surname,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CrewGenerateTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CrewGenerateTable,
      CrewGenerateEntry,
      $$CrewGenerateTableFilterComposer,
      $$CrewGenerateTableOrderingComposer,
      $$CrewGenerateTableAnnotationComposer,
      $$CrewGenerateTableCreateCompanionBuilder,
      $$CrewGenerateTableUpdateCompanionBuilder,
      (
        CrewGenerateEntry,
        BaseReferences<_$AppDatabase, $CrewGenerateTable, CrewGenerateEntry>,
      ),
      CrewGenerateEntry,
      PrefetchHooks Function()
    >;
typedef $$FleetTableCreateCompanionBuilder =
    FleetCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<String> squadron,
      required String shipName,
      Value<String?> shipClass,
      Value<int> shipSize,
      Value<String?> shipModel,
      Value<int> weap,
      Value<int> armor,
      Value<int> bays,
      Value<int> cargo,
      Value<int> engines,
      Value<int> maneuv,
      Value<int> weapCtrl,
      Value<int> cloak,
      Value<int> lifeSupp,
      Value<int> maxCargo,
      Value<int> maxEngines,
      Value<int> maxManeuv,
      Value<int> maxWeapCtrl,
      Value<int> maxLifeSupp,
      Value<int> hp,
      Value<int> maxHp,
      Value<int> value,
      Value<int> maxShipValue,
    });
typedef $$FleetTableUpdateCompanionBuilder =
    FleetCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<String> squadron,
      Value<String> shipName,
      Value<String?> shipClass,
      Value<int> shipSize,
      Value<String?> shipModel,
      Value<int> weap,
      Value<int> armor,
      Value<int> bays,
      Value<int> cargo,
      Value<int> engines,
      Value<int> maneuv,
      Value<int> weapCtrl,
      Value<int> cloak,
      Value<int> lifeSupp,
      Value<int> maxCargo,
      Value<int> maxEngines,
      Value<int> maxManeuv,
      Value<int> maxWeapCtrl,
      Value<int> maxLifeSupp,
      Value<int> hp,
      Value<int> maxHp,
      Value<int> value,
      Value<int> maxShipValue,
    });

class $$FleetTableFilterComposer extends Composer<_$AppDatabase, $FleetTable> {
  $$FleetTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get squadron => $composableBuilder(
    column: $table.squadron,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipClass => $composableBuilder(
    column: $table.shipClass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shipSize => $composableBuilder(
    column: $table.shipSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipModel => $composableBuilder(
    column: $table.shipModel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weap => $composableBuilder(
    column: $table.weap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get armor => $composableBuilder(
    column: $table.armor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bays => $composableBuilder(
    column: $table.bays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cargo => $composableBuilder(
    column: $table.cargo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get engines => $composableBuilder(
    column: $table.engines,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maneuv => $composableBuilder(
    column: $table.maneuv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weapCtrl => $composableBuilder(
    column: $table.weapCtrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cloak => $composableBuilder(
    column: $table.cloak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lifeSupp => $composableBuilder(
    column: $table.lifeSupp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxCargo => $composableBuilder(
    column: $table.maxCargo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxEngines => $composableBuilder(
    column: $table.maxEngines,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxManeuv => $composableBuilder(
    column: $table.maxManeuv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxWeapCtrl => $composableBuilder(
    column: $table.maxWeapCtrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxLifeSupp => $composableBuilder(
    column: $table.maxLifeSupp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hp => $composableBuilder(
    column: $table.hp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxShipValue => $composableBuilder(
    column: $table.maxShipValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FleetTableOrderingComposer
    extends Composer<_$AppDatabase, $FleetTable> {
  $$FleetTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get squadron => $composableBuilder(
    column: $table.squadron,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipClass => $composableBuilder(
    column: $table.shipClass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shipSize => $composableBuilder(
    column: $table.shipSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipModel => $composableBuilder(
    column: $table.shipModel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weap => $composableBuilder(
    column: $table.weap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get armor => $composableBuilder(
    column: $table.armor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bays => $composableBuilder(
    column: $table.bays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cargo => $composableBuilder(
    column: $table.cargo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get engines => $composableBuilder(
    column: $table.engines,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maneuv => $composableBuilder(
    column: $table.maneuv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weapCtrl => $composableBuilder(
    column: $table.weapCtrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cloak => $composableBuilder(
    column: $table.cloak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lifeSupp => $composableBuilder(
    column: $table.lifeSupp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxCargo => $composableBuilder(
    column: $table.maxCargo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxEngines => $composableBuilder(
    column: $table.maxEngines,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxManeuv => $composableBuilder(
    column: $table.maxManeuv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxWeapCtrl => $composableBuilder(
    column: $table.maxWeapCtrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxLifeSupp => $composableBuilder(
    column: $table.maxLifeSupp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hp => $composableBuilder(
    column: $table.hp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxShipValue => $composableBuilder(
    column: $table.maxShipValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FleetTableAnnotationComposer
    extends Composer<_$AppDatabase, $FleetTable> {
  $$FleetTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get squadron =>
      $composableBuilder(column: $table.squadron, builder: (column) => column);

  GeneratedColumn<String> get shipName =>
      $composableBuilder(column: $table.shipName, builder: (column) => column);

  GeneratedColumn<String> get shipClass =>
      $composableBuilder(column: $table.shipClass, builder: (column) => column);

  GeneratedColumn<int> get shipSize =>
      $composableBuilder(column: $table.shipSize, builder: (column) => column);

  GeneratedColumn<String> get shipModel =>
      $composableBuilder(column: $table.shipModel, builder: (column) => column);

  GeneratedColumn<int> get weap =>
      $composableBuilder(column: $table.weap, builder: (column) => column);

  GeneratedColumn<int> get armor =>
      $composableBuilder(column: $table.armor, builder: (column) => column);

  GeneratedColumn<int> get bays =>
      $composableBuilder(column: $table.bays, builder: (column) => column);

  GeneratedColumn<int> get cargo =>
      $composableBuilder(column: $table.cargo, builder: (column) => column);

  GeneratedColumn<int> get engines =>
      $composableBuilder(column: $table.engines, builder: (column) => column);

  GeneratedColumn<int> get maneuv =>
      $composableBuilder(column: $table.maneuv, builder: (column) => column);

  GeneratedColumn<int> get weapCtrl =>
      $composableBuilder(column: $table.weapCtrl, builder: (column) => column);

  GeneratedColumn<int> get cloak =>
      $composableBuilder(column: $table.cloak, builder: (column) => column);

  GeneratedColumn<int> get lifeSupp =>
      $composableBuilder(column: $table.lifeSupp, builder: (column) => column);

  GeneratedColumn<int> get maxCargo =>
      $composableBuilder(column: $table.maxCargo, builder: (column) => column);

  GeneratedColumn<int> get maxEngines => $composableBuilder(
    column: $table.maxEngines,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxManeuv =>
      $composableBuilder(column: $table.maxManeuv, builder: (column) => column);

  GeneratedColumn<int> get maxWeapCtrl => $composableBuilder(
    column: $table.maxWeapCtrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxLifeSupp => $composableBuilder(
    column: $table.maxLifeSupp,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hp =>
      $composableBuilder(column: $table.hp, builder: (column) => column);

  GeneratedColumn<int> get maxHp =>
      $composableBuilder(column: $table.maxHp, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get maxShipValue => $composableBuilder(
    column: $table.maxShipValue,
    builder: (column) => column,
  );
}

class $$FleetTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FleetTable,
          FleetShip,
          $$FleetTableFilterComposer,
          $$FleetTableOrderingComposer,
          $$FleetTableAnnotationComposer,
          $$FleetTableCreateCompanionBuilder,
          $$FleetTableUpdateCompanionBuilder,
          (FleetShip, BaseReferences<_$AppDatabase, $FleetTable, FleetShip>),
          FleetShip,
          PrefetchHooks Function()
        > {
  $$FleetTableTableManager(_$AppDatabase db, $FleetTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FleetTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FleetTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FleetTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<String> squadron = const Value.absent(),
                Value<String> shipName = const Value.absent(),
                Value<String?> shipClass = const Value.absent(),
                Value<int> shipSize = const Value.absent(),
                Value<String?> shipModel = const Value.absent(),
                Value<int> weap = const Value.absent(),
                Value<int> armor = const Value.absent(),
                Value<int> bays = const Value.absent(),
                Value<int> cargo = const Value.absent(),
                Value<int> engines = const Value.absent(),
                Value<int> maneuv = const Value.absent(),
                Value<int> weapCtrl = const Value.absent(),
                Value<int> cloak = const Value.absent(),
                Value<int> lifeSupp = const Value.absent(),
                Value<int> maxCargo = const Value.absent(),
                Value<int> maxEngines = const Value.absent(),
                Value<int> maxManeuv = const Value.absent(),
                Value<int> maxWeapCtrl = const Value.absent(),
                Value<int> maxLifeSupp = const Value.absent(),
                Value<int> hp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<int> maxShipValue = const Value.absent(),
              }) => FleetCompanion(
                id: id,
                corpName: corpName,
                squadron: squadron,
                shipName: shipName,
                shipClass: shipClass,
                shipSize: shipSize,
                shipModel: shipModel,
                weap: weap,
                armor: armor,
                bays: bays,
                cargo: cargo,
                engines: engines,
                maneuv: maneuv,
                weapCtrl: weapCtrl,
                cloak: cloak,
                lifeSupp: lifeSupp,
                maxCargo: maxCargo,
                maxEngines: maxEngines,
                maxManeuv: maxManeuv,
                maxWeapCtrl: maxWeapCtrl,
                maxLifeSupp: maxLifeSupp,
                hp: hp,
                maxHp: maxHp,
                value: value,
                maxShipValue: maxShipValue,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<String> squadron = const Value.absent(),
                required String shipName,
                Value<String?> shipClass = const Value.absent(),
                Value<int> shipSize = const Value.absent(),
                Value<String?> shipModel = const Value.absent(),
                Value<int> weap = const Value.absent(),
                Value<int> armor = const Value.absent(),
                Value<int> bays = const Value.absent(),
                Value<int> cargo = const Value.absent(),
                Value<int> engines = const Value.absent(),
                Value<int> maneuv = const Value.absent(),
                Value<int> weapCtrl = const Value.absent(),
                Value<int> cloak = const Value.absent(),
                Value<int> lifeSupp = const Value.absent(),
                Value<int> maxCargo = const Value.absent(),
                Value<int> maxEngines = const Value.absent(),
                Value<int> maxManeuv = const Value.absent(),
                Value<int> maxWeapCtrl = const Value.absent(),
                Value<int> maxLifeSupp = const Value.absent(),
                Value<int> hp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<int> maxShipValue = const Value.absent(),
              }) => FleetCompanion.insert(
                id: id,
                corpName: corpName,
                squadron: squadron,
                shipName: shipName,
                shipClass: shipClass,
                shipSize: shipSize,
                shipModel: shipModel,
                weap: weap,
                armor: armor,
                bays: bays,
                cargo: cargo,
                engines: engines,
                maneuv: maneuv,
                weapCtrl: weapCtrl,
                cloak: cloak,
                lifeSupp: lifeSupp,
                maxCargo: maxCargo,
                maxEngines: maxEngines,
                maxManeuv: maxManeuv,
                maxWeapCtrl: maxWeapCtrl,
                maxLifeSupp: maxLifeSupp,
                hp: hp,
                maxHp: maxHp,
                value: value,
                maxShipValue: maxShipValue,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FleetTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FleetTable,
      FleetShip,
      $$FleetTableFilterComposer,
      $$FleetTableOrderingComposer,
      $$FleetTableAnnotationComposer,
      $$FleetTableCreateCompanionBuilder,
      $$FleetTableUpdateCompanionBuilder,
      (FleetShip, BaseReferences<_$AppDatabase, $FleetTable, FleetShip>),
      FleetShip,
      PrefetchHooks Function()
    >;
typedef $$GameDataTableCreateCompanionBuilder =
    GameDataCompanion Function({
      Value<int> id,
      Value<int> gameTurn,
      Value<DateTime> updatedAt,
    });
typedef $$GameDataTableUpdateCompanionBuilder =
    GameDataCompanion Function({
      Value<int> id,
      Value<int> gameTurn,
      Value<DateTime> updatedAt,
    });

class $$GameDataTableFilterComposer
    extends Composer<_$AppDatabase, $GameDataTable> {
  $$GameDataTableFilterComposer({
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

  ColumnFilters<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GameDataTableOrderingComposer
    extends Composer<_$AppDatabase, $GameDataTable> {
  $$GameDataTableOrderingComposer({
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

  ColumnOrderings<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GameDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameDataTable> {
  $$GameDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get gameTurn =>
      $composableBuilder(column: $table.gameTurn, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GameDataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameDataTable,
          GameDataEntry,
          $$GameDataTableFilterComposer,
          $$GameDataTableOrderingComposer,
          $$GameDataTableAnnotationComposer,
          $$GameDataTableCreateCompanionBuilder,
          $$GameDataTableUpdateCompanionBuilder,
          (
            GameDataEntry,
            BaseReferences<_$AppDatabase, $GameDataTable, GameDataEntry>,
          ),
          GameDataEntry,
          PrefetchHooks Function()
        > {
  $$GameDataTableTableManager(_$AppDatabase db, $GameDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameTurn = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GameDataCompanion(
                id: id,
                gameTurn: gameTurn,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameTurn = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GameDataCompanion.insert(
                id: id,
                gameTurn: gameTurn,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GameDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameDataTable,
      GameDataEntry,
      $$GameDataTableFilterComposer,
      $$GameDataTableOrderingComposer,
      $$GameDataTableAnnotationComposer,
      $$GameDataTableCreateCompanionBuilder,
      $$GameDataTableUpdateCompanionBuilder,
      (
        GameDataEntry,
        BaseReferences<_$AppDatabase, $GameDataTable, GameDataEntry>,
      ),
      GameDataEntry,
      PrefetchHooks Function()
    >;
typedef $$MembersTableCreateCompanionBuilder =
    MembersCompanion Function({
      Value<int> id,
      required String username,
      Value<String> password,
      Value<String> email,
      Value<bool> verified,
      Value<bool> isAi,
      Value<DateTime> createdAt,
    });
typedef $$MembersTableUpdateCompanionBuilder =
    MembersCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<String> password,
      Value<String> email,
      Value<bool> verified,
      Value<bool> isAi,
      Value<DateTime> createdAt,
    });

class $$MembersTableFilterComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableFilterComposer({
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

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get verified => $composableBuilder(
    column: $table.verified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAi => $composableBuilder(
    column: $table.isAi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MembersTableOrderingComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableOrderingComposer({
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

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get verified => $composableBuilder(
    column: $table.verified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAi => $composableBuilder(
    column: $table.isAi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<bool> get verified =>
      $composableBuilder(column: $table.verified, builder: (column) => column);

  GeneratedColumn<bool> get isAi =>
      $composableBuilder(column: $table.isAi, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$MembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MembersTable,
          Member,
          $$MembersTableFilterComposer,
          $$MembersTableOrderingComposer,
          $$MembersTableAnnotationComposer,
          $$MembersTableCreateCompanionBuilder,
          $$MembersTableUpdateCompanionBuilder,
          (Member, BaseReferences<_$AppDatabase, $MembersTable, Member>),
          Member,
          PrefetchHooks Function()
        > {
  $$MembersTableTableManager(_$AppDatabase db, $MembersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<bool> verified = const Value.absent(),
                Value<bool> isAi = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MembersCompanion(
                id: id,
                username: username,
                password: password,
                email: email,
                verified: verified,
                isAi: isAi,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                Value<String> password = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<bool> verified = const Value.absent(),
                Value<bool> isAi = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MembersCompanion.insert(
                id: id,
                username: username,
                password: password,
                email: email,
                verified: verified,
                isAi: isAi,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MembersTable,
      Member,
      $$MembersTableFilterComposer,
      $$MembersTableOrderingComposer,
      $$MembersTableAnnotationComposer,
      $$MembersTableCreateCompanionBuilder,
      $$MembersTableUpdateCompanionBuilder,
      (Member, BaseReferences<_$AppDatabase, $MembersTable, Member>),
      Member,
      PrefetchHooks Function()
    >;
typedef $$MissionHolderTableCreateCompanionBuilder =
    MissionHolderCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<int?> gameTurn,
      Value<String?> type,
      Value<double> distance,
      Value<int> cr,
      Value<int> payout,
      Value<String> bonus,
      Value<int> bonusAmt,
      Value<String?> textContent,
      Value<String?> resultFail,
      Value<String?> resultPass,
    });
typedef $$MissionHolderTableUpdateCompanionBuilder =
    MissionHolderCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<int?> gameTurn,
      Value<String?> type,
      Value<double> distance,
      Value<int> cr,
      Value<int> payout,
      Value<String> bonus,
      Value<int> bonusAmt,
      Value<String?> textContent,
      Value<String?> resultFail,
      Value<String?> resultPass,
    });

class $$MissionHolderTableFilterComposer
    extends Composer<_$AppDatabase, $MissionHolderTable> {
  $$MissionHolderTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cr => $composableBuilder(
    column: $table.cr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get payout => $composableBuilder(
    column: $table.payout,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bonus => $composableBuilder(
    column: $table.bonus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bonusAmt => $composableBuilder(
    column: $table.bonusAmt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultFail => $composableBuilder(
    column: $table.resultFail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultPass => $composableBuilder(
    column: $table.resultPass,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MissionHolderTableOrderingComposer
    extends Composer<_$AppDatabase, $MissionHolderTable> {
  $$MissionHolderTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cr => $composableBuilder(
    column: $table.cr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get payout => $composableBuilder(
    column: $table.payout,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bonus => $composableBuilder(
    column: $table.bonus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bonusAmt => $composableBuilder(
    column: $table.bonusAmt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultFail => $composableBuilder(
    column: $table.resultFail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultPass => $composableBuilder(
    column: $table.resultPass,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MissionHolderTableAnnotationComposer
    extends Composer<_$AppDatabase, $MissionHolderTable> {
  $$MissionHolderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<int> get gameTurn =>
      $composableBuilder(column: $table.gameTurn, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<int> get cr =>
      $composableBuilder(column: $table.cr, builder: (column) => column);

  GeneratedColumn<int> get payout =>
      $composableBuilder(column: $table.payout, builder: (column) => column);

  GeneratedColumn<String> get bonus =>
      $composableBuilder(column: $table.bonus, builder: (column) => column);

  GeneratedColumn<int> get bonusAmt =>
      $composableBuilder(column: $table.bonusAmt, builder: (column) => column);

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultFail => $composableBuilder(
    column: $table.resultFail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultPass => $composableBuilder(
    column: $table.resultPass,
    builder: (column) => column,
  );
}

class $$MissionHolderTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MissionHolderTable,
          MissionHolderEntry,
          $$MissionHolderTableFilterComposer,
          $$MissionHolderTableOrderingComposer,
          $$MissionHolderTableAnnotationComposer,
          $$MissionHolderTableCreateCompanionBuilder,
          $$MissionHolderTableUpdateCompanionBuilder,
          (
            MissionHolderEntry,
            BaseReferences<
              _$AppDatabase,
              $MissionHolderTable,
              MissionHolderEntry
            >,
          ),
          MissionHolderEntry,
          PrefetchHooks Function()
        > {
  $$MissionHolderTableTableManager(_$AppDatabase db, $MissionHolderTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MissionHolderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MissionHolderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MissionHolderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<int?> gameTurn = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<int> cr = const Value.absent(),
                Value<int> payout = const Value.absent(),
                Value<String> bonus = const Value.absent(),
                Value<int> bonusAmt = const Value.absent(),
                Value<String?> textContent = const Value.absent(),
                Value<String?> resultFail = const Value.absent(),
                Value<String?> resultPass = const Value.absent(),
              }) => MissionHolderCompanion(
                id: id,
                corpName: corpName,
                gameTurn: gameTurn,
                type: type,
                distance: distance,
                cr: cr,
                payout: payout,
                bonus: bonus,
                bonusAmt: bonusAmt,
                textContent: textContent,
                resultFail: resultFail,
                resultPass: resultPass,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<int?> gameTurn = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<int> cr = const Value.absent(),
                Value<int> payout = const Value.absent(),
                Value<String> bonus = const Value.absent(),
                Value<int> bonusAmt = const Value.absent(),
                Value<String?> textContent = const Value.absent(),
                Value<String?> resultFail = const Value.absent(),
                Value<String?> resultPass = const Value.absent(),
              }) => MissionHolderCompanion.insert(
                id: id,
                corpName: corpName,
                gameTurn: gameTurn,
                type: type,
                distance: distance,
                cr: cr,
                payout: payout,
                bonus: bonus,
                bonusAmt: bonusAmt,
                textContent: textContent,
                resultFail: resultFail,
                resultPass: resultPass,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MissionHolderTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MissionHolderTable,
      MissionHolderEntry,
      $$MissionHolderTableFilterComposer,
      $$MissionHolderTableOrderingComposer,
      $$MissionHolderTableAnnotationComposer,
      $$MissionHolderTableCreateCompanionBuilder,
      $$MissionHolderTableUpdateCompanionBuilder,
      (
        MissionHolderEntry,
        BaseReferences<_$AppDatabase, $MissionHolderTable, MissionHolderEntry>,
      ),
      MissionHolderEntry,
      PrefetchHooks Function()
    >;
typedef $$MissionInterruptorsTableCreateCompanionBuilder =
    MissionInterruptorsCompanion Function({
      Value<int> id,
      Value<String?> type,
      Value<double?> distance,
      Value<int> cr,
      Value<String?> openingText,
      Value<String?> textContent,
      Value<String?> resultFail,
      Value<String?> resultPass,
    });
typedef $$MissionInterruptorsTableUpdateCompanionBuilder =
    MissionInterruptorsCompanion Function({
      Value<int> id,
      Value<String?> type,
      Value<double?> distance,
      Value<int> cr,
      Value<String?> openingText,
      Value<String?> textContent,
      Value<String?> resultFail,
      Value<String?> resultPass,
    });

class $$MissionInterruptorsTableFilterComposer
    extends Composer<_$AppDatabase, $MissionInterruptorsTable> {
  $$MissionInterruptorsTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cr => $composableBuilder(
    column: $table.cr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get openingText => $composableBuilder(
    column: $table.openingText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultFail => $composableBuilder(
    column: $table.resultFail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultPass => $composableBuilder(
    column: $table.resultPass,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MissionInterruptorsTableOrderingComposer
    extends Composer<_$AppDatabase, $MissionInterruptorsTable> {
  $$MissionInterruptorsTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cr => $composableBuilder(
    column: $table.cr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get openingText => $composableBuilder(
    column: $table.openingText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultFail => $composableBuilder(
    column: $table.resultFail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultPass => $composableBuilder(
    column: $table.resultPass,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MissionInterruptorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MissionInterruptorsTable> {
  $$MissionInterruptorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<int> get cr =>
      $composableBuilder(column: $table.cr, builder: (column) => column);

  GeneratedColumn<String> get openingText => $composableBuilder(
    column: $table.openingText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultFail => $composableBuilder(
    column: $table.resultFail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultPass => $composableBuilder(
    column: $table.resultPass,
    builder: (column) => column,
  );
}

class $$MissionInterruptorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MissionInterruptorsTable,
          MissionInterruptorEntry,
          $$MissionInterruptorsTableFilterComposer,
          $$MissionInterruptorsTableOrderingComposer,
          $$MissionInterruptorsTableAnnotationComposer,
          $$MissionInterruptorsTableCreateCompanionBuilder,
          $$MissionInterruptorsTableUpdateCompanionBuilder,
          (
            MissionInterruptorEntry,
            BaseReferences<
              _$AppDatabase,
              $MissionInterruptorsTable,
              MissionInterruptorEntry
            >,
          ),
          MissionInterruptorEntry,
          PrefetchHooks Function()
        > {
  $$MissionInterruptorsTableTableManager(
    _$AppDatabase db,
    $MissionInterruptorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MissionInterruptorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MissionInterruptorsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MissionInterruptorsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<double?> distance = const Value.absent(),
                Value<int> cr = const Value.absent(),
                Value<String?> openingText = const Value.absent(),
                Value<String?> textContent = const Value.absent(),
                Value<String?> resultFail = const Value.absent(),
                Value<String?> resultPass = const Value.absent(),
              }) => MissionInterruptorsCompanion(
                id: id,
                type: type,
                distance: distance,
                cr: cr,
                openingText: openingText,
                textContent: textContent,
                resultFail: resultFail,
                resultPass: resultPass,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<double?> distance = const Value.absent(),
                Value<int> cr = const Value.absent(),
                Value<String?> openingText = const Value.absent(),
                Value<String?> textContent = const Value.absent(),
                Value<String?> resultFail = const Value.absent(),
                Value<String?> resultPass = const Value.absent(),
              }) => MissionInterruptorsCompanion.insert(
                id: id,
                type: type,
                distance: distance,
                cr: cr,
                openingText: openingText,
                textContent: textContent,
                resultFail: resultFail,
                resultPass: resultPass,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MissionInterruptorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MissionInterruptorsTable,
      MissionInterruptorEntry,
      $$MissionInterruptorsTableFilterComposer,
      $$MissionInterruptorsTableOrderingComposer,
      $$MissionInterruptorsTableAnnotationComposer,
      $$MissionInterruptorsTableCreateCompanionBuilder,
      $$MissionInterruptorsTableUpdateCompanionBuilder,
      (
        MissionInterruptorEntry,
        BaseReferences<
          _$AppDatabase,
          $MissionInterruptorsTable,
          MissionInterruptorEntry
        >,
      ),
      MissionInterruptorEntry,
      PrefetchHooks Function()
    >;
typedef $$MissionTextGeneratorTableCreateCompanionBuilder =
    MissionTextGeneratorCompanion Function({
      Value<int> id,
      Value<String?> innerStation,
      Value<String?> outerStation,
      Value<String?> scienceStation,
      Value<String?> corpOrig,
      Value<String?> corpStyle,
    });
typedef $$MissionTextGeneratorTableUpdateCompanionBuilder =
    MissionTextGeneratorCompanion Function({
      Value<int> id,
      Value<String?> innerStation,
      Value<String?> outerStation,
      Value<String?> scienceStation,
      Value<String?> corpOrig,
      Value<String?> corpStyle,
    });

class $$MissionTextGeneratorTableFilterComposer
    extends Composer<_$AppDatabase, $MissionTextGeneratorTable> {
  $$MissionTextGeneratorTableFilterComposer({
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

  ColumnFilters<String> get innerStation => $composableBuilder(
    column: $table.innerStation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outerStation => $composableBuilder(
    column: $table.outerStation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scienceStation => $composableBuilder(
    column: $table.scienceStation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corpOrig => $composableBuilder(
    column: $table.corpOrig,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corpStyle => $composableBuilder(
    column: $table.corpStyle,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MissionTextGeneratorTableOrderingComposer
    extends Composer<_$AppDatabase, $MissionTextGeneratorTable> {
  $$MissionTextGeneratorTableOrderingComposer({
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

  ColumnOrderings<String> get innerStation => $composableBuilder(
    column: $table.innerStation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outerStation => $composableBuilder(
    column: $table.outerStation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scienceStation => $composableBuilder(
    column: $table.scienceStation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corpOrig => $composableBuilder(
    column: $table.corpOrig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corpStyle => $composableBuilder(
    column: $table.corpStyle,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MissionTextGeneratorTableAnnotationComposer
    extends Composer<_$AppDatabase, $MissionTextGeneratorTable> {
  $$MissionTextGeneratorTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get innerStation => $composableBuilder(
    column: $table.innerStation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outerStation => $composableBuilder(
    column: $table.outerStation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scienceStation => $composableBuilder(
    column: $table.scienceStation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get corpOrig =>
      $composableBuilder(column: $table.corpOrig, builder: (column) => column);

  GeneratedColumn<String> get corpStyle =>
      $composableBuilder(column: $table.corpStyle, builder: (column) => column);
}

class $$MissionTextGeneratorTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MissionTextGeneratorTable,
          MissionTextGeneratorEntry,
          $$MissionTextGeneratorTableFilterComposer,
          $$MissionTextGeneratorTableOrderingComposer,
          $$MissionTextGeneratorTableAnnotationComposer,
          $$MissionTextGeneratorTableCreateCompanionBuilder,
          $$MissionTextGeneratorTableUpdateCompanionBuilder,
          (
            MissionTextGeneratorEntry,
            BaseReferences<
              _$AppDatabase,
              $MissionTextGeneratorTable,
              MissionTextGeneratorEntry
            >,
          ),
          MissionTextGeneratorEntry,
          PrefetchHooks Function()
        > {
  $$MissionTextGeneratorTableTableManager(
    _$AppDatabase db,
    $MissionTextGeneratorTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MissionTextGeneratorTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MissionTextGeneratorTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MissionTextGeneratorTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> innerStation = const Value.absent(),
                Value<String?> outerStation = const Value.absent(),
                Value<String?> scienceStation = const Value.absent(),
                Value<String?> corpOrig = const Value.absent(),
                Value<String?> corpStyle = const Value.absent(),
              }) => MissionTextGeneratorCompanion(
                id: id,
                innerStation: innerStation,
                outerStation: outerStation,
                scienceStation: scienceStation,
                corpOrig: corpOrig,
                corpStyle: corpStyle,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> innerStation = const Value.absent(),
                Value<String?> outerStation = const Value.absent(),
                Value<String?> scienceStation = const Value.absent(),
                Value<String?> corpOrig = const Value.absent(),
                Value<String?> corpStyle = const Value.absent(),
              }) => MissionTextGeneratorCompanion.insert(
                id: id,
                innerStation: innerStation,
                outerStation: outerStation,
                scienceStation: scienceStation,
                corpOrig: corpOrig,
                corpStyle: corpStyle,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MissionTextGeneratorTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MissionTextGeneratorTable,
      MissionTextGeneratorEntry,
      $$MissionTextGeneratorTableFilterComposer,
      $$MissionTextGeneratorTableOrderingComposer,
      $$MissionTextGeneratorTableAnnotationComposer,
      $$MissionTextGeneratorTableCreateCompanionBuilder,
      $$MissionTextGeneratorTableUpdateCompanionBuilder,
      (
        MissionTextGeneratorEntry,
        BaseReferences<
          _$AppDatabase,
          $MissionTextGeneratorTable,
          MissionTextGeneratorEntry
        >,
      ),
      MissionTextGeneratorEntry,
      PrefetchHooks Function()
    >;
typedef $$RollsTableCreateCompanionBuilder =
    RollsCompanion Function({
      Value<int> id,
      required int die,
      required int value,
      required String user,
      required String quest,
      Value<DateTime> stamp,
    });
typedef $$RollsTableUpdateCompanionBuilder =
    RollsCompanion Function({
      Value<int> id,
      Value<int> die,
      Value<int> value,
      Value<String> user,
      Value<String> quest,
      Value<DateTime> stamp,
    });

class $$RollsTableFilterComposer extends Composer<_$AppDatabase, $RollsTable> {
  $$RollsTableFilterComposer({
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

  ColumnFilters<int> get die => $composableBuilder(
    column: $table.die,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quest => $composableBuilder(
    column: $table.quest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get stamp => $composableBuilder(
    column: $table.stamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RollsTableOrderingComposer
    extends Composer<_$AppDatabase, $RollsTable> {
  $$RollsTableOrderingComposer({
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

  ColumnOrderings<int> get die => $composableBuilder(
    column: $table.die,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quest => $composableBuilder(
    column: $table.quest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get stamp => $composableBuilder(
    column: $table.stamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RollsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RollsTable> {
  $$RollsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get die =>
      $composableBuilder(column: $table.die, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get user =>
      $composableBuilder(column: $table.user, builder: (column) => column);

  GeneratedColumn<String> get quest =>
      $composableBuilder(column: $table.quest, builder: (column) => column);

  GeneratedColumn<DateTime> get stamp =>
      $composableBuilder(column: $table.stamp, builder: (column) => column);
}

class $$RollsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RollsTable,
          Roll,
          $$RollsTableFilterComposer,
          $$RollsTableOrderingComposer,
          $$RollsTableAnnotationComposer,
          $$RollsTableCreateCompanionBuilder,
          $$RollsTableUpdateCompanionBuilder,
          (Roll, BaseReferences<_$AppDatabase, $RollsTable, Roll>),
          Roll,
          PrefetchHooks Function()
        > {
  $$RollsTableTableManager(_$AppDatabase db, $RollsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RollsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RollsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RollsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> die = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<String> user = const Value.absent(),
                Value<String> quest = const Value.absent(),
                Value<DateTime> stamp = const Value.absent(),
              }) => RollsCompanion(
                id: id,
                die: die,
                value: value,
                user: user,
                quest: quest,
                stamp: stamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int die,
                required int value,
                required String user,
                required String quest,
                Value<DateTime> stamp = const Value.absent(),
              }) => RollsCompanion.insert(
                id: id,
                die: die,
                value: value,
                user: user,
                quest: quest,
                stamp: stamp,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RollsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RollsTable,
      Roll,
      $$RollsTableFilterComposer,
      $$RollsTableOrderingComposer,
      $$RollsTableAnnotationComposer,
      $$RollsTableCreateCompanionBuilder,
      $$RollsTableUpdateCompanionBuilder,
      (Roll, BaseReferences<_$AppDatabase, $RollsTable, Roll>),
      Roll,
      PrefetchHooks Function()
    >;
typedef $$SalvageTableCreateCompanionBuilder =
    SalvageCompanion Function({
      Value<int> id,
      required String salvageName,
      required String corpName,
      Value<int> m3,
      Value<int> surfaceM,
      Value<int> zeroGM,
      Value<int> conductiveM,
      Value<int> lifeSuppG,
      Value<int> fuelG,
      Value<int> ove,
      Value<int> waterIce,
    });
typedef $$SalvageTableUpdateCompanionBuilder =
    SalvageCompanion Function({
      Value<int> id,
      Value<String> salvageName,
      Value<String> corpName,
      Value<int> m3,
      Value<int> surfaceM,
      Value<int> zeroGM,
      Value<int> conductiveM,
      Value<int> lifeSuppG,
      Value<int> fuelG,
      Value<int> ove,
      Value<int> waterIce,
    });

class $$SalvageTableFilterComposer
    extends Composer<_$AppDatabase, $SalvageTable> {
  $$SalvageTableFilterComposer({
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

  ColumnFilters<String> get salvageName => $composableBuilder(
    column: $table.salvageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get m3 => $composableBuilder(
    column: $table.m3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surfaceM => $composableBuilder(
    column: $table.surfaceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get zeroGM => $composableBuilder(
    column: $table.zeroGM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get conductiveM => $composableBuilder(
    column: $table.conductiveM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lifeSuppG => $composableBuilder(
    column: $table.lifeSuppG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fuelG => $composableBuilder(
    column: $table.fuelG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ove => $composableBuilder(
    column: $table.ove,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waterIce => $composableBuilder(
    column: $table.waterIce,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SalvageTableOrderingComposer
    extends Composer<_$AppDatabase, $SalvageTable> {
  $$SalvageTableOrderingComposer({
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

  ColumnOrderings<String> get salvageName => $composableBuilder(
    column: $table.salvageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get m3 => $composableBuilder(
    column: $table.m3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surfaceM => $composableBuilder(
    column: $table.surfaceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get zeroGM => $composableBuilder(
    column: $table.zeroGM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get conductiveM => $composableBuilder(
    column: $table.conductiveM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lifeSuppG => $composableBuilder(
    column: $table.lifeSuppG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fuelG => $composableBuilder(
    column: $table.fuelG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ove => $composableBuilder(
    column: $table.ove,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waterIce => $composableBuilder(
    column: $table.waterIce,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalvageTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalvageTable> {
  $$SalvageTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get salvageName => $composableBuilder(
    column: $table.salvageName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<int> get m3 =>
      $composableBuilder(column: $table.m3, builder: (column) => column);

  GeneratedColumn<int> get surfaceM =>
      $composableBuilder(column: $table.surfaceM, builder: (column) => column);

  GeneratedColumn<int> get zeroGM =>
      $composableBuilder(column: $table.zeroGM, builder: (column) => column);

  GeneratedColumn<int> get conductiveM => $composableBuilder(
    column: $table.conductiveM,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lifeSuppG =>
      $composableBuilder(column: $table.lifeSuppG, builder: (column) => column);

  GeneratedColumn<int> get fuelG =>
      $composableBuilder(column: $table.fuelG, builder: (column) => column);

  GeneratedColumn<int> get ove =>
      $composableBuilder(column: $table.ove, builder: (column) => column);

  GeneratedColumn<int> get waterIce =>
      $composableBuilder(column: $table.waterIce, builder: (column) => column);
}

class $$SalvageTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalvageTable,
          SalvageEntry,
          $$SalvageTableFilterComposer,
          $$SalvageTableOrderingComposer,
          $$SalvageTableAnnotationComposer,
          $$SalvageTableCreateCompanionBuilder,
          $$SalvageTableUpdateCompanionBuilder,
          (
            SalvageEntry,
            BaseReferences<_$AppDatabase, $SalvageTable, SalvageEntry>,
          ),
          SalvageEntry,
          PrefetchHooks Function()
        > {
  $$SalvageTableTableManager(_$AppDatabase db, $SalvageTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalvageTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalvageTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalvageTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> salvageName = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<int> m3 = const Value.absent(),
                Value<int> surfaceM = const Value.absent(),
                Value<int> zeroGM = const Value.absent(),
                Value<int> conductiveM = const Value.absent(),
                Value<int> lifeSuppG = const Value.absent(),
                Value<int> fuelG = const Value.absent(),
                Value<int> ove = const Value.absent(),
                Value<int> waterIce = const Value.absent(),
              }) => SalvageCompanion(
                id: id,
                salvageName: salvageName,
                corpName: corpName,
                m3: m3,
                surfaceM: surfaceM,
                zeroGM: zeroGM,
                conductiveM: conductiveM,
                lifeSuppG: lifeSuppG,
                fuelG: fuelG,
                ove: ove,
                waterIce: waterIce,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String salvageName,
                required String corpName,
                Value<int> m3 = const Value.absent(),
                Value<int> surfaceM = const Value.absent(),
                Value<int> zeroGM = const Value.absent(),
                Value<int> conductiveM = const Value.absent(),
                Value<int> lifeSuppG = const Value.absent(),
                Value<int> fuelG = const Value.absent(),
                Value<int> ove = const Value.absent(),
                Value<int> waterIce = const Value.absent(),
              }) => SalvageCompanion.insert(
                id: id,
                salvageName: salvageName,
                corpName: corpName,
                m3: m3,
                surfaceM: surfaceM,
                zeroGM: zeroGM,
                conductiveM: conductiveM,
                lifeSuppG: lifeSuppG,
                fuelG: fuelG,
                ove: ove,
                waterIce: waterIce,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SalvageTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalvageTable,
      SalvageEntry,
      $$SalvageTableFilterComposer,
      $$SalvageTableOrderingComposer,
      $$SalvageTableAnnotationComposer,
      $$SalvageTableCreateCompanionBuilder,
      $$SalvageTableUpdateCompanionBuilder,
      (
        SalvageEntry,
        BaseReferences<_$AppDatabase, $SalvageTable, SalvageEntry>,
      ),
      SalvageEntry,
      PrefetchHooks Function()
    >;
typedef $$ScavengeListTableCreateCompanionBuilder =
    ScavengeListCompanion Function({
      Value<int> id,
      Value<String?> houseNumber,
      Value<String?> houseItem,
      Value<String?> rawNumber,
      Value<String?> rawLength,
      Value<String?> rawItem,
    });
typedef $$ScavengeListTableUpdateCompanionBuilder =
    ScavengeListCompanion Function({
      Value<int> id,
      Value<String?> houseNumber,
      Value<String?> houseItem,
      Value<String?> rawNumber,
      Value<String?> rawLength,
      Value<String?> rawItem,
    });

class $$ScavengeListTableFilterComposer
    extends Composer<_$AppDatabase, $ScavengeListTable> {
  $$ScavengeListTableFilterComposer({
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

  ColumnFilters<String> get houseNumber => $composableBuilder(
    column: $table.houseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get houseItem => $composableBuilder(
    column: $table.houseItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawNumber => $composableBuilder(
    column: $table.rawNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawLength => $composableBuilder(
    column: $table.rawLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawItem => $composableBuilder(
    column: $table.rawItem,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScavengeListTableOrderingComposer
    extends Composer<_$AppDatabase, $ScavengeListTable> {
  $$ScavengeListTableOrderingComposer({
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

  ColumnOrderings<String> get houseNumber => $composableBuilder(
    column: $table.houseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get houseItem => $composableBuilder(
    column: $table.houseItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawNumber => $composableBuilder(
    column: $table.rawNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawLength => $composableBuilder(
    column: $table.rawLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawItem => $composableBuilder(
    column: $table.rawItem,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScavengeListTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScavengeListTable> {
  $$ScavengeListTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get houseNumber => $composableBuilder(
    column: $table.houseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get houseItem =>
      $composableBuilder(column: $table.houseItem, builder: (column) => column);

  GeneratedColumn<String> get rawNumber =>
      $composableBuilder(column: $table.rawNumber, builder: (column) => column);

  GeneratedColumn<String> get rawLength =>
      $composableBuilder(column: $table.rawLength, builder: (column) => column);

  GeneratedColumn<String> get rawItem =>
      $composableBuilder(column: $table.rawItem, builder: (column) => column);
}

class $$ScavengeListTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScavengeListTable,
          ScavengeListEntry,
          $$ScavengeListTableFilterComposer,
          $$ScavengeListTableOrderingComposer,
          $$ScavengeListTableAnnotationComposer,
          $$ScavengeListTableCreateCompanionBuilder,
          $$ScavengeListTableUpdateCompanionBuilder,
          (
            ScavengeListEntry,
            BaseReferences<
              _$AppDatabase,
              $ScavengeListTable,
              ScavengeListEntry
            >,
          ),
          ScavengeListEntry,
          PrefetchHooks Function()
        > {
  $$ScavengeListTableTableManager(_$AppDatabase db, $ScavengeListTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScavengeListTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScavengeListTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScavengeListTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> houseNumber = const Value.absent(),
                Value<String?> houseItem = const Value.absent(),
                Value<String?> rawNumber = const Value.absent(),
                Value<String?> rawLength = const Value.absent(),
                Value<String?> rawItem = const Value.absent(),
              }) => ScavengeListCompanion(
                id: id,
                houseNumber: houseNumber,
                houseItem: houseItem,
                rawNumber: rawNumber,
                rawLength: rawLength,
                rawItem: rawItem,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> houseNumber = const Value.absent(),
                Value<String?> houseItem = const Value.absent(),
                Value<String?> rawNumber = const Value.absent(),
                Value<String?> rawLength = const Value.absent(),
                Value<String?> rawItem = const Value.absent(),
              }) => ScavengeListCompanion.insert(
                id: id,
                houseNumber: houseNumber,
                houseItem: houseItem,
                rawNumber: rawNumber,
                rawLength: rawLength,
                rawItem: rawItem,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScavengeListTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScavengeListTable,
      ScavengeListEntry,
      $$ScavengeListTableFilterComposer,
      $$ScavengeListTableOrderingComposer,
      $$ScavengeListTableAnnotationComposer,
      $$ScavengeListTableCreateCompanionBuilder,
      $$ScavengeListTableUpdateCompanionBuilder,
      (
        ScavengeListEntry,
        BaseReferences<_$AppDatabase, $ScavengeListTable, ScavengeListEntry>,
      ),
      ScavengeListEntry,
      PrefetchHooks Function()
    >;
typedef $$ShipModelsTableCreateCompanionBuilder =
    ShipModelsCompanion Function({
      Value<int> id,
      Value<String?> milCiv,
      Value<String?> mfg,
      Value<String?> shipClass,
      Value<int> size,
      required String model,
      Value<int> weap,
      Value<int> armor,
      Value<int> bays,
      Value<int> cargo,
      Value<int> engines,
      Value<int> maneuv,
      Value<int> weapCtrl,
      Value<int> cloak,
      Value<int> lifeSupp,
      Value<int> maxCargo,
      Value<int> maxEngines,
      Value<int> maxManeuv,
      Value<int> maxWeapCtrl,
      Value<int> maxLifeSupp,
      Value<int> hp,
      Value<int> maxHp,
      Value<int> baseValue,
    });
typedef $$ShipModelsTableUpdateCompanionBuilder =
    ShipModelsCompanion Function({
      Value<int> id,
      Value<String?> milCiv,
      Value<String?> mfg,
      Value<String?> shipClass,
      Value<int> size,
      Value<String> model,
      Value<int> weap,
      Value<int> armor,
      Value<int> bays,
      Value<int> cargo,
      Value<int> engines,
      Value<int> maneuv,
      Value<int> weapCtrl,
      Value<int> cloak,
      Value<int> lifeSupp,
      Value<int> maxCargo,
      Value<int> maxEngines,
      Value<int> maxManeuv,
      Value<int> maxWeapCtrl,
      Value<int> maxLifeSupp,
      Value<int> hp,
      Value<int> maxHp,
      Value<int> baseValue,
    });

class $$ShipModelsTableFilterComposer
    extends Composer<_$AppDatabase, $ShipModelsTable> {
  $$ShipModelsTableFilterComposer({
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

  ColumnFilters<String> get milCiv => $composableBuilder(
    column: $table.milCiv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mfg => $composableBuilder(
    column: $table.mfg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipClass => $composableBuilder(
    column: $table.shipClass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weap => $composableBuilder(
    column: $table.weap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get armor => $composableBuilder(
    column: $table.armor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bays => $composableBuilder(
    column: $table.bays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cargo => $composableBuilder(
    column: $table.cargo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get engines => $composableBuilder(
    column: $table.engines,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maneuv => $composableBuilder(
    column: $table.maneuv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weapCtrl => $composableBuilder(
    column: $table.weapCtrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cloak => $composableBuilder(
    column: $table.cloak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lifeSupp => $composableBuilder(
    column: $table.lifeSupp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxCargo => $composableBuilder(
    column: $table.maxCargo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxEngines => $composableBuilder(
    column: $table.maxEngines,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxManeuv => $composableBuilder(
    column: $table.maxManeuv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxWeapCtrl => $composableBuilder(
    column: $table.maxWeapCtrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxLifeSupp => $composableBuilder(
    column: $table.maxLifeSupp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hp => $composableBuilder(
    column: $table.hp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseValue => $composableBuilder(
    column: $table.baseValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShipModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipModelsTable> {
  $$ShipModelsTableOrderingComposer({
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

  ColumnOrderings<String> get milCiv => $composableBuilder(
    column: $table.milCiv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mfg => $composableBuilder(
    column: $table.mfg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipClass => $composableBuilder(
    column: $table.shipClass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weap => $composableBuilder(
    column: $table.weap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get armor => $composableBuilder(
    column: $table.armor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bays => $composableBuilder(
    column: $table.bays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cargo => $composableBuilder(
    column: $table.cargo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get engines => $composableBuilder(
    column: $table.engines,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maneuv => $composableBuilder(
    column: $table.maneuv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weapCtrl => $composableBuilder(
    column: $table.weapCtrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cloak => $composableBuilder(
    column: $table.cloak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lifeSupp => $composableBuilder(
    column: $table.lifeSupp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxCargo => $composableBuilder(
    column: $table.maxCargo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxEngines => $composableBuilder(
    column: $table.maxEngines,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxManeuv => $composableBuilder(
    column: $table.maxManeuv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxWeapCtrl => $composableBuilder(
    column: $table.maxWeapCtrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxLifeSupp => $composableBuilder(
    column: $table.maxLifeSupp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hp => $composableBuilder(
    column: $table.hp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHp => $composableBuilder(
    column: $table.maxHp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseValue => $composableBuilder(
    column: $table.baseValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShipModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipModelsTable> {
  $$ShipModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get milCiv =>
      $composableBuilder(column: $table.milCiv, builder: (column) => column);

  GeneratedColumn<String> get mfg =>
      $composableBuilder(column: $table.mfg, builder: (column) => column);

  GeneratedColumn<String> get shipClass =>
      $composableBuilder(column: $table.shipClass, builder: (column) => column);

  GeneratedColumn<int> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<int> get weap =>
      $composableBuilder(column: $table.weap, builder: (column) => column);

  GeneratedColumn<int> get armor =>
      $composableBuilder(column: $table.armor, builder: (column) => column);

  GeneratedColumn<int> get bays =>
      $composableBuilder(column: $table.bays, builder: (column) => column);

  GeneratedColumn<int> get cargo =>
      $composableBuilder(column: $table.cargo, builder: (column) => column);

  GeneratedColumn<int> get engines =>
      $composableBuilder(column: $table.engines, builder: (column) => column);

  GeneratedColumn<int> get maneuv =>
      $composableBuilder(column: $table.maneuv, builder: (column) => column);

  GeneratedColumn<int> get weapCtrl =>
      $composableBuilder(column: $table.weapCtrl, builder: (column) => column);

  GeneratedColumn<int> get cloak =>
      $composableBuilder(column: $table.cloak, builder: (column) => column);

  GeneratedColumn<int> get lifeSupp =>
      $composableBuilder(column: $table.lifeSupp, builder: (column) => column);

  GeneratedColumn<int> get maxCargo =>
      $composableBuilder(column: $table.maxCargo, builder: (column) => column);

  GeneratedColumn<int> get maxEngines => $composableBuilder(
    column: $table.maxEngines,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxManeuv =>
      $composableBuilder(column: $table.maxManeuv, builder: (column) => column);

  GeneratedColumn<int> get maxWeapCtrl => $composableBuilder(
    column: $table.maxWeapCtrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxLifeSupp => $composableBuilder(
    column: $table.maxLifeSupp,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hp =>
      $composableBuilder(column: $table.hp, builder: (column) => column);

  GeneratedColumn<int> get maxHp =>
      $composableBuilder(column: $table.maxHp, builder: (column) => column);

  GeneratedColumn<int> get baseValue =>
      $composableBuilder(column: $table.baseValue, builder: (column) => column);
}

class $$ShipModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShipModelsTable,
          ShipModelEntry,
          $$ShipModelsTableFilterComposer,
          $$ShipModelsTableOrderingComposer,
          $$ShipModelsTableAnnotationComposer,
          $$ShipModelsTableCreateCompanionBuilder,
          $$ShipModelsTableUpdateCompanionBuilder,
          (
            ShipModelEntry,
            BaseReferences<_$AppDatabase, $ShipModelsTable, ShipModelEntry>,
          ),
          ShipModelEntry,
          PrefetchHooks Function()
        > {
  $$ShipModelsTableTableManager(_$AppDatabase db, $ShipModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> milCiv = const Value.absent(),
                Value<String?> mfg = const Value.absent(),
                Value<String?> shipClass = const Value.absent(),
                Value<int> size = const Value.absent(),
                Value<String> model = const Value.absent(),
                Value<int> weap = const Value.absent(),
                Value<int> armor = const Value.absent(),
                Value<int> bays = const Value.absent(),
                Value<int> cargo = const Value.absent(),
                Value<int> engines = const Value.absent(),
                Value<int> maneuv = const Value.absent(),
                Value<int> weapCtrl = const Value.absent(),
                Value<int> cloak = const Value.absent(),
                Value<int> lifeSupp = const Value.absent(),
                Value<int> maxCargo = const Value.absent(),
                Value<int> maxEngines = const Value.absent(),
                Value<int> maxManeuv = const Value.absent(),
                Value<int> maxWeapCtrl = const Value.absent(),
                Value<int> maxLifeSupp = const Value.absent(),
                Value<int> hp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> baseValue = const Value.absent(),
              }) => ShipModelsCompanion(
                id: id,
                milCiv: milCiv,
                mfg: mfg,
                shipClass: shipClass,
                size: size,
                model: model,
                weap: weap,
                armor: armor,
                bays: bays,
                cargo: cargo,
                engines: engines,
                maneuv: maneuv,
                weapCtrl: weapCtrl,
                cloak: cloak,
                lifeSupp: lifeSupp,
                maxCargo: maxCargo,
                maxEngines: maxEngines,
                maxManeuv: maxManeuv,
                maxWeapCtrl: maxWeapCtrl,
                maxLifeSupp: maxLifeSupp,
                hp: hp,
                maxHp: maxHp,
                baseValue: baseValue,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> milCiv = const Value.absent(),
                Value<String?> mfg = const Value.absent(),
                Value<String?> shipClass = const Value.absent(),
                Value<int> size = const Value.absent(),
                required String model,
                Value<int> weap = const Value.absent(),
                Value<int> armor = const Value.absent(),
                Value<int> bays = const Value.absent(),
                Value<int> cargo = const Value.absent(),
                Value<int> engines = const Value.absent(),
                Value<int> maneuv = const Value.absent(),
                Value<int> weapCtrl = const Value.absent(),
                Value<int> cloak = const Value.absent(),
                Value<int> lifeSupp = const Value.absent(),
                Value<int> maxCargo = const Value.absent(),
                Value<int> maxEngines = const Value.absent(),
                Value<int> maxManeuv = const Value.absent(),
                Value<int> maxWeapCtrl = const Value.absent(),
                Value<int> maxLifeSupp = const Value.absent(),
                Value<int> hp = const Value.absent(),
                Value<int> maxHp = const Value.absent(),
                Value<int> baseValue = const Value.absent(),
              }) => ShipModelsCompanion.insert(
                id: id,
                milCiv: milCiv,
                mfg: mfg,
                shipClass: shipClass,
                size: size,
                model: model,
                weap: weap,
                armor: armor,
                bays: bays,
                cargo: cargo,
                engines: engines,
                maneuv: maneuv,
                weapCtrl: weapCtrl,
                cloak: cloak,
                lifeSupp: lifeSupp,
                maxCargo: maxCargo,
                maxEngines: maxEngines,
                maxManeuv: maxManeuv,
                maxWeapCtrl: maxWeapCtrl,
                maxLifeSupp: maxLifeSupp,
                hp: hp,
                maxHp: maxHp,
                baseValue: baseValue,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShipModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShipModelsTable,
      ShipModelEntry,
      $$ShipModelsTableFilterComposer,
      $$ShipModelsTableOrderingComposer,
      $$ShipModelsTableAnnotationComposer,
      $$ShipModelsTableCreateCompanionBuilder,
      $$ShipModelsTableUpdateCompanionBuilder,
      (
        ShipModelEntry,
        BaseReferences<_$AppDatabase, $ShipModelsTable, ShipModelEntry>,
      ),
      ShipModelEntry,
      PrefetchHooks Function()
    >;
typedef $$ShipModsTableCreateCompanionBuilder =
    ShipModsCompanion Function({
      Value<int> modId,
      Value<String?> shipName,
      Value<String?> modType,
      Value<String?> modName,
      Value<int> power,
    });
typedef $$ShipModsTableUpdateCompanionBuilder =
    ShipModsCompanion Function({
      Value<int> modId,
      Value<String?> shipName,
      Value<String?> modType,
      Value<String?> modName,
      Value<int> power,
    });

class $$ShipModsTableFilterComposer
    extends Composer<_$AppDatabase, $ShipModsTable> {
  $$ShipModsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get modId => $composableBuilder(
    column: $table.modId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modType => $composableBuilder(
    column: $table.modType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modName => $composableBuilder(
    column: $table.modName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get power => $composableBuilder(
    column: $table.power,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShipModsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipModsTable> {
  $$ShipModsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get modId => $composableBuilder(
    column: $table.modId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modType => $composableBuilder(
    column: $table.modType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modName => $composableBuilder(
    column: $table.modName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get power => $composableBuilder(
    column: $table.power,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShipModsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipModsTable> {
  $$ShipModsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get modId =>
      $composableBuilder(column: $table.modId, builder: (column) => column);

  GeneratedColumn<String> get shipName =>
      $composableBuilder(column: $table.shipName, builder: (column) => column);

  GeneratedColumn<String> get modType =>
      $composableBuilder(column: $table.modType, builder: (column) => column);

  GeneratedColumn<String> get modName =>
      $composableBuilder(column: $table.modName, builder: (column) => column);

  GeneratedColumn<int> get power =>
      $composableBuilder(column: $table.power, builder: (column) => column);
}

class $$ShipModsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShipModsTable,
          ShipMod,
          $$ShipModsTableFilterComposer,
          $$ShipModsTableOrderingComposer,
          $$ShipModsTableAnnotationComposer,
          $$ShipModsTableCreateCompanionBuilder,
          $$ShipModsTableUpdateCompanionBuilder,
          (ShipMod, BaseReferences<_$AppDatabase, $ShipModsTable, ShipMod>),
          ShipMod,
          PrefetchHooks Function()
        > {
  $$ShipModsTableTableManager(_$AppDatabase db, $ShipModsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipModsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipModsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipModsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> modId = const Value.absent(),
                Value<String?> shipName = const Value.absent(),
                Value<String?> modType = const Value.absent(),
                Value<String?> modName = const Value.absent(),
                Value<int> power = const Value.absent(),
              }) => ShipModsCompanion(
                modId: modId,
                shipName: shipName,
                modType: modType,
                modName: modName,
                power: power,
              ),
          createCompanionCallback:
              ({
                Value<int> modId = const Value.absent(),
                Value<String?> shipName = const Value.absent(),
                Value<String?> modType = const Value.absent(),
                Value<String?> modName = const Value.absent(),
                Value<int> power = const Value.absent(),
              }) => ShipModsCompanion.insert(
                modId: modId,
                shipName: shipName,
                modType: modType,
                modName: modName,
                power: power,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShipModsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShipModsTable,
      ShipMod,
      $$ShipModsTableFilterComposer,
      $$ShipModsTableOrderingComposer,
      $$ShipModsTableAnnotationComposer,
      $$ShipModsTableCreateCompanionBuilder,
      $$ShipModsTableUpdateCompanionBuilder,
      (ShipMod, BaseReferences<_$AppDatabase, $ShipModsTable, ShipMod>),
      ShipMod,
      PrefetchHooks Function()
    >;
typedef $$ShipModsAvailableTableCreateCompanionBuilder =
    ShipModsAvailableCompanion Function({
      Value<int> id,
      Value<String?> modType,
      required String modName,
      Value<int> power,
      Value<int> price,
    });
typedef $$ShipModsAvailableTableUpdateCompanionBuilder =
    ShipModsAvailableCompanion Function({
      Value<int> id,
      Value<String?> modType,
      Value<String> modName,
      Value<int> power,
      Value<int> price,
    });

class $$ShipModsAvailableTableFilterComposer
    extends Composer<_$AppDatabase, $ShipModsAvailableTable> {
  $$ShipModsAvailableTableFilterComposer({
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

  ColumnFilters<String> get modType => $composableBuilder(
    column: $table.modType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modName => $composableBuilder(
    column: $table.modName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get power => $composableBuilder(
    column: $table.power,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShipModsAvailableTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipModsAvailableTable> {
  $$ShipModsAvailableTableOrderingComposer({
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

  ColumnOrderings<String> get modType => $composableBuilder(
    column: $table.modType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modName => $composableBuilder(
    column: $table.modName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get power => $composableBuilder(
    column: $table.power,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShipModsAvailableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipModsAvailableTable> {
  $$ShipModsAvailableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get modType =>
      $composableBuilder(column: $table.modType, builder: (column) => column);

  GeneratedColumn<String> get modName =>
      $composableBuilder(column: $table.modName, builder: (column) => column);

  GeneratedColumn<int> get power =>
      $composableBuilder(column: $table.power, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$ShipModsAvailableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShipModsAvailableTable,
          ShipModAvailable,
          $$ShipModsAvailableTableFilterComposer,
          $$ShipModsAvailableTableOrderingComposer,
          $$ShipModsAvailableTableAnnotationComposer,
          $$ShipModsAvailableTableCreateCompanionBuilder,
          $$ShipModsAvailableTableUpdateCompanionBuilder,
          (
            ShipModAvailable,
            BaseReferences<
              _$AppDatabase,
              $ShipModsAvailableTable,
              ShipModAvailable
            >,
          ),
          ShipModAvailable,
          PrefetchHooks Function()
        > {
  $$ShipModsAvailableTableTableManager(
    _$AppDatabase db,
    $ShipModsAvailableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipModsAvailableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipModsAvailableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipModsAvailableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> modType = const Value.absent(),
                Value<String> modName = const Value.absent(),
                Value<int> power = const Value.absent(),
                Value<int> price = const Value.absent(),
              }) => ShipModsAvailableCompanion(
                id: id,
                modType: modType,
                modName: modName,
                power: power,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> modType = const Value.absent(),
                required String modName,
                Value<int> power = const Value.absent(),
                Value<int> price = const Value.absent(),
              }) => ShipModsAvailableCompanion.insert(
                id: id,
                modType: modType,
                modName: modName,
                power: power,
                price: price,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShipModsAvailableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShipModsAvailableTable,
      ShipModAvailable,
      $$ShipModsAvailableTableFilterComposer,
      $$ShipModsAvailableTableOrderingComposer,
      $$ShipModsAvailableTableAnnotationComposer,
      $$ShipModsAvailableTableCreateCompanionBuilder,
      $$ShipModsAvailableTableUpdateCompanionBuilder,
      (
        ShipModAvailable,
        BaseReferences<
          _$AppDatabase,
          $ShipModsAvailableTable,
          ShipModAvailable
        >,
      ),
      ShipModAvailable,
      PrefetchHooks Function()
    >;
typedef $$ShipPersonalitiesTableCreateCompanionBuilder =
    ShipPersonalitiesCompanion Function({
      Value<int> id,
      required String shipName,
      required String personality,
      Value<int> level,
    });
typedef $$ShipPersonalitiesTableUpdateCompanionBuilder =
    ShipPersonalitiesCompanion Function({
      Value<int> id,
      Value<String> shipName,
      Value<String> personality,
      Value<int> level,
    });

class $$ShipPersonalitiesTableFilterComposer
    extends Composer<_$AppDatabase, $ShipPersonalitiesTable> {
  $$ShipPersonalitiesTableFilterComposer({
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

  ColumnFilters<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShipPersonalitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipPersonalitiesTable> {
  $$ShipPersonalitiesTableOrderingComposer({
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

  ColumnOrderings<String> get shipName => $composableBuilder(
    column: $table.shipName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShipPersonalitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipPersonalitiesTable> {
  $$ShipPersonalitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shipName =>
      $composableBuilder(column: $table.shipName, builder: (column) => column);

  GeneratedColumn<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => column,
  );

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);
}

class $$ShipPersonalitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShipPersonalitiesTable,
          ShipPersonality,
          $$ShipPersonalitiesTableFilterComposer,
          $$ShipPersonalitiesTableOrderingComposer,
          $$ShipPersonalitiesTableAnnotationComposer,
          $$ShipPersonalitiesTableCreateCompanionBuilder,
          $$ShipPersonalitiesTableUpdateCompanionBuilder,
          (
            ShipPersonality,
            BaseReferences<
              _$AppDatabase,
              $ShipPersonalitiesTable,
              ShipPersonality
            >,
          ),
          ShipPersonality,
          PrefetchHooks Function()
        > {
  $$ShipPersonalitiesTableTableManager(
    _$AppDatabase db,
    $ShipPersonalitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipPersonalitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipPersonalitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipPersonalitiesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> shipName = const Value.absent(),
                Value<String> personality = const Value.absent(),
                Value<int> level = const Value.absent(),
              }) => ShipPersonalitiesCompanion(
                id: id,
                shipName: shipName,
                personality: personality,
                level: level,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String shipName,
                required String personality,
                Value<int> level = const Value.absent(),
              }) => ShipPersonalitiesCompanion.insert(
                id: id,
                shipName: shipName,
                personality: personality,
                level: level,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShipPersonalitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShipPersonalitiesTable,
      ShipPersonality,
      $$ShipPersonalitiesTableFilterComposer,
      $$ShipPersonalitiesTableOrderingComposer,
      $$ShipPersonalitiesTableAnnotationComposer,
      $$ShipPersonalitiesTableCreateCompanionBuilder,
      $$ShipPersonalitiesTableUpdateCompanionBuilder,
      (
        ShipPersonality,
        BaseReferences<_$AppDatabase, $ShipPersonalitiesTable, ShipPersonality>,
      ),
      ShipPersonality,
      PrefetchHooks Function()
    >;
typedef $$StationBuildingsTableCreateCompanionBuilder =
    StationBuildingsCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      required String stationName,
      required String buildingType,
      Value<String?> buildingName,
      Value<int> power,
      Value<int> level,
    });
typedef $$StationBuildingsTableUpdateCompanionBuilder =
    StationBuildingsCompanion Function({
      Value<int> id,
      Value<String?> corpName,
      Value<String> stationName,
      Value<String> buildingType,
      Value<String?> buildingName,
      Value<int> power,
      Value<int> level,
    });

class $$StationBuildingsTableFilterComposer
    extends Composer<_$AppDatabase, $StationBuildingsTable> {
  $$StationBuildingsTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stationName => $composableBuilder(
    column: $table.stationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buildingType => $composableBuilder(
    column: $table.buildingType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buildingName => $composableBuilder(
    column: $table.buildingName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get power => $composableBuilder(
    column: $table.power,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StationBuildingsTableOrderingComposer
    extends Composer<_$AppDatabase, $StationBuildingsTable> {
  $$StationBuildingsTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stationName => $composableBuilder(
    column: $table.stationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buildingType => $composableBuilder(
    column: $table.buildingType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buildingName => $composableBuilder(
    column: $table.buildingName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get power => $composableBuilder(
    column: $table.power,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StationBuildingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StationBuildingsTable> {
  $$StationBuildingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<String> get stationName => $composableBuilder(
    column: $table.stationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get buildingType => $composableBuilder(
    column: $table.buildingType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get buildingName => $composableBuilder(
    column: $table.buildingName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get power =>
      $composableBuilder(column: $table.power, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);
}

class $$StationBuildingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StationBuildingsTable,
          StationBuilding,
          $$StationBuildingsTableFilterComposer,
          $$StationBuildingsTableOrderingComposer,
          $$StationBuildingsTableAnnotationComposer,
          $$StationBuildingsTableCreateCompanionBuilder,
          $$StationBuildingsTableUpdateCompanionBuilder,
          (
            StationBuilding,
            BaseReferences<
              _$AppDatabase,
              $StationBuildingsTable,
              StationBuilding
            >,
          ),
          StationBuilding,
          PrefetchHooks Function()
        > {
  $$StationBuildingsTableTableManager(
    _$AppDatabase db,
    $StationBuildingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StationBuildingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StationBuildingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StationBuildingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                Value<String> stationName = const Value.absent(),
                Value<String> buildingType = const Value.absent(),
                Value<String?> buildingName = const Value.absent(),
                Value<int> power = const Value.absent(),
                Value<int> level = const Value.absent(),
              }) => StationBuildingsCompanion(
                id: id,
                corpName: corpName,
                stationName: stationName,
                buildingType: buildingType,
                buildingName: buildingName,
                power: power,
                level: level,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> corpName = const Value.absent(),
                required String stationName,
                required String buildingType,
                Value<String?> buildingName = const Value.absent(),
                Value<int> power = const Value.absent(),
                Value<int> level = const Value.absent(),
              }) => StationBuildingsCompanion.insert(
                id: id,
                corpName: corpName,
                stationName: stationName,
                buildingType: buildingType,
                buildingName: buildingName,
                power: power,
                level: level,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StationBuildingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StationBuildingsTable,
      StationBuilding,
      $$StationBuildingsTableFilterComposer,
      $$StationBuildingsTableOrderingComposer,
      $$StationBuildingsTableAnnotationComposer,
      $$StationBuildingsTableCreateCompanionBuilder,
      $$StationBuildingsTableUpdateCompanionBuilder,
      (
        StationBuilding,
        BaseReferences<_$AppDatabase, $StationBuildingsTable, StationBuilding>,
      ),
      StationBuilding,
      PrefetchHooks Function()
    >;
typedef $$CorpTurnActionsTableCreateCompanionBuilder =
    CorpTurnActionsCompanion Function({
      Value<int> id,
      required String corpName,
      required int gameTurn,
      Value<bool> scanDone,
      Value<bool> mineDone,
      Value<bool> researchDone,
      Value<bool> cadetsDone,
      Value<bool> expeditionDone,
      Value<bool> marketDone,
    });
typedef $$CorpTurnActionsTableUpdateCompanionBuilder =
    CorpTurnActionsCompanion Function({
      Value<int> id,
      Value<String> corpName,
      Value<int> gameTurn,
      Value<bool> scanDone,
      Value<bool> mineDone,
      Value<bool> researchDone,
      Value<bool> cadetsDone,
      Value<bool> expeditionDone,
      Value<bool> marketDone,
    });

class $$CorpTurnActionsTableFilterComposer
    extends Composer<_$AppDatabase, $CorpTurnActionsTable> {
  $$CorpTurnActionsTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get scanDone => $composableBuilder(
    column: $table.scanDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get mineDone => $composableBuilder(
    column: $table.mineDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get researchDone => $composableBuilder(
    column: $table.researchDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get cadetsDone => $composableBuilder(
    column: $table.cadetsDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get expeditionDone => $composableBuilder(
    column: $table.expeditionDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get marketDone => $composableBuilder(
    column: $table.marketDone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CorpTurnActionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CorpTurnActionsTable> {
  $$CorpTurnActionsTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get scanDone => $composableBuilder(
    column: $table.scanDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get mineDone => $composableBuilder(
    column: $table.mineDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get researchDone => $composableBuilder(
    column: $table.researchDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get cadetsDone => $composableBuilder(
    column: $table.cadetsDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get expeditionDone => $composableBuilder(
    column: $table.expeditionDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get marketDone => $composableBuilder(
    column: $table.marketDone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CorpTurnActionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CorpTurnActionsTable> {
  $$CorpTurnActionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<int> get gameTurn =>
      $composableBuilder(column: $table.gameTurn, builder: (column) => column);

  GeneratedColumn<bool> get scanDone =>
      $composableBuilder(column: $table.scanDone, builder: (column) => column);

  GeneratedColumn<bool> get mineDone =>
      $composableBuilder(column: $table.mineDone, builder: (column) => column);

  GeneratedColumn<bool> get researchDone => $composableBuilder(
    column: $table.researchDone,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get cadetsDone => $composableBuilder(
    column: $table.cadetsDone,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get expeditionDone => $composableBuilder(
    column: $table.expeditionDone,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get marketDone => $composableBuilder(
    column: $table.marketDone,
    builder: (column) => column,
  );
}

class $$CorpTurnActionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CorpTurnActionsTable,
          CorpTurnAction,
          $$CorpTurnActionsTableFilterComposer,
          $$CorpTurnActionsTableOrderingComposer,
          $$CorpTurnActionsTableAnnotationComposer,
          $$CorpTurnActionsTableCreateCompanionBuilder,
          $$CorpTurnActionsTableUpdateCompanionBuilder,
          (
            CorpTurnAction,
            BaseReferences<
              _$AppDatabase,
              $CorpTurnActionsTable,
              CorpTurnAction
            >,
          ),
          CorpTurnAction,
          PrefetchHooks Function()
        > {
  $$CorpTurnActionsTableTableManager(
    _$AppDatabase db,
    $CorpTurnActionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CorpTurnActionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CorpTurnActionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CorpTurnActionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<int> gameTurn = const Value.absent(),
                Value<bool> scanDone = const Value.absent(),
                Value<bool> mineDone = const Value.absent(),
                Value<bool> researchDone = const Value.absent(),
                Value<bool> cadetsDone = const Value.absent(),
                Value<bool> expeditionDone = const Value.absent(),
                Value<bool> marketDone = const Value.absent(),
              }) => CorpTurnActionsCompanion(
                id: id,
                corpName: corpName,
                gameTurn: gameTurn,
                scanDone: scanDone,
                mineDone: mineDone,
                researchDone: researchDone,
                cadetsDone: cadetsDone,
                expeditionDone: expeditionDone,
                marketDone: marketDone,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String corpName,
                required int gameTurn,
                Value<bool> scanDone = const Value.absent(),
                Value<bool> mineDone = const Value.absent(),
                Value<bool> researchDone = const Value.absent(),
                Value<bool> cadetsDone = const Value.absent(),
                Value<bool> expeditionDone = const Value.absent(),
                Value<bool> marketDone = const Value.absent(),
              }) => CorpTurnActionsCompanion.insert(
                id: id,
                corpName: corpName,
                gameTurn: gameTurn,
                scanDone: scanDone,
                mineDone: mineDone,
                researchDone: researchDone,
                cadetsDone: cadetsDone,
                expeditionDone: expeditionDone,
                marketDone: marketDone,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CorpTurnActionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CorpTurnActionsTable,
      CorpTurnAction,
      $$CorpTurnActionsTableFilterComposer,
      $$CorpTurnActionsTableOrderingComposer,
      $$CorpTurnActionsTableAnnotationComposer,
      $$CorpTurnActionsTableCreateCompanionBuilder,
      $$CorpTurnActionsTableUpdateCompanionBuilder,
      (
        CorpTurnAction,
        BaseReferences<_$AppDatabase, $CorpTurnActionsTable, CorpTurnAction>,
      ),
      CorpTurnAction,
      PrefetchHooks Function()
    >;
typedef $$CorpFinanceLedgerTableCreateCompanionBuilder =
    CorpFinanceLedgerCompanion Function({
      Value<int> id,
      required String corpName,
      required int gameTurn,
      Value<int> netWorth,
      Value<int> solars,
      Value<int> fleetVal,
      Value<int> materialsVal,
      Value<int> revenue,
      Value<int> expenses,
      Value<String?> notes,
      Value<DateTime> recordedAt,
    });
typedef $$CorpFinanceLedgerTableUpdateCompanionBuilder =
    CorpFinanceLedgerCompanion Function({
      Value<int> id,
      Value<String> corpName,
      Value<int> gameTurn,
      Value<int> netWorth,
      Value<int> solars,
      Value<int> fleetVal,
      Value<int> materialsVal,
      Value<int> revenue,
      Value<int> expenses,
      Value<String?> notes,
      Value<DateTime> recordedAt,
    });

class $$CorpFinanceLedgerTableFilterComposer
    extends Composer<_$AppDatabase, $CorpFinanceLedgerTable> {
  $$CorpFinanceLedgerTableFilterComposer({
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

  ColumnFilters<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get netWorth => $composableBuilder(
    column: $table.netWorth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get solars => $composableBuilder(
    column: $table.solars,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fleetVal => $composableBuilder(
    column: $table.fleetVal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get materialsVal => $composableBuilder(
    column: $table.materialsVal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revenue => $composableBuilder(
    column: $table.revenue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expenses => $composableBuilder(
    column: $table.expenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CorpFinanceLedgerTableOrderingComposer
    extends Composer<_$AppDatabase, $CorpFinanceLedgerTable> {
  $$CorpFinanceLedgerTableOrderingComposer({
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

  ColumnOrderings<String> get corpName => $composableBuilder(
    column: $table.corpName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gameTurn => $composableBuilder(
    column: $table.gameTurn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get netWorth => $composableBuilder(
    column: $table.netWorth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get solars => $composableBuilder(
    column: $table.solars,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fleetVal => $composableBuilder(
    column: $table.fleetVal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get materialsVal => $composableBuilder(
    column: $table.materialsVal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revenue => $composableBuilder(
    column: $table.revenue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expenses => $composableBuilder(
    column: $table.expenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CorpFinanceLedgerTableAnnotationComposer
    extends Composer<_$AppDatabase, $CorpFinanceLedgerTable> {
  $$CorpFinanceLedgerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get corpName =>
      $composableBuilder(column: $table.corpName, builder: (column) => column);

  GeneratedColumn<int> get gameTurn =>
      $composableBuilder(column: $table.gameTurn, builder: (column) => column);

  GeneratedColumn<int> get netWorth =>
      $composableBuilder(column: $table.netWorth, builder: (column) => column);

  GeneratedColumn<int> get solars =>
      $composableBuilder(column: $table.solars, builder: (column) => column);

  GeneratedColumn<int> get fleetVal =>
      $composableBuilder(column: $table.fleetVal, builder: (column) => column);

  GeneratedColumn<int> get materialsVal => $composableBuilder(
    column: $table.materialsVal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revenue =>
      $composableBuilder(column: $table.revenue, builder: (column) => column);

  GeneratedColumn<int> get expenses =>
      $composableBuilder(column: $table.expenses, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );
}

class $$CorpFinanceLedgerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CorpFinanceLedgerTable,
          CorpFinanceLedgerEntry,
          $$CorpFinanceLedgerTableFilterComposer,
          $$CorpFinanceLedgerTableOrderingComposer,
          $$CorpFinanceLedgerTableAnnotationComposer,
          $$CorpFinanceLedgerTableCreateCompanionBuilder,
          $$CorpFinanceLedgerTableUpdateCompanionBuilder,
          (
            CorpFinanceLedgerEntry,
            BaseReferences<
              _$AppDatabase,
              $CorpFinanceLedgerTable,
              CorpFinanceLedgerEntry
            >,
          ),
          CorpFinanceLedgerEntry,
          PrefetchHooks Function()
        > {
  $$CorpFinanceLedgerTableTableManager(
    _$AppDatabase db,
    $CorpFinanceLedgerTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CorpFinanceLedgerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CorpFinanceLedgerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CorpFinanceLedgerTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> corpName = const Value.absent(),
                Value<int> gameTurn = const Value.absent(),
                Value<int> netWorth = const Value.absent(),
                Value<int> solars = const Value.absent(),
                Value<int> fleetVal = const Value.absent(),
                Value<int> materialsVal = const Value.absent(),
                Value<int> revenue = const Value.absent(),
                Value<int> expenses = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => CorpFinanceLedgerCompanion(
                id: id,
                corpName: corpName,
                gameTurn: gameTurn,
                netWorth: netWorth,
                solars: solars,
                fleetVal: fleetVal,
                materialsVal: materialsVal,
                revenue: revenue,
                expenses: expenses,
                notes: notes,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String corpName,
                required int gameTurn,
                Value<int> netWorth = const Value.absent(),
                Value<int> solars = const Value.absent(),
                Value<int> fleetVal = const Value.absent(),
                Value<int> materialsVal = const Value.absent(),
                Value<int> revenue = const Value.absent(),
                Value<int> expenses = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => CorpFinanceLedgerCompanion.insert(
                id: id,
                corpName: corpName,
                gameTurn: gameTurn,
                netWorth: netWorth,
                solars: solars,
                fleetVal: fleetVal,
                materialsVal: materialsVal,
                revenue: revenue,
                expenses: expenses,
                notes: notes,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CorpFinanceLedgerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CorpFinanceLedgerTable,
      CorpFinanceLedgerEntry,
      $$CorpFinanceLedgerTableFilterComposer,
      $$CorpFinanceLedgerTableOrderingComposer,
      $$CorpFinanceLedgerTableAnnotationComposer,
      $$CorpFinanceLedgerTableCreateCompanionBuilder,
      $$CorpFinanceLedgerTableUpdateCompanionBuilder,
      (
        CorpFinanceLedgerEntry,
        BaseReferences<
          _$AppDatabase,
          $CorpFinanceLedgerTable,
          CorpFinanceLedgerEntry
        >,
      ),
      CorpFinanceLedgerEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AsteroidsTableTableManager get asteroids =>
      $$AsteroidsTableTableManager(_db, _db.asteroids);
  $$AsteroidsScannedTableTableManager get asteroidsScanned =>
      $$AsteroidsScannedTableTableManager(_db, _db.asteroidsScanned);
  $$TempAsteroidsScannedTableTableManager get tempAsteroidsScanned =>
      $$TempAsteroidsScannedTableTableManager(_db, _db.tempAsteroidsScanned);
  $$CadetsTableTableManager get cadets =>
      $$CadetsTableTableManager(_db, _db.cadets);
  $$CadetsProgressTableTableManager get cadetsProgress =>
      $$CadetsProgressTableTableManager(_db, _db.cadetsProgress);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$CombatStatsTableTableManager get combatStats =>
      $$CombatStatsTableTableManager(_db, _db.combatStats);
  $$CorpInventoryTableTableManager get corpInventory =>
      $$CorpInventoryTableTableManager(_db, _db.corpInventory);
  $$CorpResearchTableTableManager get corpResearch =>
      $$CorpResearchTableTableManager(_db, _db.corpResearch);
  $$CrewTableTableManager get crew => $$CrewTableTableManager(_db, _db.crew);
  $$CrewGenerateTableTableManager get crewGenerate =>
      $$CrewGenerateTableTableManager(_db, _db.crewGenerate);
  $$FleetTableTableManager get fleet =>
      $$FleetTableTableManager(_db, _db.fleet);
  $$GameDataTableTableManager get gameData =>
      $$GameDataTableTableManager(_db, _db.gameData);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db, _db.members);
  $$MissionHolderTableTableManager get missionHolder =>
      $$MissionHolderTableTableManager(_db, _db.missionHolder);
  $$MissionInterruptorsTableTableManager get missionInterruptors =>
      $$MissionInterruptorsTableTableManager(_db, _db.missionInterruptors);
  $$MissionTextGeneratorTableTableManager get missionTextGenerator =>
      $$MissionTextGeneratorTableTableManager(_db, _db.missionTextGenerator);
  $$RollsTableTableManager get rolls =>
      $$RollsTableTableManager(_db, _db.rolls);
  $$SalvageTableTableManager get salvage =>
      $$SalvageTableTableManager(_db, _db.salvage);
  $$ScavengeListTableTableManager get scavengeList =>
      $$ScavengeListTableTableManager(_db, _db.scavengeList);
  $$ShipModelsTableTableManager get shipModels =>
      $$ShipModelsTableTableManager(_db, _db.shipModels);
  $$ShipModsTableTableManager get shipMods =>
      $$ShipModsTableTableManager(_db, _db.shipMods);
  $$ShipModsAvailableTableTableManager get shipModsAvailable =>
      $$ShipModsAvailableTableTableManager(_db, _db.shipModsAvailable);
  $$ShipPersonalitiesTableTableManager get shipPersonalities =>
      $$ShipPersonalitiesTableTableManager(_db, _db.shipPersonalities);
  $$StationBuildingsTableTableManager get stationBuildings =>
      $$StationBuildingsTableTableManager(_db, _db.stationBuildings);
  $$CorpTurnActionsTableTableManager get corpTurnActions =>
      $$CorpTurnActionsTableTableManager(_db, _db.corpTurnActions);
  $$CorpFinanceLedgerTableTableManager get corpFinanceLedger =>
      $$CorpFinanceLedgerTableTableManager(_db, _db.corpFinanceLedger);
}
