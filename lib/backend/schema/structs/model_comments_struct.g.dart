// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_comments_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ModelCommentsStruct> _$modelCommentsStructSerializer =
    new _$ModelCommentsStructSerializer();

class _$ModelCommentsStructSerializer
    implements StructuredSerializer<ModelCommentsStruct> {
  @override
  final Iterable<Type> types = const [
    ModelCommentsStruct,
    _$ModelCommentsStruct
  ];
  @override
  final String wireName = 'ModelCommentsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ModelCommentsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ModelCommentsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelCommentsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$ModelCommentsStruct extends ModelCommentsStruct {
  @override
  final String? displayName;
  @override
  final String? comment;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ModelCommentsStruct(
          [void Function(ModelCommentsStructBuilder)? updates]) =>
      (new ModelCommentsStructBuilder()..update(updates))._build();

  _$ModelCommentsStruct._(
      {this.displayName, this.comment, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ModelCommentsStruct', 'firestoreUtilData');
  }

  @override
  ModelCommentsStruct rebuild(
          void Function(ModelCommentsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelCommentsStructBuilder toBuilder() =>
      new ModelCommentsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelCommentsStruct &&
        displayName == other.displayName &&
        comment == other.comment &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, displayName.hashCode), comment.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelCommentsStruct')
          ..add('displayName', displayName)
          ..add('comment', comment)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ModelCommentsStructBuilder
    implements Builder<ModelCommentsStruct, ModelCommentsStructBuilder> {
  _$ModelCommentsStruct? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ModelCommentsStructBuilder() {
    ModelCommentsStruct._initializeBuilder(this);
  }

  ModelCommentsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _comment = $v.comment;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelCommentsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelCommentsStruct;
  }

  @override
  void update(void Function(ModelCommentsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelCommentsStruct build() => _build();

  _$ModelCommentsStruct _build() {
    final _$result = _$v ??
        new _$ModelCommentsStruct._(
            displayName: displayName,
            comment: comment,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'ModelCommentsStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
