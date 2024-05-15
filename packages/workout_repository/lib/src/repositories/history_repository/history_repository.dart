import 'package:cache/cache.dart';
import 'package:local_db/local_db.dart';
import 'package:workout_repository/src/mappers/workout_mapper.dart';
import 'package:workout_repository/workout_repository.dart';

abstract class HistoryRepository {
  Future<void> saveRecord(WorkoutRecord workout, List<Exercise> exercises);
  Future<List<WorkoutRecord>> getRecords();
  Future<void> deleteRecord(String docId);
}

class HistoryRepositoryImpl extends HistoryRepository {
  HistoryRepositoryImpl({
    required this.cache,
    required this.localDatabase,
  });

  final LocalDatabase localDatabase;
  final Cache cache;

  @override
  Future<void> deleteRecord(String docId) async {}

  @override
  Future<List<WorkoutRecord>> getRecords() async {
    return [];
  }

  @override
  Future<void> saveRecord(WorkoutRecord workout, List<Exercise> exercises) async {
    final userId = cache.readString(key: userLoggedInCacheKey) ?? '';
    final workoutRecordParsed = WorkoutMapper.toWorkoutRecordModel(workout, userId);
    final exercisesParsed = WorkoutMapper.toExercisesRecordModel(exercises);
    await localDatabase.saveWorkoutRecord(workoutRecordParsed, exercisesParsed);
  }
}
