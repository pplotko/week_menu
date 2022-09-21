// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RecipesDataModelData extends DataClass
    implements Insertable<RecipesDataModelData> {
  final String id;
  final String imageName;
  final String datatime;
  final String description;
  final String imgFirstName;
  RecipesDataModelData(
      {required this.id,
      required this.imageName,
      required this.datatime,
      required this.description,
      required this.imgFirstName});
  factory RecipesDataModelData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RecipesDataModelData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      imageName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_name'])!,
      datatime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}datatime'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      imgFirstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}img_first_name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_name'] = Variable<String>(imageName);
    map['datatime'] = Variable<String>(datatime);
    map['description'] = Variable<String>(description);
    map['img_first_name'] = Variable<String>(imgFirstName);
    return map;
  }

  RecipesDataModelCompanion toCompanion(bool nullToAbsent) {
    return RecipesDataModelCompanion(
      id: Value(id),
      imageName: Value(imageName),
      datatime: Value(datatime),
      description: Value(description),
      imgFirstName: Value(imgFirstName),
    );
  }

  factory RecipesDataModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipesDataModelData(
      id: serializer.fromJson<String>(json['id']),
      imageName: serializer.fromJson<String>(json['imageName']),
      datatime: serializer.fromJson<String>(json['datatime']),
      description: serializer.fromJson<String>(json['description']),
      imgFirstName: serializer.fromJson<String>(json['imgFirstName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageName': serializer.toJson<String>(imageName),
      'datatime': serializer.toJson<String>(datatime),
      'description': serializer.toJson<String>(description),
      'imgFirstName': serializer.toJson<String>(imgFirstName),
    };
  }

  RecipesDataModelData copyWith(
          {String? id,
          String? imageName,
          String? datatime,
          String? description,
          String? imgFirstName}) =>
      RecipesDataModelData(
        id: id ?? this.id,
        imageName: imageName ?? this.imageName,
        datatime: datatime ?? this.datatime,
        description: description ?? this.description,
        imgFirstName: imgFirstName ?? this.imgFirstName,
      );
  @override
  String toString() {
    return (StringBuffer('RecipesDataModelData(')
          ..write('id: $id, ')
          ..write('imageName: $imageName, ')
          ..write('datatime: $datatime, ')
          ..write('description: $description, ')
          ..write('imgFirstName: $imgFirstName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, imageName, datatime, description, imgFirstName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipesDataModelData &&
          other.id == this.id &&
          other.imageName == this.imageName &&
          other.datatime == this.datatime &&
          other.description == this.description &&
          other.imgFirstName == this.imgFirstName);
}

class RecipesDataModelCompanion extends UpdateCompanion<RecipesDataModelData> {
  final Value<String> id;
  final Value<String> imageName;
  final Value<String> datatime;
  final Value<String> description;
  final Value<String> imgFirstName;
  const RecipesDataModelCompanion({
    this.id = const Value.absent(),
    this.imageName = const Value.absent(),
    this.datatime = const Value.absent(),
    this.description = const Value.absent(),
    this.imgFirstName = const Value.absent(),
  });
  RecipesDataModelCompanion.insert({
    required String id,
    required String imageName,
    required String datatime,
    required String description,
    required String imgFirstName,
  })  : id = Value(id),
        imageName = Value(imageName),
        datatime = Value(datatime),
        description = Value(description),
        imgFirstName = Value(imgFirstName);
  static Insertable<RecipesDataModelData> custom({
    Expression<String>? id,
    Expression<String>? imageName,
    Expression<String>? datatime,
    Expression<String>? description,
    Expression<String>? imgFirstName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageName != null) 'image_name': imageName,
      if (datatime != null) 'datatime': datatime,
      if (description != null) 'description': description,
      if (imgFirstName != null) 'img_first_name': imgFirstName,
    });
  }

  RecipesDataModelCompanion copyWith(
      {Value<String>? id,
      Value<String>? imageName,
      Value<String>? datatime,
      Value<String>? description,
      Value<String>? imgFirstName}) {
    return RecipesDataModelCompanion(
      id: id ?? this.id,
      imageName: imageName ?? this.imageName,
      datatime: datatime ?? this.datatime,
      description: description ?? this.description,
      imgFirstName: imgFirstName ?? this.imgFirstName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageName.present) {
      map['image_name'] = Variable<String>(imageName.value);
    }
    if (datatime.present) {
      map['datatime'] = Variable<String>(datatime.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imgFirstName.present) {
      map['img_first_name'] = Variable<String>(imgFirstName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesDataModelCompanion(')
          ..write('id: $id, ')
          ..write('imageName: $imageName, ')
          ..write('datatime: $datatime, ')
          ..write('description: $description, ')
          ..write('imgFirstName: $imgFirstName')
          ..write(')'))
        .toString();
  }
}

class $RecipesDataModelTable extends RecipesDataModel
    with TableInfo<$RecipesDataModelTable, RecipesDataModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesDataModelTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageNameMeta = const VerificationMeta('imageName');
  @override
  late final GeneratedColumn<String?> imageName = GeneratedColumn<String?>(
      'image_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _datatimeMeta = const VerificationMeta('datatime');
  @override
  late final GeneratedColumn<String?> datatime = GeneratedColumn<String?>(
      'datatime', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imgFirstNameMeta =
      const VerificationMeta('imgFirstName');
  @override
  late final GeneratedColumn<String?> imgFirstName = GeneratedColumn<String?>(
      'img_first_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, imageName, datatime, description, imgFirstName];
  @override
  String get aliasedName => _alias ?? 'recipes_data_model';
  @override
  String get actualTableName => 'recipes_data_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecipesDataModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_name')) {
      context.handle(_imageNameMeta,
          imageName.isAcceptableOrUnknown(data['image_name']!, _imageNameMeta));
    } else if (isInserting) {
      context.missing(_imageNameMeta);
    }
    if (data.containsKey('datatime')) {
      context.handle(_datatimeMeta,
          datatime.isAcceptableOrUnknown(data['datatime']!, _datatimeMeta));
    } else if (isInserting) {
      context.missing(_datatimeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('img_first_name')) {
      context.handle(
          _imgFirstNameMeta,
          imgFirstName.isAcceptableOrUnknown(
              data['img_first_name']!, _imgFirstNameMeta));
    } else if (isInserting) {
      context.missing(_imgFirstNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  RecipesDataModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RecipesDataModelData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RecipesDataModelTable createAlias(String alias) {
    return $RecipesDataModelTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RecipesDataModelTable recipesDataModel =
      $RecipesDataModelTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recipesDataModel];
}
