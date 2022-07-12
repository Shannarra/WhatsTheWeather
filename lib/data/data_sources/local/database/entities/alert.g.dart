// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetAlertCollection on Isar {
  IsarCollection<Alert> get alerts {
    return getCollection('Alert');
  }
}

final AlertSchema = CollectionSchema(
  name: 'Alert',
  schema:
      '{"name":"Alert","idName":"id","properties":[{"name":"description","type":"String"},{"name":"end","type":"Long"},{"name":"event","type":"String"},{"name":"notified","type":"Bool"},{"name":"start","type":"Long"}],"indexes":[{"name":"end_event_start","unique":false,"properties":[{"name":"end","type":"Value","caseSensitive":false},{"name":"event","type":"Hash","caseSensitive":false},{"name":"start","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _AlertNativeAdapter(),
  webAdapter: const _AlertWebAdapter(),
  idName: 'id',
  propertyIds: {
    'description': 0,
    'end': 1,
    'event': 2,
    'notified': 3,
    'start': 4
  },
  listProperties: {},
  indexIds: {'end_event_start': 0},
  indexTypes: {
    'end_event_start': [
      NativeIndexType.long,
      NativeIndexType.stringHashCIS,
      NativeIndexType.long,
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

class _AlertWebAdapter extends IsarWebTypeAdapter<Alert> {
  const _AlertWebAdapter();

  @override
  Object serialize(IsarCollection<Alert> collection, Alert object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'description', object.description);
    IsarNative.jsObjectSet(jsObj, 'end', object.end);
    IsarNative.jsObjectSet(jsObj, 'event', object.event);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'notified', object.notified);
    IsarNative.jsObjectSet(jsObj, 'start', object.start);
    return jsObj;
  }

  @override
  Alert deserialize(IsarCollection<Alert> collection, dynamic jsObj) {
    final object = Alert();
    object.description = IsarNative.jsObjectGet(jsObj, 'description') ?? '';
    object.end =
        IsarNative.jsObjectGet(jsObj, 'end') ?? double.negativeInfinity;
    object.event = IsarNative.jsObjectGet(jsObj, 'event') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.notified = IsarNative.jsObjectGet(jsObj, 'notified') ?? false;
    object.start =
        IsarNative.jsObjectGet(jsObj, 'start') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'description':
        return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
      case 'end':
        return (IsarNative.jsObjectGet(jsObj, 'end') ?? double.negativeInfinity)
            as P;
      case 'event':
        return (IsarNative.jsObjectGet(jsObj, 'event') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'notified':
        return (IsarNative.jsObjectGet(jsObj, 'notified') ?? false) as P;
      case 'start':
        return (IsarNative.jsObjectGet(jsObj, 'start') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Alert object) {}
}

class _AlertNativeAdapter extends IsarNativeTypeAdapter<Alert> {
  const _AlertNativeAdapter();

  @override
  void serialize(IsarCollection<Alert> collection, IsarRawObject rawObj,
      Alert object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.description;
    final _description = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_description.length) as int;
    final value1 = object.end;
    final _end = value1;
    final value2 = object.event;
    final _event = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_event.length) as int;
    final value3 = object.notified;
    final _notified = value3;
    final value4 = object.start;
    final _start = value4;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _description);
    writer.writeLong(offsets[1], _end);
    writer.writeBytes(offsets[2], _event);
    writer.writeBool(offsets[3], _notified);
    writer.writeLong(offsets[4], _start);
  }

  @override
  Alert deserialize(IsarCollection<Alert> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Alert();
    object.description = reader.readString(offsets[0]);
    object.end = reader.readLong(offsets[1]);
    object.event = reader.readString(offsets[2]);
    object.id = id;
    object.notified = reader.readBool(offsets[3]);
    object.start = reader.readLong(offsets[4]);
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
        return (reader.readLong(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readBool(offset)) as P;
      case 4:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Alert object) {}
}

extension AlertQueryWhereSort on QueryBuilder<Alert, Alert, QWhere> {
  QueryBuilder<Alert, Alert, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Alert, Alert, QAfterWhere> anyEndEventStart() {
    return addWhereClauseInternal(
        const WhereClause(indexName: 'end_event_start'));
  }
}

extension AlertQueryWhere on QueryBuilder<Alert, Alert, QWhereClause> {
  QueryBuilder<Alert, Alert, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> idNotEqualTo(int? id) {
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

  QueryBuilder<Alert, Alert, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> idBetween(
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

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEqualTo(int end) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      lower: [end],
      includeLower: true,
      upper: [end],
      includeUpper: true,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endNotEqualTo(int end) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        upper: [end],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        lower: [end],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        lower: [end],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        upper: [end],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endGreaterThan(
    int end, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      lower: [end],
      includeLower: include,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endLessThan(
    int end, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      upper: [end],
      includeUpper: include,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endBetween(
    int lowerEnd,
    int upperEnd, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      lower: [lowerEnd],
      includeLower: includeLower,
      upper: [upperEnd],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEventEqualTo(
      int end, String event) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      lower: [end, event],
      includeLower: true,
      upper: [end, event],
      includeUpper: true,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEventNotEqualTo(
      int end, String event) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        upper: [end, event],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        lower: [end, event],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        lower: [end, event],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        upper: [end, event],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEventStartEqualTo(
      int end, String event, int start) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      lower: [end, event, start],
      includeLower: true,
      upper: [end, event, start],
      includeUpper: true,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEventStartNotEqualTo(
      int end, String event, int start) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        upper: [end, event, start],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        lower: [end, event, start],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        lower: [end, event, start],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'end_event_start',
        upper: [end, event, start],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEventEqualToStartGreaterThan(
    int end,
    String event,
    int start, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      lower: [end, event, start],
      includeLower: include,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEventEqualToStartLessThan(
    int end,
    String event,
    int start, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      upper: [end, event, start],
      includeUpper: include,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterWhereClause> endEventEqualToStartBetween(
    int end,
    String event,
    int lowerStart,
    int upperStart, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'end_event_start',
      lower: [end, event, lowerStart],
      includeLower: includeLower,
      upper: [end, event, upperStart],
      includeUpper: includeUpper,
    ));
  }
}

extension AlertQueryFilter on QueryBuilder<Alert, Alert, QFilterCondition> {
  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> endEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'end',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> endGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'end',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> endLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'end',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> endBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'end',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'event',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'event',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'event',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'event',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'event',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'event',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'event',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> eventMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'event',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Alert, Alert, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Alert, Alert, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Alert, Alert, QAfterFilterCondition> notifiedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'notified',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> startEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'start',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> startGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'start',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> startLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'start',
      value: value,
    ));
  }

  QueryBuilder<Alert, Alert, QAfterFilterCondition> startBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'start',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension AlertQueryLinks on QueryBuilder<Alert, Alert, QFilterCondition> {}

extension AlertQueryWhereSortBy on QueryBuilder<Alert, Alert, QSortBy> {
  QueryBuilder<Alert, Alert, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByEnd() {
    return addSortByInternal('end', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByEndDesc() {
    return addSortByInternal('end', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByEvent() {
    return addSortByInternal('event', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByEventDesc() {
    return addSortByInternal('event', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByNotified() {
    return addSortByInternal('notified', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByNotifiedDesc() {
    return addSortByInternal('notified', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByStart() {
    return addSortByInternal('start', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> sortByStartDesc() {
    return addSortByInternal('start', Sort.desc);
  }
}

extension AlertQueryWhereSortThenBy on QueryBuilder<Alert, Alert, QSortThenBy> {
  QueryBuilder<Alert, Alert, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByEnd() {
    return addSortByInternal('end', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByEndDesc() {
    return addSortByInternal('end', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByEvent() {
    return addSortByInternal('event', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByEventDesc() {
    return addSortByInternal('event', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByNotified() {
    return addSortByInternal('notified', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByNotifiedDesc() {
    return addSortByInternal('notified', Sort.desc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByStart() {
    return addSortByInternal('start', Sort.asc);
  }

  QueryBuilder<Alert, Alert, QAfterSortBy> thenByStartDesc() {
    return addSortByInternal('start', Sort.desc);
  }
}

extension AlertQueryWhereDistinct on QueryBuilder<Alert, Alert, QDistinct> {
  QueryBuilder<Alert, Alert, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Alert, Alert, QDistinct> distinctByEnd() {
    return addDistinctByInternal('end');
  }

  QueryBuilder<Alert, Alert, QDistinct> distinctByEvent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('event', caseSensitive: caseSensitive);
  }

  QueryBuilder<Alert, Alert, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Alert, Alert, QDistinct> distinctByNotified() {
    return addDistinctByInternal('notified');
  }

  QueryBuilder<Alert, Alert, QDistinct> distinctByStart() {
    return addDistinctByInternal('start');
  }
}

extension AlertQueryProperty on QueryBuilder<Alert, Alert, QQueryProperty> {
  QueryBuilder<Alert, String, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Alert, int, QQueryOperations> endProperty() {
    return addPropertyNameInternal('end');
  }

  QueryBuilder<Alert, String, QQueryOperations> eventProperty() {
    return addPropertyNameInternal('event');
  }

  QueryBuilder<Alert, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Alert, bool, QQueryOperations> notifiedProperty() {
    return addPropertyNameInternal('notified');
  }

  QueryBuilder<Alert, int, QQueryOperations> startProperty() {
    return addPropertyNameInternal('start');
  }
}
