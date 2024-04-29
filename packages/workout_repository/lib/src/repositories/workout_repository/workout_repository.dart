import 'package:local_db/local_db.dart';
import 'package:workout_repository/src/repositories/workout_repository/mappers/workout_mapper.dart';
import 'package:workout_repository/workout_repository.dart';

abstract class WorkoutRepository {
  Future<void> saveWorkout(Workout workout, List<Exercise> exercises);
  Future<List<Workout>> getWorkouts();
  Future<void> updateWorkout(Workout workout);
  Future<void> deleteWorkout(String docId);
}

class WorkoutRepositoryImpl implements WorkoutRepository {
  WorkoutRepositoryImpl({
    required this.localDatabase,
  });

  final LocalDatabase localDatabase;

  @override
  Future<void> saveWorkout(Workout workout, List<Exercise> exercises) async {
    final workoutModelMapped = WorkoutMapper.toWorkoutModel(workout);
    final exercisesModelMapped = WorkoutMapper.toExercisesModel(exercises);
    await localDatabase.saveWorkout(workoutModelMapped, exercisesModelMapped);
  }

  @override
  Future<List<Workout>> getWorkouts() async {
    // final workouts = await localDatabase.getWorkouts(userId)
    return [];
  }

  @override
  Future<void> updateWorkout(Workout workout) async {
    // await workoutsApi.updateWorkout(workout);
  }

  @override
  Future<void> deleteWorkout(String docId) async {
    // await workoutsApi.deleteWorkout(docId);
  }
}
