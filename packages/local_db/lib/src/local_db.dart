import 'package:local_db/local_db.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatabase {
  Future<void> saveUser(UserModel user);
  Future<void> saveWorkout(WorkoutModel workout);
  Future<void> deleteWorkout(int workoutId);
  Future<void> updateWorkout(WorkoutModel workout);
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
  Future<void> saveWorkout(WorkoutModel workout) async {
    final workoutId = await database.insert('workout', workout.toMap());

    for (ExerciseModel exercise in workout.exercises) {
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
  Future<void> updateWorkout(WorkoutModel workout) async {
    await database.update('workout', workout.toMap(),
        where: 'id = ?', whereArgs: [workout.id]);

    for (ExerciseModel exercise in workout.exercises) {
      await database.update('exercises', exercise.toMap(),
          where: 'id = ?', whereArgs: [exercise.id]);
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
}
