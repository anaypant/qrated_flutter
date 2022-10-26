import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'model_votes_struct.g.dart';

abstract class ModelVotesStruct
    implements Built<ModelVotesStruct, ModelVotesStructBuilder> {
  static Serializer<ModelVotesStruct> get serializer =>
      _$modelVotesStructSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  int? get vote;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ModelVotesStructBuilder builder) => builder
    ..displayName = ''
    ..vote = 0
    ..firestoreUtilData = FirestoreUtilData();

  ModelVotesStruct._();
  factory ModelVotesStruct([void Function(ModelVotesStructBuilder) updates]) =
      _$ModelVotesStruct;
}

ModelVotesStruct createModelVotesStruct({
  String? displayName,
  int? vote,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModelVotesStruct(
      (m) => m
        ..displayName = displayName
        ..vote = vote
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ModelVotesStruct? updateModelVotesStruct(
  ModelVotesStruct? modelVotes, {
  bool clearUnsetFields = true,
}) =>
    modelVotes != null
        ? (modelVotes.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addModelVotesStructData(
  Map<String, dynamic> firestoreData,
  ModelVotesStruct? modelVotes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modelVotes == null) {
    return;
  }
  if (modelVotes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && modelVotes.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modelVotesData = getModelVotesFirestoreData(modelVotes, forFieldValue);
  final nestedData = modelVotesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = modelVotes.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getModelVotesFirestoreData(
  ModelVotesStruct? modelVotes, [
  bool forFieldValue = false,
]) {
  if (modelVotes == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ModelVotesStruct.serializer, modelVotes);

  // Add any Firestore field values
  modelVotes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModelVotesListFirestoreData(
  List<ModelVotesStruct>? modelVotess,
) =>
    modelVotess?.map((m) => getModelVotesFirestoreData(m, true)).toList() ?? [];
