// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPersonalizeCollection on Isar {
  IsarCollection<Personalize> get personalizes => this.collection();
}

const PersonalizeSchema = CollectionSchema(
  name: r'Personalize',
  id: -7764289894905895923,
  properties: {
    r'customBrightness': PropertySchema(
      id: 0,
      name: r'customBrightness',
      type: IsarType.byte,
      enumMap: _PersonalizecustomBrightnessEnumValueMap,
    ),
    r'tdBGColor': PropertySchema(
      id: 1,
      name: r'tdBGColor',
      type: IsarType.longList,
    ),
    r'tdCheckbox': PropertySchema(
      id: 2,
      name: r'tdCheckbox',
      type: IsarType.longList,
    ),
    r'tdDelete': PropertySchema(
      id: 3,
      name: r'tdDelete',
      type: IsarType.longList,
    ),
    r'tdIcon': PropertySchema(
      id: 4,
      name: r'tdIcon',
      type: IsarType.longList,
    ),
    r'tdText': PropertySchema(
      id: 5,
      name: r'tdText',
      type: IsarType.longList,
    ),
    r'tdTextWithoutBackground': PropertySchema(
      id: 6,
      name: r'tdTextWithoutBackground',
      type: IsarType.longList,
    ),
    r'tdTile': PropertySchema(
      id: 7,
      name: r'tdTile',
      type: IsarType.longList,
    )
  },
  estimateSize: _personalizeEstimateSize,
  serialize: _personalizeSerialize,
  deserialize: _personalizeDeserialize,
  deserializeProp: _personalizeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _personalizeGetId,
  getLinks: _personalizeGetLinks,
  attach: _personalizeAttach,
  version: '3.1.0+1',
);

int _personalizeEstimateSize(
  Personalize object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tdBGColor.length * 8;
  bytesCount += 3 + object.tdCheckbox.length * 8;
  bytesCount += 3 + object.tdDelete.length * 8;
  bytesCount += 3 + object.tdIcon.length * 8;
  bytesCount += 3 + object.tdText.length * 8;
  bytesCount += 3 + object.tdTextWithoutBackground.length * 8;
  bytesCount += 3 + object.tdTile.length * 8;
  return bytesCount;
}

void _personalizeSerialize(
  Personalize object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.customBrightness.index);
  writer.writeLongList(offsets[1], object.tdBGColor);
  writer.writeLongList(offsets[2], object.tdCheckbox);
  writer.writeLongList(offsets[3], object.tdDelete);
  writer.writeLongList(offsets[4], object.tdIcon);
  writer.writeLongList(offsets[5], object.tdText);
  writer.writeLongList(offsets[6], object.tdTextWithoutBackground);
  writer.writeLongList(offsets[7], object.tdTile);
}

Personalize _personalizeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Personalize();
  object.customBrightness = _PersonalizecustomBrightnessValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      Brightness.dark;
  object.id = id;
  object.tdBGColor = reader.readLongList(offsets[1]) ?? [];
  object.tdCheckbox = reader.readLongList(offsets[2]) ?? [];
  object.tdDelete = reader.readLongList(offsets[3]) ?? [];
  object.tdIcon = reader.readLongList(offsets[4]) ?? [];
  object.tdText = reader.readLongList(offsets[5]) ?? [];
  object.tdTextWithoutBackground = reader.readLongList(offsets[6]) ?? [];
  object.tdTile = reader.readLongList(offsets[7]) ?? [];
  return object;
}

P _personalizeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_PersonalizecustomBrightnessValueEnumMap[
              reader.readByteOrNull(offset)] ??
          Brightness.dark) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readLongList(offset) ?? []) as P;
    case 5:
      return (reader.readLongList(offset) ?? []) as P;
    case 6:
      return (reader.readLongList(offset) ?? []) as P;
    case 7:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PersonalizecustomBrightnessEnumValueMap = {
  'dark': 0,
  'light': 1,
};
const _PersonalizecustomBrightnessValueEnumMap = {
  0: Brightness.dark,
  1: Brightness.light,
};

Id _personalizeGetId(Personalize object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _personalizeGetLinks(Personalize object) {
  return [];
}

void _personalizeAttach(
    IsarCollection<dynamic> col, Id id, Personalize object) {
  object.id = id;
}

extension PersonalizeQueryWhereSort
    on QueryBuilder<Personalize, Personalize, QWhere> {
  QueryBuilder<Personalize, Personalize, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PersonalizeQueryWhere
    on QueryBuilder<Personalize, Personalize, QWhereClause> {
  QueryBuilder<Personalize, Personalize, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PersonalizeQueryFilter
    on QueryBuilder<Personalize, Personalize, QFilterCondition> {
  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      customBrightnessEqualTo(Brightness value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customBrightness',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      customBrightnessGreaterThan(
    Brightness value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customBrightness',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      customBrightnessLessThan(
    Brightness value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customBrightness',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      customBrightnessBetween(
    Brightness lower,
    Brightness upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customBrightness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tdBGColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tdBGColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tdBGColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tdBGColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdBGColor',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdBGColor',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdBGColor',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdBGColor',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdBGColor',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdBGColorLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdBGColor',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tdCheckbox',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tdCheckbox',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tdCheckbox',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tdCheckbox',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdCheckbox',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdCheckbox',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdCheckbox',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdCheckbox',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdCheckbox',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdCheckboxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdCheckbox',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tdDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tdDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tdDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tdDelete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdDelete',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdDelete',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdDelete',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdDelete',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdDelete',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdDeleteLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdDelete',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tdIcon',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tdIcon',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tdIcon',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tdIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdIcon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdIcon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdIcon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdIcon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdIcon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdIconLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdIcon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tdText',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tdText',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tdText',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tdText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdText',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdText',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdText',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdText',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdText',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdText',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tdTextWithoutBackground',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tdTextWithoutBackground',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tdTextWithoutBackground',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tdTextWithoutBackground',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTextWithoutBackground',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTextWithoutBackground',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTextWithoutBackground',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTextWithoutBackground',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTextWithoutBackground',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTextWithoutBackgroundLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTextWithoutBackground',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tdTile',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tdTile',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tdTile',
        value: value,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tdTile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTile',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTile',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTile',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTile',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTile',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterFilterCondition>
      tdTileLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tdTile',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PersonalizeQueryObject
    on QueryBuilder<Personalize, Personalize, QFilterCondition> {}

extension PersonalizeQueryLinks
    on QueryBuilder<Personalize, Personalize, QFilterCondition> {}

extension PersonalizeQuerySortBy
    on QueryBuilder<Personalize, Personalize, QSortBy> {
  QueryBuilder<Personalize, Personalize, QAfterSortBy>
      sortByCustomBrightness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customBrightness', Sort.asc);
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterSortBy>
      sortByCustomBrightnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customBrightness', Sort.desc);
    });
  }
}

extension PersonalizeQuerySortThenBy
    on QueryBuilder<Personalize, Personalize, QSortThenBy> {
  QueryBuilder<Personalize, Personalize, QAfterSortBy>
      thenByCustomBrightness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customBrightness', Sort.asc);
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterSortBy>
      thenByCustomBrightnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customBrightness', Sort.desc);
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Personalize, Personalize, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension PersonalizeQueryWhereDistinct
    on QueryBuilder<Personalize, Personalize, QDistinct> {
  QueryBuilder<Personalize, Personalize, QDistinct>
      distinctByCustomBrightness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customBrightness');
    });
  }

  QueryBuilder<Personalize, Personalize, QDistinct> distinctByTdBGColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tdBGColor');
    });
  }

  QueryBuilder<Personalize, Personalize, QDistinct> distinctByTdCheckbox() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tdCheckbox');
    });
  }

  QueryBuilder<Personalize, Personalize, QDistinct> distinctByTdDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tdDelete');
    });
  }

  QueryBuilder<Personalize, Personalize, QDistinct> distinctByTdIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tdIcon');
    });
  }

  QueryBuilder<Personalize, Personalize, QDistinct> distinctByTdText() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tdText');
    });
  }

  QueryBuilder<Personalize, Personalize, QDistinct>
      distinctByTdTextWithoutBackground() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tdTextWithoutBackground');
    });
  }

  QueryBuilder<Personalize, Personalize, QDistinct> distinctByTdTile() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tdTile');
    });
  }
}

extension PersonalizeQueryProperty
    on QueryBuilder<Personalize, Personalize, QQueryProperty> {
  QueryBuilder<Personalize, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Personalize, Brightness, QQueryOperations>
      customBrightnessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customBrightness');
    });
  }

  QueryBuilder<Personalize, List<int>, QQueryOperations> tdBGColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tdBGColor');
    });
  }

  QueryBuilder<Personalize, List<int>, QQueryOperations> tdCheckboxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tdCheckbox');
    });
  }

  QueryBuilder<Personalize, List<int>, QQueryOperations> tdDeleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tdDelete');
    });
  }

  QueryBuilder<Personalize, List<int>, QQueryOperations> tdIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tdIcon');
    });
  }

  QueryBuilder<Personalize, List<int>, QQueryOperations> tdTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tdText');
    });
  }

  QueryBuilder<Personalize, List<int>, QQueryOperations>
      tdTextWithoutBackgroundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tdTextWithoutBackground');
    });
  }

  QueryBuilder<Personalize, List<int>, QQueryOperations> tdTileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tdTile');
    });
  }
}
