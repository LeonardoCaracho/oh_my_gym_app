// ignore_for_file: sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_set.g.dart';

@JsonSerializable()
class ExerciseSet extends Equatable {
  ExerciseSet({
    this.reps,
    this.weight,
  });

  int? reps;
  double? weight;

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);

  static ExerciseSet get empty => ExerciseSet(
        reps: 0,
        weight: 0,
      );

  @override
  List<Object?> get props => [reps, weight];
}
