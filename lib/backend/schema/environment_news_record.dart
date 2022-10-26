import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'environment_news_record.g.dart';

abstract class EnvironmentNewsRecord
    implements Built<EnvironmentNewsRecord, EnvironmentNewsRecordBuilder> {
  static Serializer<EnvironmentNewsRecord> get serializer =>
      _$environmentNewsRecordSerializer;

  String? get title;

  String? get author;

  String? get description;

  String? get publishedAt;

  String? get url;

  String? get urlToImage;

  int? get upVoteCt;

  int? get downVoteCt;

  int? get commentCt;

  BuiltList<ModelCommentsStruct>? get comments;

  BuiltList<ModelVotesStruct>? get votes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EnvironmentNewsRecordBuilder builder) =>
      builder
        ..title = ''
        ..author = ''
        ..description = ''
        ..publishedAt = ''
        ..url = ''
        ..urlToImage = ''
        ..upVoteCt = 0
        ..downVoteCt = 0
        ..commentCt = 0
        ..comments = ListBuilder()
        ..votes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EnvironmentNews');

  static Stream<EnvironmentNewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EnvironmentNewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EnvironmentNewsRecord._();
  factory EnvironmentNewsRecord(
          [void Function(EnvironmentNewsRecordBuilder) updates]) =
      _$EnvironmentNewsRecord;

  static EnvironmentNewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEnvironmentNewsRecordData({
  String? title,
  String? author,
  String? description,
  String? publishedAt,
  String? url,
  String? urlToImage,
  int? upVoteCt,
  int? downVoteCt,
  int? commentCt,
}) {
  final firestoreData = serializers.toFirestore(
    EnvironmentNewsRecord.serializer,
    EnvironmentNewsRecord(
      (e) => e
        ..title = title
        ..author = author
        ..description = description
        ..publishedAt = publishedAt
        ..url = url
        ..urlToImage = urlToImage
        ..upVoteCt = upVoteCt
        ..downVoteCt = downVoteCt
        ..commentCt = commentCt
        ..comments = null
        ..votes = null,
    ),
  );

  return firestoreData;
}
