// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:workout_repository/src/models/exercise_set.dart';

part 'exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class Exercise {
  Exercise({
    required this.name,
    required this.sets,
    this.observation,
  });

  final String name;
  final String? observation;
  final List<ExerciseSet> sets;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
