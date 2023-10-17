// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSet _$ExerciseSetFromJson(Map<String, dynamic> json) => ExerciseSet(
      reps: json['reps'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      prevReps: json['prevReps'] as int?,
      prevWeight: (json['prevWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExerciseSetToJson(ExerciseSet instance) =>
    <String, dynamic>{
      'reps': instance.reps,
      'weight': instance.weight,
      'prevReps': instance.prevReps,
      'prevWeight': instance.prevWeight,
    };
