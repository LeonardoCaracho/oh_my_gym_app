import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';

final workoutMock = Workout(
  id: 'id',
  docId: 'docId',
  name: 'name',
  exercises: [exerciseMock, exerciseMock],
);

final exerciseMock = Exercise(id: 'id', name: 'name', sets: [exerciseSetMock]);

final exerciseSetMock = Series(reps: 1, weight: 10, isDone: false);

final workoutHistoryMock = WorkoutHistory(
  workout: workoutMock,
  finishDate: DateTimeMock.current,
);
