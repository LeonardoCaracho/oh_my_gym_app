// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:workout_repository/src/models/exercise.dart';

part 'workout.g.dart';

@JsonSerializable(explicitToJson: true)
class Workout {
  Workout({
    required this.id,
    required this.name,
    required this.exercises,
  });

  final String id;
  final String name;
  final List<Exercise> exercises;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
