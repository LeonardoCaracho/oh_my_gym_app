import 'package:uuid/uuid.dart';
import 'package:workout_repository/workout_repository.dart';

class Workout {
  Workout({
    required this.name,
    this.id,
    this.docId,
  });

  final String? id;
  final String name;
  String? docId;

  factory Workout.create({
    String? name,
    String? docId,
    String? id,
  }) =>
      Workout(
        id: id ?? const Uuid().v4(),
        name: name ?? 'My workout',
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
        docId: docId ?? this.docId,
      );
}
