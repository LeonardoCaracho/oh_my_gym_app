import 'package:workout_repository/workout_repository.dart';

final workoutMock = Workout(id: 'id', name: 'name', exercises: [exerciseMock]);

final exerciseMock = Exercise(id: 'id', name: 'name', sets: [exerciseSetMock]);

final exerciseSetMock = ExerciseSet(reps: 1, weight: 10);
