import 'package:local_db/local_db.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatabase {
  Future<void> saveUser(UserModel user);
  Future<void> saveWorkout(
    WorkoutModel workout,
    List<ExerciseModel> exercises,
  );
  Future<void> deleteWorkout(int workoutId);
  Future<void> updateWorkout(
    WorkoutModel workout,
    List<ExerciseModel> exercises,
  );
  Future<List<WorkoutModel>> getWorkouts(String userId);
  Future<List<ExerciseModel>> getExercises(int workoutId);
}

class LocalDatabaseImpl implements LocalDatabase {
  LocalDatabaseImpl({required this.database});
  final Database database;

  @override
  Future<void> saveUser(UserModel user) async {
    await database.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> saveWorkout(
    WorkoutModel workout,
    List<ExerciseModel> exercises,
  ) async {
    final workoutId = await database.insert('workouts', workout.toMap());

    for (ExerciseModel exercise in exercises) {
      exercise.workoutId = workoutId;
      final exerciseId = await database.insert('exercises', exercise.toMap());
      for (SeriesModel series in exercise.sets) {
        series.exerciseId = exerciseId;
        await database.insert('series', series.toMap());
      }
    }
  }

  @override
  Future<void> deleteWorkout(int workoutId) async {
    await database.delete('workout', where: 'id = ?', whereArgs: [workoutId]);
  }

  @override
  Future<void> updateWorkout(
    WorkoutModel workout,
    List<ExerciseModel> exercises,
  ) async {
    await database.update('workout', workout.toMap(), where: 'id = ?', whereArgs: [workout.id]);

    for (ExerciseModel exercise in exercises) {
      await database.update('exercises', exercise.toMap(), where: 'id = ?', whereArgs: [exercise.id]);
      for (SeriesModel series in exercise.sets) {
        await database.update(
          'series',
          series.toMap(),
          where: 'id = ?',
          whereArgs: [series.id],
        );
      }
    }
  }

  @override
  Future<List<WorkoutModel>> getWorkouts(String userId) async {
    final workoutsRaw = await database.query(
      'workouts',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    return workoutsRaw.map((w) => WorkoutModel.fromJson(w)).toList();
  }

  @override
  Future<List<ExerciseModel>> getExercises(int workoutId) async {
    final exercisesRaw = await database.query(
      'exercises',
      where: 'workout_id = ?',
      whereArgs: [workoutId],
    );

    final exercises = exercisesRaw.map((e) => ExerciseModel.fromJson(e)).toList();

    for (ExerciseModel exercise in exercises) {
      exercise.sets = await _getSeries(exercise.id!);
    }

    return exercises;
  }

  Future<List<SeriesModel>> _getSeries(int exerciseId) async {
    final seriesRaw = await database.query('series', where: 'exercise_id = ?', whereArgs: [exerciseId]);
    return seriesRaw.map((s) => SeriesModel.fromJson(s)).toList();
  }
}
