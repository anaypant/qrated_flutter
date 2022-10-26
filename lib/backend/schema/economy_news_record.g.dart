// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economy_news_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EconomyNewsRecord> _$economyNewsRecordSerializer =
    new _$EconomyNewsRecordSerializer();

class _$EconomyNewsRecordSerializer
    implements StructuredSerializer<EconomyNewsRecord> {
  @override
  final Iterable<Type> types = const [EconomyNewsRecord, _$EconomyNewsRecord];
  @override
  final String wireName = 'EconomyNewsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EconomyNewsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.author;
    if (value != null) {
      result
        ..add('author')
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
    value = object.publishedAt;
    if (value != null) {
      result
        ..add('publishedAt')
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
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ModelCommentsStruct)])));
    }
    value = object.votes;
    if (value != null) {
      result
        ..add('votes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ModelVotesStruct)])));
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
  EconomyNewsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EconomyNewsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'publishedAt':
          result.publishedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ModelCommentsStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'votes':
          result.votes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ModelVotesStruct)]))!
              as BuiltList<Object?>);
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

class _$EconomyNewsRecord extends EconomyNewsRecord {
  @override
  final String? title;
  @override
  final String? author;
  @override
  final String? description;
  @override
  final String? publishedAt;
  @override
  final String? url;
  @override
  final String? urlToImage;
  @override
  final int? upVoteCt;
  @override
  final int? downVoteCt;
  @override
  final int? commentCt;
  @override
  final BuiltList<ModelCommentsStruct>? comments;
  @override
  final BuiltList<ModelVotesStruct>? votes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EconomyNewsRecord(
          [void Function(EconomyNewsRecordBuilder)? updates]) =>
      (new EconomyNewsRecordBuilder()..update(updates))._build();

  _$EconomyNewsRecord._(
      {this.title,
      this.author,
      this.description,
      this.publishedAt,
      this.url,
      this.urlToImage,
      this.upVoteCt,
      this.downVoteCt,
      this.commentCt,
      this.comments,
      this.votes,
      this.ffRef})
      : super._();

  @override
  EconomyNewsRecord rebuild(void Function(EconomyNewsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EconomyNewsRecordBuilder toBuilder() =>
      new EconomyNewsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EconomyNewsRecord &&
        title == other.title &&
        author == other.author &&
        description == other.description &&
        publishedAt == other.publishedAt &&
        url == other.url &&
        urlToImage == other.urlToImage &&
        upVoteCt == other.upVoteCt &&
        downVoteCt == other.downVoteCt &&
        commentCt == other.commentCt &&
        comments == other.comments &&
        votes == other.votes &&
        ffRef == other.ffRef;
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
                                            $jc($jc(0, title.hashCode),
                                                author.hashCode),
                                            description.hashCode),
                                        publishedAt.hashCode),
                                    url.hashCode),
                                urlToImage.hashCode),
                            upVoteCt.hashCode),
                        downVoteCt.hashCode),
                    commentCt.hashCode),
                comments.hashCode),
            votes.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EconomyNewsRecord')
          ..add('title', title)
          ..add('author', author)
          ..add('description', description)
          ..add('publishedAt', publishedAt)
          ..add('url', url)
          ..add('urlToImage', urlToImage)
          ..add('upVoteCt', upVoteCt)
          ..add('downVoteCt', downVoteCt)
          ..add('commentCt', commentCt)
          ..add('comments', comments)
          ..add('votes', votes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EconomyNewsRecordBuilder
    implements Builder<EconomyNewsRecord, EconomyNewsRecordBuilder> {
  _$EconomyNewsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _publishedAt;
  String? get publishedAt => _$this._publishedAt;
  set publishedAt(String? publishedAt) => _$this._publishedAt = publishedAt;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

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

  ListBuilder<ModelCommentsStruct>? _comments;
  ListBuilder<ModelCommentsStruct> get comments =>
      _$this._comments ??= new ListBuilder<ModelCommentsStruct>();
  set comments(ListBuilder<ModelCommentsStruct>? comments) =>
      _$this._comments = comments;

  ListBuilder<ModelVotesStruct>? _votes;
  ListBuilder<ModelVotesStruct> get votes =>
      _$this._votes ??= new ListBuilder<ModelVotesStruct>();
  set votes(ListBuilder<ModelVotesStruct>? votes) => _$this._votes = votes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EconomyNewsRecordBuilder() {
    EconomyNewsRecord._initializeBuilder(this);
  }

  EconomyNewsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _author = $v.author;
      _description = $v.description;
      _publishedAt = $v.publishedAt;
      _url = $v.url;
      _urlToImage = $v.urlToImage;
      _upVoteCt = $v.upVoteCt;
      _downVoteCt = $v.downVoteCt;
      _commentCt = $v.commentCt;
      _comments = $v.comments?.toBuilder();
      _votes = $v.votes?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EconomyNewsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EconomyNewsRecord;
  }

  @override
  void update(void Function(EconomyNewsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EconomyNewsRecord build() => _build();

  _$EconomyNewsRecord _build() {
    _$EconomyNewsRecord _$result;
    try {
      _$result = _$v ??
          new _$EconomyNewsRecord._(
              title: title,
              author: author,
              description: description,
              publishedAt: publishedAt,
              url: url,
              urlToImage: urlToImage,
              upVoteCt: upVoteCt,
              downVoteCt: downVoteCt,
              commentCt: commentCt,
              comments: _comments?.build(),
              votes: _votes?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        _comments?.build();
        _$failedField = 'votes';
        _votes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EconomyNewsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
