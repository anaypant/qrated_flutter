import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'model_user_struct.g.dart';

abstract class ModelUserStruct
    implements Built<ModelUserStruct, ModelUserStructBuilder> {
  static Serializer<ModelUserStruct> get serializer =>
      _$modelUserStructSerializer;

  String? get email;

  String? get name;

  String? get uid;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ModelUserStructBuilder builder) => builder
    ..email = ''
    ..name = ''
    ..uid = ''
    ..firestoreUtilData = FirestoreUtilData();

  ModelUserStruct._();
  factory ModelUserStruct([void Function(ModelUserStructBuilder) updates]) =
      _$ModelUserStruct;
}

ModelUserStruct createModelUserStruct({
  String? email,
  String? name,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModelUserStruct(
      (m) => m
        ..email = email
        ..name = name
        ..uid = uid
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ModelUserStruct? updateModelUserStruct(
  ModelUserStruct? modelUser, {
  bool clearUnsetFields = true,
}) =>
    modelUser != null
        ? (modelUser.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addModelUserStructData(
  Map<String, dynamic> firestoreData,
  ModelUserStruct? modelUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modelUser == null) {
    return;
  }
  if (modelUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && modelUser.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modelUserData = getModelUserFirestoreData(modelUser, forFieldValue);
  final nestedData = modelUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = modelUser.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getModelUserFirestoreData(
  ModelUserStruct? modelUser, [
  bool forFieldValue = false,
]) {
  if (modelUser == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ModelUserStruct.serializer, modelUser);

  // Add any Firestore field values
  modelUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModelUserListFirestoreData(
  List<ModelUserStruct>? modelUsers,
) =>
    modelUsers?.map((m) => getModelUserFirestoreData(m, true)).toList() ?? [];
