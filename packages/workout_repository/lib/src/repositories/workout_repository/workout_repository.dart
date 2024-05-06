import 'package:cache/cache.dart';
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
    required this.cache,
  });

  final LocalDatabase localDatabase;
  final Cache cache;

  @override
  Future<void> saveWorkout(Workout workout, List<Exercise> exercises) async {
    final userId = cache.readString(key: userLoggedInCacheKey) ?? '';

    final workoutModelMapped = WorkoutMapper.toWorkoutModel(workout, userId);
    final exercisesModelMapped = WorkoutMapper.toExercisesModel(exercises);
    await localDatabase.saveWorkout(workoutModelMapped, exercisesModelMapped);
  }

  @override
  Future<List<Workout>> getWorkouts() async {
    final userId = cache.readString(key: userLoggedInCacheKey) ?? '';
    final workoutsModel = await localDatabase.getWorkouts(userId);
    return workoutsModel.map(WorkoutMapper.toWorkout).toList();
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
