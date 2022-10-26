import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'votes_record.g.dart';

abstract class VotesRecord implements Built<VotesRecord, VotesRecordBuilder> {
  static Serializer<VotesRecord> get serializer => _$votesRecordSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  int? get vote;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VotesRecordBuilder builder) => builder
    ..displayName = ''
    ..vote = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('votes');

  static Stream<VotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VotesRecord._();
  factory VotesRecord([void Function(VotesRecordBuilder) updates]) =
      _$VotesRecord;

  static VotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVotesRecordData({
  String? displayName,
  int? vote,
}) {
  final firestoreData = serializers.toFirestore(
    VotesRecord.serializer,
    VotesRecord(
      (v) => v
        ..displayName = displayName
        ..vote = vote,
    ),
  );

  return firestoreData;
}
