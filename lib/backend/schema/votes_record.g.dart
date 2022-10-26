// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'votes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VotesRecord> _$votesRecordSerializer = new _$VotesRecordSerializer();

class _$VotesRecordSerializer implements StructuredSerializer<VotesRecord> {
  @override
  final Iterable<Type> types = const [VotesRecord, _$VotesRecord];
  @override
  final String wireName = 'VotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VotesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  VotesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VotesRecordBuilder();

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
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$VotesRecord extends VotesRecord {
  @override
  final String? displayName;
  @override
  final int? vote;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VotesRecord([void Function(VotesRecordBuilder)? updates]) =>
      (new VotesRecordBuilder()..update(updates))._build();

  _$VotesRecord._({this.displayName, this.vote, this.ffRef}) : super._();

  @override
  VotesRecord rebuild(void Function(VotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VotesRecordBuilder toBuilder() => new VotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VotesRecord &&
        displayName == other.displayName &&
        vote == other.vote &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, displayName.hashCode), vote.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VotesRecord')
          ..add('displayName', displayName)
          ..add('vote', vote)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VotesRecordBuilder implements Builder<VotesRecord, VotesRecordBuilder> {
  _$VotesRecord? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  int? _vote;
  int? get vote => _$this._vote;
  set vote(int? vote) => _$this._vote = vote;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VotesRecordBuilder() {
    VotesRecord._initializeBuilder(this);
  }

  VotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _vote = $v.vote;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VotesRecord;
  }

  @override
  void update(void Function(VotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VotesRecord build() => _build();

  _$VotesRecord _build() {
    final _$result = _$v ??
        new _$VotesRecord._(displayName: displayName, vote: vote, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
