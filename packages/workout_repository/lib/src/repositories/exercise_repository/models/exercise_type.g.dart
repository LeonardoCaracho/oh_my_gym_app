// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseType _$ExerciseTypeFromJson(Map<String, dynamic> json) => ExerciseType(
      id: json['id'] as int?,
      userId: json['userId'] as String,
      musclePrimary: $enumDecode(_$MuscleEnumMap, json['musclePrimary']),
      muscleSecondary: (json['muscleSecondary'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MuscleEnumMap, e))
          .toList(),
      name: json['name'] as String,
      type: $enumDecode(_$TypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ExerciseTypeToJson(ExerciseType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'musclePrimary': _$MuscleEnumMap[instance.musclePrimary]!,
      'muscleSecondary':
          instance.muscleSecondary?.map((e) => _$MuscleEnumMap[e]!).toList(),
      'name': instance.name,
      'type': _$TypeEnumMap[instance.type]!,
    };

const _$MuscleEnumMap = {
  Muscle.abdominals: 'abdominals',
  Muscle.abductors: 'abductors',
  Muscle.adductors: 'adductors',
  Muscle.biceps: 'biceps',
  Muscle.calves: 'calves',
  Muscle.cardio: 'cardio',
  Muscle.chest: 'chest',
  Muscle.forearms: 'forearms',
  Muscle.fullBody: 'fullBody',
  Muscle.glutes: 'glutes',
  Muscle.hamstrings: 'hamstrings',
  Muscle.lats: 'lats',
  Muscle.lowerBack: 'lowerBack',
  Muscle.neck: 'neck',
  Muscle.quadriceps: 'quadriceps',
  Muscle.shoulders: 'shoulders',
  Muscle.traps: 'traps',
  Muscle.triceps: 'triceps',
  Muscle.upperBack: 'upperBack',
};

const _$TypeEnumMap = {
  Type.weightAndReps: 'weightAndReps',
  Type.bodyweight: 'bodyweight',
  Type.assistedBodyWeight: 'assistedBodyWeight',
  Type.duration: 'duration',
};
