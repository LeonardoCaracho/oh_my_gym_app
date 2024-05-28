import 'package:cache/cache.dart';
import 'package:local_db/local_db.dart';
import 'package:workout_repository/src/mappers/workout_mapper.dart';
import 'package:workout_repository/workout_repository.dart';

abstract class WorkoutRepository {
  Future<void> saveWorkout(Workout workout, List<Exercise> exercises);
  Future<List<Workout>> getWorkouts();
  Future<void> updateWorkout(Workout workout, List<Exercise> exercises);
  Future<void> deleteWorkout(int id);
  Future<List<Exercise>> getExercises(int workoutId);
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
  Future<void> updateWorkout(Workout workout, List<Exercise> exercises) async {
    final userId = cache.readString(key: userLoggedInCacheKey) ?? '';
    final workoutModelMapped = WorkoutMapper.toWorkoutModel(workout, userId);
    final exercisesModelMapped = WorkoutMapper.toExercisesModel(
      exercises,
      workoutId: workout.id,
    );
    await localDatabase.updateWorkout(workoutModelMapped, exercisesModelMapped);
  }

  @override
  Future<void> deleteWorkout(int id) async {
    await localDatabase.deleteWorkout(id);
  }

  @override
  Future<List<Exercise>> getExercises(int workoutId) async {
    final exercises = await localDatabase.getExercises(workoutId);
    return WorkoutMapper.toExercises(exercises);
  }
}
