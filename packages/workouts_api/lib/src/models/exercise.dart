// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:workouts_api/src/models/models.dart';

part 'exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class Exercise extends Equatable {
  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    this.observation,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  factory Exercise.empty({String? id}) => Exercise(
        id: id ?? const Uuid().v4(),
        name: '',
        observation: '',
        sets: [
          ExerciseSet(
            reps: 0,
            weight: 0,
          ),
        ],
      );

  String id;
  String name;
  String? observation;
  List<ExerciseSet> sets;
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  @override
  List<Object?> get props => [name, observation, sets, id];
}
