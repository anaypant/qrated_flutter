import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'model_comments_struct.g.dart';

abstract class ModelCommentsStruct
    implements Built<ModelCommentsStruct, ModelCommentsStructBuilder> {
  static Serializer<ModelCommentsStruct> get serializer =>
      _$modelCommentsStructSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get comment;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ModelCommentsStructBuilder builder) => builder
    ..displayName = ''
    ..comment = ''
    ..firestoreUtilData = FirestoreUtilData();

  ModelCommentsStruct._();
  factory ModelCommentsStruct(
          [void Function(ModelCommentsStructBuilder) updates]) =
      _$ModelCommentsStruct;
}

ModelCommentsStruct createModelCommentsStruct({
  String? displayName,
  String? comment,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModelCommentsStruct(
      (m) => m
        ..displayName = displayName
        ..comment = comment
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ModelCommentsStruct? updateModelCommentsStruct(
  ModelCommentsStruct? modelComments, {
  bool clearUnsetFields = true,
}) =>
    modelComments != null
        ? (modelComments.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addModelCommentsStructData(
  Map<String, dynamic> firestoreData,
  ModelCommentsStruct? modelComments,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modelComments == null) {
    return;
  }
  if (modelComments.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && modelComments.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modelCommentsData =
      getModelCommentsFirestoreData(modelComments, forFieldValue);
  final nestedData =
      modelCommentsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = modelComments.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getModelCommentsFirestoreData(
  ModelCommentsStruct? modelComments, [
  bool forFieldValue = false,
]) {
  if (modelComments == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ModelCommentsStruct.serializer, modelComments);

  // Add any Firestore field values
  modelComments.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModelCommentsListFirestoreData(
  List<ModelCommentsStruct>? modelCommentss,
) =>
    modelCommentss
        ?.map((m) => getModelCommentsFirestoreData(m, true))
        .toList() ??
    [];
