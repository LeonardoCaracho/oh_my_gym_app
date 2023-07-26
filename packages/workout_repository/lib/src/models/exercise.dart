// ignore_for_file: sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:workout_repository/src/models/exercise_set.dart';

part 'exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class Exercise extends Equatable {
  Exercise({
    required this.name,
    required this.sets,
    this.observation,
  });

  String name;
  String? observation;
  List<ExerciseSet> sets;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  static Exercise get empty => Exercise(
        name: '',
        sets: [
          ExerciseSet(
            reps: 0,
            weight: 0,
          ),
        ],
      );

  @override
  List<Object?> get props => [name, observation, sets];
}
