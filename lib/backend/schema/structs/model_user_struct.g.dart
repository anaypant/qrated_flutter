// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ModelUserStruct> _$modelUserStructSerializer =
    new _$ModelUserStructSerializer();

class _$ModelUserStructSerializer
    implements StructuredSerializer<ModelUserStruct> {
  @override
  final Iterable<Type> types = const [ModelUserStruct, _$ModelUserStruct];
  @override
  final String wireName = 'ModelUserStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ModelUserStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ModelUserStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelUserStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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

class _$ModelUserStruct extends ModelUserStruct {
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? uid;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ModelUserStruct([void Function(ModelUserStructBuilder)? updates]) =>
      (new ModelUserStructBuilder()..update(updates))._build();

  _$ModelUserStruct._(
      {this.email, this.name, this.uid, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ModelUserStruct', 'firestoreUtilData');
  }

  @override
  ModelUserStruct rebuild(void Function(ModelUserStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelUserStructBuilder toBuilder() =>
      new ModelUserStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelUserStruct &&
        email == other.email &&
        name == other.name &&
        uid == other.uid &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, email.hashCode), name.hashCode), uid.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelUserStruct')
          ..add('email', email)
          ..add('name', name)
          ..add('uid', uid)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ModelUserStructBuilder
    implements Builder<ModelUserStruct, ModelUserStructBuilder> {
  _$ModelUserStruct? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ModelUserStructBuilder() {
    ModelUserStruct._initializeBuilder(this);
  }

  ModelUserStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _name = $v.name;
      _uid = $v.uid;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelUserStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelUserStruct;
  }

  @override
  void update(void Function(ModelUserStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelUserStruct build() => _build();

  _$ModelUserStruct _build() {
    final _$result = _$v ??
        new _$ModelUserStruct._(
            email: email,
            name: name,
            uid: uid,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ModelUserStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
