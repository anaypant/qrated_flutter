import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'economy_news_record.g.dart';

abstract class EconomyNewsRecord
    implements Built<EconomyNewsRecord, EconomyNewsRecordBuilder> {
  static Serializer<EconomyNewsRecord> get serializer =>
      _$economyNewsRecordSerializer;

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

  static void _initializeBuilder(EconomyNewsRecordBuilder builder) => builder
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
      FirebaseFirestore.instance.collection('EconomyNews');

  static Stream<EconomyNewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EconomyNewsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EconomyNewsRecord._();
  factory EconomyNewsRecord([void Function(EconomyNewsRecordBuilder) updates]) =
      _$EconomyNewsRecord;

  static EconomyNewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEconomyNewsRecordData({
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
    EconomyNewsRecord.serializer,
    EconomyNewsRecord(
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
