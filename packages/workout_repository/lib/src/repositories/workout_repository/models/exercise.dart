import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

class Exercise extends Equatable {
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

  @override
  List<Object?> get props => [id, name, observation, sets];
}
