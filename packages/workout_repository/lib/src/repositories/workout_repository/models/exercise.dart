import 'package:uuid/uuid.dart';
import 'package:workout_repository/workout_repository.dart';

class Exercise {
  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    this.observation,
  });

  factory Exercise.empty({
    String? id,
    String? name,
  }) =>
      Exercise(
        id: id ?? const Uuid().v4(),
        name: name ?? '',
        observation: '',
        sets: [
          Series(
            reps: 0,
            weight: 0,
            isDone: false,
          ),
        ],
      );

  String id;
  String name;
  String? observation;
  List<Series> sets;
}
