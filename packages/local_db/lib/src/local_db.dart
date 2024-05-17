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

  //History methods
  Future<void> saveWorkoutRecord(
    WorkoutRecordModel workout,
    List<ExerciseModel> exercises,
  );
  Future<List<WorkoutRecordModel>> getWorkoutRecords(
    String userId,
  );
  Future<List<ExerciseModel>> getExerciseRecord(
    int workoutRecordId,
  );

  //Exercise type methods
  Future<void> saveExerciseType(ExerciseTypeModel exerciseTypeModel);
  Future<List<ExerciseTypeModel>> getExerciseTypes(String userId);
  Future<void> deleteExerciseType(int id);
  Future<void> updateExerciseType(ExerciseTypeModel exerciseTypeModel);
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
    await database.delete('workouts', where: 'id = ?', whereArgs: [workoutId]);
  }

  @override
  Future<void> updateWorkout(
    WorkoutModel workout,
    List<ExerciseModel> exercises,
  ) async {
    await database.update('workouts', workout.toMap(), where: 'id = ?', whereArgs: [workout.id]);

    for (ExerciseModel exercise in exercises) {
      int exerciseId;

      if (exercise.id != null) {
        exerciseId = exercise.id!;
        await database.update('exercises', exercise.toMap(), where: 'id = ?', whereArgs: [exercise.id]);
      } else {
        exercise.workoutId = workout.id;
        exerciseId = await database.insert('exercises', exercise.toMap());
      }

      for (SeriesModel series in exercise.sets) {
        if (series.id != null) {
          await database.update('series', series.toMap(), where: 'id = ?', whereArgs: [series.id]);
        } else {
          series.exerciseId = exerciseId;
          await database.insert('series', series.toMap());
        }
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
      where: 'workoutId = ?',
      whereArgs: [workoutId],
    );

    final exercises = exercisesRaw.map((e) => ExerciseModel.fromJson(e)).toList();

    for (ExerciseModel exercise in exercises) {
      exercise.sets = await _getSeries(exercise.id!);
    }

    return exercises;
  }

  Future<List<SeriesModel>> _getSeries(int exerciseId) async {
    final seriesRaw = await database.query('series', where: 'exerciseId = ?', whereArgs: [exerciseId]);
    return seriesRaw.map((s) => SeriesModel.fromJson(s)).toList();
  }

  @override
  Future<void> saveWorkoutRecord(WorkoutRecordModel workout, List<ExerciseModel> exercises) async {
    final workoutRecordId = await database.insert('workouts_records', workout.toMap());

    for (ExerciseModel exercise in exercises) {
      exercise.workoutId = workoutRecordId;
      final exerciseId = await database.insert('exercises_records', exercise.toMap());
      for (SeriesModel series in exercise.sets) {
        series.exerciseId = exerciseId;
        await database.insert('series_records', series.toMap());
      }
    }
  }

  @override
  Future<List<ExerciseModel>> getExerciseRecord(int workoutRecordId) async {
    final exercisesRaw = await database.query(
      'exercises_records',
      where: 'id = ?',
      whereArgs: [workoutRecordId],
    );

    final exercises = exercisesRaw.map((e) => ExerciseModel.fromJson(e)).toList();

    for (ExerciseModel exercise in exercises) {
      exercise.sets = await _getSeries(exercise.id!);
    }

    return exercises;
  }

  @override
  Future<List<WorkoutRecordModel>> getWorkoutRecords(String userId) async {
    final workoutsRaw = await database.query(
      'workouts_records',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return workoutsRaw.map((w) => WorkoutRecordModel.fromJson(w)).toList();
  }

  @override
  Future<void> deleteExerciseType(int id) async {
    await database.delete(
      'exercise_types',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<ExerciseTypeModel>> getExerciseTypes(String userId) async {
    final exerciseTypes = await database.query(
      'exercise_types',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    return exerciseTypes.map((e) => ExerciseTypeModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveExerciseType(ExerciseTypeModel exerciseTypeModel) async {
    await database.insert(
      'exercise_types',
      exerciseTypeModel.toJson(),
    );
  }

  @override
  Future<void> updateExerciseType(ExerciseTypeModel exerciseTypeModel) async {
    await database.update(
      'exercise_types',
      exerciseTypeModel.toJson(),
      where: 'id = ?',
      whereArgs: [exerciseTypeModel.id],
    );
  }
}
