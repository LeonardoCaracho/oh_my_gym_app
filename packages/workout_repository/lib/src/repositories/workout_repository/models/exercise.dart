import 'package:workout_repository/workout_repository.dart';

class Exercise {
  Exercise({
    required this.name,
    required this.sets,
    this.id,
    this.observation,
  });

  factory Exercise.empty({
    String? name,
  }) =>
      Exercise(
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

  int? id;
  String name;
  String? observation;
  List<Series> sets;
}
