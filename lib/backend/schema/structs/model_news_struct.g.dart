// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_news_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ModelNewsStruct> _$modelNewsStructSerializer =
    new _$ModelNewsStructSerializer();

class _$ModelNewsStructSerializer
    implements StructuredSerializer<ModelNewsStruct> {
  @override
  final Iterable<Type> types = const [ModelNewsStruct, _$ModelNewsStruct];
  @override
  final String wireName = 'ModelNewsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ModelNewsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.publishedAt;
    if (value != null) {
      result
        ..add('publishedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.votes;
    if (value != null) {
      result
        ..add('votes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.urlToImage;
    if (value != null) {
      result
        ..add('urlToImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.upVoteCt;
    if (value != null) {
      result
        ..add('upVoteCt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.downVoteCt;
    if (value != null) {
      result
        ..add('downVoteCt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.commentCt;
    if (value != null) {
      result
        ..add('commentCt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ModelNewsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelNewsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'publishedAt':
          result.publishedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'urlToImage':
          result.urlToImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'upVoteCt':
          result.upVoteCt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'downVoteCt':
          result.downVoteCt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'commentCt':
          result.commentCt = serializers.deserialize(value,
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

class _$ModelNewsStruct extends ModelNewsStruct {
  @override
  final String? author;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? publishedAt;
  @override
  final BuiltList<String>? votes;
  @override
  final BuiltList<String>? comments;
  @override
  final String? urlToImage;
  @override
  final int? upVoteCt;
  @override
  final int? downVoteCt;
  @override
  final int? commentCt;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ModelNewsStruct([void Function(ModelNewsStructBuilder)? updates]) =>
      (new ModelNewsStructBuilder()..update(updates))._build();

  _$ModelNewsStruct._(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.publishedAt,
      this.votes,
      this.comments,
      this.urlToImage,
      this.upVoteCt,
      this.downVoteCt,
      this.commentCt,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ModelNewsStruct', 'firestoreUtilData');
  }

  @override
  ModelNewsStruct rebuild(void Function(ModelNewsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelNewsStructBuilder toBuilder() =>
      new ModelNewsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelNewsStruct &&
        author == other.author &&
        title == other.title &&
        description == other.description &&
        url == other.url &&
        publishedAt == other.publishedAt &&
        votes == other.votes &&
        comments == other.comments &&
        urlToImage == other.urlToImage &&
        upVoteCt == other.upVoteCt &&
        downVoteCt == other.downVoteCt &&
        commentCt == other.commentCt &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, author.hashCode),
                                                title.hashCode),
                                            description.hashCode),
                                        url.hashCode),
                                    publishedAt.hashCode),
                                votes.hashCode),
                            comments.hashCode),
                        urlToImage.hashCode),
                    upVoteCt.hashCode),
                downVoteCt.hashCode),
            commentCt.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelNewsStruct')
          ..add('author', author)
          ..add('title', title)
          ..add('description', description)
          ..add('url', url)
          ..add('publishedAt', publishedAt)
          ..add('votes', votes)
          ..add('comments', comments)
          ..add('urlToImage', urlToImage)
          ..add('upVoteCt', upVoteCt)
          ..add('downVoteCt', downVoteCt)
          ..add('commentCt', commentCt)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ModelNewsStructBuilder
    implements Builder<ModelNewsStruct, ModelNewsStructBuilder> {
  _$ModelNewsStruct? _$v;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _publishedAt;
  String? get publishedAt => _$this._publishedAt;
  set publishedAt(String? publishedAt) => _$this._publishedAt = publishedAt;

  ListBuilder<String>? _votes;
  ListBuilder<String> get votes => _$this._votes ??= new ListBuilder<String>();
  set votes(ListBuilder<String>? votes) => _$this._votes = votes;

  ListBuilder<String>? _comments;
  ListBuilder<String> get comments =>
      _$this._comments ??= new ListBuilder<String>();
  set comments(ListBuilder<String>? comments) => _$this._comments = comments;

  String? _urlToImage;
  String? get urlToImage => _$this._urlToImage;
  set urlToImage(String? urlToImage) => _$this._urlToImage = urlToImage;

  int? _upVoteCt;
  int? get upVoteCt => _$this._upVoteCt;
  set upVoteCt(int? upVoteCt) => _$this._upVoteCt = upVoteCt;

  int? _downVoteCt;
  int? get downVoteCt => _$this._downVoteCt;
  set downVoteCt(int? downVoteCt) => _$this._downVoteCt = downVoteCt;

  int? _commentCt;
  int? get commentCt => _$this._commentCt;
  set commentCt(int? commentCt) => _$this._commentCt = commentCt;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ModelNewsStructBuilder() {
    ModelNewsStruct._initializeBuilder(this);
  }

  ModelNewsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _author = $v.author;
      _title = $v.title;
      _description = $v.description;
      _url = $v.url;
      _publishedAt = $v.publishedAt;
      _votes = $v.votes?.toBuilder();
      _comments = $v.comments?.toBuilder();
      _urlToImage = $v.urlToImage;
      _upVoteCt = $v.upVoteCt;
      _downVoteCt = $v.downVoteCt;
      _commentCt = $v.commentCt;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelNewsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelNewsStruct;
  }

  @override
  void update(void Function(ModelNewsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelNewsStruct build() => _build();

  _$ModelNewsStruct _build() {
    _$ModelNewsStruct _$result;
    try {
      _$result = _$v ??
          new _$ModelNewsStruct._(
              author: author,
              title: title,
              description: description,
              url: url,
              publishedAt: publishedAt,
              votes: _votes?.build(),
              comments: _comments?.build(),
              urlToImage: urlToImage,
              upVoteCt: upVoteCt,
              downVoteCt: downVoteCt,
              commentCt: commentCt,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'ModelNewsStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'votes';
        _votes?.build();
        _$failedField = 'comments';
        _comments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelNewsStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
