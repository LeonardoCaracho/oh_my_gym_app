// ignore_for_file: sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_repository/src/models/exercise.dart';

part 'workout.g.dart';

@JsonSerializable(explicitToJson: true)
class Workout {
  Workout({
    required this.id,
    required this.name,
    required this.exercises,
    this.docId,
  });

  final String id;
  final String name;
  final List<Exercise> exercises;
  String? docId;

  factory Workout.create({
    String? name,
    List<Exercise>? exercises,
    String? docId,
    String? id,
  }) =>
      Workout(
        id: id ?? const Uuid().v4(),
        name: name ?? '',
        exercises: exercises ?? [],
        docId: docId ?? '',
      );

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);

  Workout copyWith({
    String? name,
    List<Exercise>? exercises,
    String? docId,
    String? id,
  }) {
    return Workout(
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
      docId: docId ?? this.docId,
      id: id ?? this.id,
    );
  }
}
