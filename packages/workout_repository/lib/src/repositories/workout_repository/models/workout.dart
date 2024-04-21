// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';
import 'package:workout_repository/workout_repository.dart';

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
        name: name ?? 'My workout',
        exercises: exercises ?? [],
        docId: docId ?? '',
      );

  Workout copyWith({
    String? id,
    String? name,
    List<Exercise>? exercises,
    String? docId,
  }) =>
      Workout(
        id: id ?? this.id,
        name: name ?? this.name,
        exercises: exercises ?? this.exercises,
        docId: docId ?? this.docId,
      );
}
