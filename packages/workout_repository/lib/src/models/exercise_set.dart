// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_set.g.dart';

@JsonSerializable()
class ExerciseSet extends Equatable {
  ExerciseSet({
    this.reps,
    this.weight,
  });

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  factory ExerciseSet.empty() => ExerciseSet(
        reps: 0,
        weight: 0,
      );

  int? reps;
  double? weight;
  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);

  @override
  List<Object?> get props => [reps, weight];
}
