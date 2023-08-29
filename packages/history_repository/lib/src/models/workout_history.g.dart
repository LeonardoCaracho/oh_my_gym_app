// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutHistory _$WorkoutHistoryFromJson(Map<String, dynamic> json) =>
    WorkoutHistory(
      workout: Workout.fromJson(json['workout'] as Map<String, dynamic>),
      finishDate: DateTime.parse(json['finishDate'] as String),
    );

Map<String, dynamic> _$WorkoutHistoryToJson(WorkoutHistory instance) =>
    <String, dynamic>{
      'workout': instance.workout.toJson(),
      'finishDate': instance.finishDate.toIso8601String(),
    };
