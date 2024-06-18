import 'package:workout_repository/workout_repository.dart';

class ExerciseTypeCreate {
  ExerciseTypeCreate({
    required this.name,
    required this.muscle,
    required this.secondaryMuscle,
    required this.type,
  });

  final String name;
  final Muscle muscle;
  final List<Muscle> secondaryMuscle;
  final Type type;
}
