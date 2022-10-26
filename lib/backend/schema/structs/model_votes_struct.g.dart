// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_votes_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ModelVotesStruct> _$modelVotesStructSerializer =
    new _$ModelVotesStructSerializer();

class _$ModelVotesStructSerializer
    implements StructuredSerializer<ModelVotesStruct> {
  @override
  final Iterable<Type> types = const [ModelVotesStruct, _$ModelVotesStruct];
  @override
  final String wireName = 'ModelVotesStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ModelVotesStruct object,
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
    value = object.vote;
    if (value != null) {
      result
        ..add('vote')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ModelVotesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelVotesStructBuilder();

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
        case 'vote':
          result.vote = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ModelVotesStruct extends ModelVotesStruct {
  @override
  final String? displayName;
  @override
  final int? vote;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ModelVotesStruct(
          [void Function(ModelVotesStructBuilder)? updates]) =>
      (new ModelVotesStructBuilder()..update(updates))._build();

  _$ModelVotesStruct._(
      {this.displayName, this.vote, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ModelVotesStruct', 'firestoreUtilData');
  }

  @override
  ModelVotesStruct rebuild(void Function(ModelVotesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelVotesStructBuilder toBuilder() =>
      new ModelVotesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelVotesStruct &&
        displayName == other.displayName &&
        vote == other.vote &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, displayName.hashCode), vote.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelVotesStruct')
          ..add('displayName', displayName)
          ..add('vote', vote)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ModelVotesStructBuilder
    implements Builder<ModelVotesStruct, ModelVotesStructBuilder> {
  _$ModelVotesStruct? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  int? _vote;
  int? get vote => _$this._vote;
  set vote(int? vote) => _$this._vote = vote;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ModelVotesStructBuilder() {
    ModelVotesStruct._initializeBuilder(this);
  }

  ModelVotesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _vote = $v.vote;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelVotesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelVotesStruct;
  }

  @override
  void update(void Function(ModelVotesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelVotesStruct build() => _build();

  _$ModelVotesStruct _build() {
    final _$result = _$v ??
        new _$ModelVotesStruct._(
            displayName: displayName,
            vote: vote,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ModelVotesStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
