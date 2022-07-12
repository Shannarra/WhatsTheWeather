// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetCityCollection on Isar {
  IsarCollection<City> get citys {
    return getCollection('City');
  }
}

final CitySchema = CollectionSchema(
  name: 'City',
  schema:
      '{"name":"City","idName":"id","properties":[{"name":"country","type":"String"},{"name":"latitude","type":"String"},{"name":"localizations","type":"String"},{"name":"longitude","type":"String"},{"name":"name","type":"String"},{"name":"selected","type":"Bool"},{"name":"state","type":"String"}],"indexes":[{"name":"longitude_latitude","unique":false,"properties":[{"name":"longitude","type":"Hash","caseSensitive":true},{"name":"latitude","type":"Hash","caseSensitive":true}]}],"links":[]}',
  nativeAdapter: const _CityNativeAdapter(),
  webAdapter: const _CityWebAdapter(),
  idName: 'id',
  propertyIds: {
    'country': 0,
    'latitude': 1,
    'localizations': 2,
    'longitude': 3,
    'name': 4,
    'selected': 5,
    'state': 6
  },
  listProperties: {},
  indexIds: {'longitude_latitude': 0},
  indexTypes: {
    'longitude_latitude': [
      NativeIndexType.stringHash,
      NativeIndexType.stringHash,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

const _cityMapConverter = MapConverter();

class _CityWebAdapter extends IsarWebTypeAdapter<City> {
  const _CityWebAdapter();

  @override
  Object serialize(IsarCollection<City> collection, City object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'country', object.country);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'latitude', object.latitude);
    IsarNative.jsObjectSet(
        jsObj, 'localizations', _cityMapConverter.toIsar(object.localizations));
    IsarNative.jsObjectSet(jsObj, 'longitude', object.longitude);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'selected', object.selected);
    IsarNative.jsObjectSet(jsObj, 'state', object.state);
    return jsObj;
  }

  @override
  City deserialize(IsarCollection<City> collection, dynamic jsObj) {
    final object = City();
    object.country = IsarNative.jsObjectGet(jsObj, 'country') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.latitude = IsarNative.jsObjectGet(jsObj, 'latitude') ?? '';
    object.localizations = _cityMapConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'localizations') ?? '');
    object.longitude = IsarNative.jsObjectGet(jsObj, 'longitude') ?? '';
    object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
    object.selected = IsarNative.jsObjectGet(jsObj, 'selected') ?? false;
    object.state = IsarNative.jsObjectGet(jsObj, 'state');
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'country':
        return (IsarNative.jsObjectGet(jsObj, 'country') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'latitude':
        return (IsarNative.jsObjectGet(jsObj, 'latitude') ?? '') as P;
      case 'localizations':
        return (_cityMapConverter.fromIsar(
            IsarNative.jsObjectGet(jsObj, 'localizations') ?? '')) as P;
      case 'longitude':
        return (IsarNative.jsObjectGet(jsObj, 'longitude') ?? '') as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
      case 'selected':
        return (IsarNative.jsObjectGet(jsObj, 'selected') ?? false) as P;
      case 'state':
        return (IsarNative.jsObjectGet(jsObj, 'state')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, City object) {}
}

class _CityNativeAdapter extends IsarNativeTypeAdapter<City> {
  const _CityNativeAdapter();

  @override
  void serialize(IsarCollection<City> collection, IsarRawObject rawObj,
      City object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.country;
    final _country = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_country.length) as int;
    final value1 = object.latitude;
    final _latitude = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_latitude.length) as int;
    final value2 = _cityMapConverter.toIsar(object.localizations);
    final _localizations = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_localizations.length) as int;
    final value3 = object.longitude;
    final _longitude = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_longitude.length) as int;
    final value4 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_name.length) as int;
    final value5 = object.selected;
    final _selected = value5;
    final value6 = object.state;
    IsarUint8List? _state;
    if (value6 != null) {
      _state = IsarBinaryWriter.utf8Encoder.convert(value6);
    }
    dynamicSize += (_state?.length ?? 0) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _country);
    writer.writeBytes(offsets[1], _latitude);
    writer.writeBytes(offsets[2], _localizations);
    writer.writeBytes(offsets[3], _longitude);
    writer.writeBytes(offsets[4], _name);
    writer.writeBool(offsets[5], _selected);
    writer.writeBytes(offsets[6], _state);
  }

  @override
  City deserialize(IsarCollection<City> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = City();
    object.country = reader.readString(offsets[0]);
    object.id = id;
    object.latitude = reader.readString(offsets[1]);
    object.localizations =
        _cityMapConverter.fromIsar(reader.readString(offsets[2]));
    object.longitude = reader.readString(offsets[3]);
    object.name = reader.readString(offsets[4]);
    object.selected = reader.readBool(offsets[5]);
    object.state = reader.readStringOrNull(offsets[6]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (_cityMapConverter.fromIsar(reader.readString(offset))) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readBool(offset)) as P;
      case 6:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, City object) {}
}

extension CityQueryWhereSort on QueryBuilder<City, City, QWhere> {
  QueryBuilder<City, City, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<City, City, QAfterWhere> anyLongitudeLatitude() {
    return addWhereClauseInternal(
        const WhereClause(indexName: 'longitude_latitude'));
  }
}

extension CityQueryWhere on QueryBuilder<City, City, QWhereClause> {
  QueryBuilder<City, City, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<City, City, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<City, City, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<City, City, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<City, City, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<City, City, QAfterWhereClause> longitudeEqualTo(
      String longitude) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'longitude_latitude',
      lower: [longitude],
      includeLower: true,
      upper: [longitude],
      includeUpper: true,
    ));
  }

  QueryBuilder<City, City, QAfterWhereClause> longitudeNotEqualTo(
      String longitude) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        upper: [longitude],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        lower: [longitude],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        lower: [longitude],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        upper: [longitude],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<City, City, QAfterWhereClause> longitudeLatitudeEqualTo(
      String longitude, String latitude) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'longitude_latitude',
      lower: [longitude, latitude],
      includeLower: true,
      upper: [longitude, latitude],
      includeUpper: true,
    ));
  }

  QueryBuilder<City, City, QAfterWhereClause> longitudeLatitudeNotEqualTo(
      String longitude, String latitude) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        upper: [longitude, latitude],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        lower: [longitude, latitude],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        lower: [longitude, latitude],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'longitude_latitude',
        upper: [longitude, latitude],
        includeUpper: false,
      ));
    }
  }
}

extension CityQueryFilter on QueryBuilder<City, City, QFilterCondition> {
  QueryBuilder<City, City, QAfterFilterCondition> countryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> countryGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> countryLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> countryBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'country',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> countryContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'country',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> countryMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'country',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'latitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'latitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'latitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'latitude',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'latitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'latitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'latitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> latitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'latitude',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsEqualTo(
    Map<String, Object> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'localizations',
      value: _cityMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsGreaterThan(
    Map<String, Object> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'localizations',
      value: _cityMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsLessThan(
    Map<String, Object> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'localizations',
      value: _cityMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsBetween(
    Map<String, Object> lower,
    Map<String, Object> upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'localizations',
      lower: _cityMapConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _cityMapConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsStartsWith(
    Map<String, Object> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'localizations',
      value: _cityMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsEndsWith(
    Map<String, Object> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'localizations',
      value: _cityMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsContains(
      Map<String, Object> value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'localizations',
      value: _cityMapConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> localizationsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'localizations',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'longitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'longitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'longitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'longitude',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'longitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'longitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'longitude',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> longitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'longitude',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> selectedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'selected',
      value: value,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'state',
      value: null,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'state',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'state',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'state',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'state',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'state',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'state',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'state',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<City, City, QAfterFilterCondition> stateMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'state',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension CityQueryLinks on QueryBuilder<City, City, QFilterCondition> {}

extension CityQueryWhereSortBy on QueryBuilder<City, City, QSortBy> {
  QueryBuilder<City, City, QAfterSortBy> sortByCountry() {
    return addSortByInternal('country', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByCountryDesc() {
    return addSortByInternal('country', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByLatitude() {
    return addSortByInternal('latitude', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByLatitudeDesc() {
    return addSortByInternal('latitude', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByLocalizations() {
    return addSortByInternal('localizations', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByLocalizationsDesc() {
    return addSortByInternal('localizations', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByLongitude() {
    return addSortByInternal('longitude', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByLongitudeDesc() {
    return addSortByInternal('longitude', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortBySelected() {
    return addSortByInternal('selected', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortBySelectedDesc() {
    return addSortByInternal('selected', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByState() {
    return addSortByInternal('state', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> sortByStateDesc() {
    return addSortByInternal('state', Sort.desc);
  }
}

extension CityQueryWhereSortThenBy on QueryBuilder<City, City, QSortThenBy> {
  QueryBuilder<City, City, QAfterSortBy> thenByCountry() {
    return addSortByInternal('country', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByCountryDesc() {
    return addSortByInternal('country', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByLatitude() {
    return addSortByInternal('latitude', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByLatitudeDesc() {
    return addSortByInternal('latitude', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByLocalizations() {
    return addSortByInternal('localizations', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByLocalizationsDesc() {
    return addSortByInternal('localizations', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByLongitude() {
    return addSortByInternal('longitude', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByLongitudeDesc() {
    return addSortByInternal('longitude', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenBySelected() {
    return addSortByInternal('selected', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenBySelectedDesc() {
    return addSortByInternal('selected', Sort.desc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByState() {
    return addSortByInternal('state', Sort.asc);
  }

  QueryBuilder<City, City, QAfterSortBy> thenByStateDesc() {
    return addSortByInternal('state', Sort.desc);
  }
}

extension CityQueryWhereDistinct on QueryBuilder<City, City, QDistinct> {
  QueryBuilder<City, City, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('country', caseSensitive: caseSensitive);
  }

  QueryBuilder<City, City, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<City, City, QDistinct> distinctByLatitude(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('latitude', caseSensitive: caseSensitive);
  }

  QueryBuilder<City, City, QDistinct> distinctByLocalizations(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('localizations', caseSensitive: caseSensitive);
  }

  QueryBuilder<City, City, QDistinct> distinctByLongitude(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('longitude', caseSensitive: caseSensitive);
  }

  QueryBuilder<City, City, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<City, City, QDistinct> distinctBySelected() {
    return addDistinctByInternal('selected');
  }

  QueryBuilder<City, City, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('state', caseSensitive: caseSensitive);
  }
}

extension CityQueryProperty on QueryBuilder<City, City, QQueryProperty> {
  QueryBuilder<City, String, QQueryOperations> countryProperty() {
    return addPropertyNameInternal('country');
  }

  QueryBuilder<City, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<City, String, QQueryOperations> latitudeProperty() {
    return addPropertyNameInternal('latitude');
  }

  QueryBuilder<City, Map<String, Object>, QQueryOperations>
      localizationsProperty() {
    return addPropertyNameInternal('localizations');
  }

  QueryBuilder<City, String, QQueryOperations> longitudeProperty() {
    return addPropertyNameInternal('longitude');
  }

  QueryBuilder<City, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<City, bool, QQueryOperations> selectedProperty() {
    return addPropertyNameInternal('selected');
  }

  QueryBuilder<City, String?, QQueryOperations> stateProperty() {
    return addPropertyNameInternal('state');
  }
}
