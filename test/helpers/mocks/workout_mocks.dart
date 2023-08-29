import 'package:workouts_api/workouts_api.dart';

final workoutMock =
    Workout(id: 'id', docId: 'docId', name: 'name', exercises: [exerciseMock]);

final exerciseMock = Exercise(id: 'id', name: 'name', sets: [exerciseSetMock]);

final exerciseSetMock = ExerciseSet(reps: 1, weight: 10);
