import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'model_news_struct.g.dart';

abstract class ModelNewsStruct
    implements Built<ModelNewsStruct, ModelNewsStructBuilder> {
  static Serializer<ModelNewsStruct> get serializer =>
      _$modelNewsStructSerializer;

  String? get author;

  String? get title;

  String? get description;

  String? get url;

  String? get publishedAt;

  BuiltList<String>? get votes;

  BuiltList<String>? get comments;

  String? get urlToImage;

  int? get upVoteCt;

  int? get downVoteCt;

  int? get commentCt;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ModelNewsStructBuilder builder) => builder
    ..author = ''
    ..title = ''
    ..description = ''
    ..url = ''
    ..publishedAt = ''
    ..votes = ListBuilder()
    ..comments = ListBuilder()
    ..urlToImage = ''
    ..upVoteCt = 0
    ..downVoteCt = 0
    ..commentCt = 0
    ..firestoreUtilData = FirestoreUtilData();

  ModelNewsStruct._();
  factory ModelNewsStruct([void Function(ModelNewsStructBuilder) updates]) =
      _$ModelNewsStruct;
}

ModelNewsStruct createModelNewsStruct({
  String? author,
  String? title,
  String? description,
  String? url,
  String? publishedAt,
  String? urlToImage,
  int? upVoteCt,
  int? downVoteCt,
  int? commentCt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModelNewsStruct(
      (m) => m
        ..author = author
        ..title = title
        ..description = description
        ..url = url
        ..publishedAt = publishedAt
        ..votes = null
        ..comments = null
        ..urlToImage = urlToImage
        ..upVoteCt = upVoteCt
        ..downVoteCt = downVoteCt
        ..commentCt = commentCt
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ModelNewsStruct? updateModelNewsStruct(
  ModelNewsStruct? modelNews, {
  bool clearUnsetFields = true,
}) =>
    modelNews != null
        ? (modelNews.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addModelNewsStructData(
  Map<String, dynamic> firestoreData,
  ModelNewsStruct? modelNews,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modelNews == null) {
    return;
  }
  if (modelNews.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && modelNews.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modelNewsData = getModelNewsFirestoreData(modelNews, forFieldValue);
  final nestedData = modelNewsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = modelNews.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getModelNewsFirestoreData(
  ModelNewsStruct? modelNews, [
  bool forFieldValue = false,
]) {
  if (modelNews == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ModelNewsStruct.serializer, modelNews);

  // Add any Firestore field values
  modelNews.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModelNewsListFirestoreData(
  List<ModelNewsStruct>? modelNewss,
) =>
    modelNewss?.map((m) => getModelNewsFirestoreData(m, true)).toList() ?? [];
