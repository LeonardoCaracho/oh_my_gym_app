// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseTypeModel _$ExerciseTypeModelFromJson(Map<String, dynamic> json) =>
    ExerciseTypeModel(
      id: (json['id'] as num?)?.toInt(),
      userId: json['userId'] as String,
      musclePrimary: $enumDecode(_$MuscleModelEnumMap, json['musclePrimary']),
      muscleSecondary: (json['muscleSecondary'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MuscleModelEnumMap, e))
          .toList(),
      name: json['name'] as String,
      type: $enumDecode(_$TypeModelEnumMap, json['type']),
    );

Map<String, dynamic> _$ExerciseTypeModelToJson(ExerciseTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'musclePrimary': _$MuscleModelEnumMap[instance.musclePrimary]!,
      'muscleSecondary': instance.muscleSecondary
          ?.map((e) => _$MuscleModelEnumMap[e]!)
          .toList(),
      'name': instance.name,
      'type': _$TypeModelEnumMap[instance.type]!,
    };

const _$MuscleModelEnumMap = {
  MuscleModel.abdominals: 'abdominals',
  MuscleModel.abductors: 'abductors',
  MuscleModel.adductors: 'adductors',
  MuscleModel.biceps: 'biceps',
  MuscleModel.calves: 'calves',
  MuscleModel.cardio: 'cardio',
  MuscleModel.chest: 'chest',
  MuscleModel.forearms: 'forearms',
  MuscleModel.fullBody: 'fullBody',
  MuscleModel.glutes: 'glutes',
  MuscleModel.hamstrings: 'hamstrings',
  MuscleModel.lats: 'lats',
  MuscleModel.lowerBack: 'lowerBack',
  MuscleModel.neck: 'neck',
  MuscleModel.quadriceps: 'quadriceps',
  MuscleModel.shoulders: 'shoulders',
  MuscleModel.traps: 'traps',
  MuscleModel.triceps: 'triceps',
  MuscleModel.upperBack: 'upperBack',
};

const _$TypeModelEnumMap = {
  TypeModel.weightAndReps: 'weightAndReps',
  TypeModel.bodyweight: 'bodyweight',
  TypeModel.assistedBodyWeight: 'assistedBodyWeight',
  TypeModel.duration: 'duration',
};
