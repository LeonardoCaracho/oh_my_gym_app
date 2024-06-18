import 'package:cache/cache.dart';
import 'package:local_db/local_db.dart';
import 'package:workout_repository/src/repositories/exercise_repository/exercise_type_mapper.dart';
import 'package:workout_repository/workout_repository.dart';

abstract class ExercisesRepository {
  Future<void> save(ExerciseType exerciseType);
  Future<List<ExerciseType>> get();
  Future<void> update(ExerciseType exerciseType);
  Future<void> delete(int id);
}

class ExerciseRepositoryImpl extends ExercisesRepository {
  ExerciseRepositoryImpl({required this.localDatabase, required this.cache});

  final LocalDatabase localDatabase;
  final Cache cache;

  @override
  Future<void> delete(int id) async {
    await localDatabase.deleteExerciseType(id);
  }

  @override
  Future<List<ExerciseType>> get() async {
    final userId = cache.readString(key: userLoggedInCacheKey) ?? '';
    final exerciseTypeModels = await localDatabase.getExerciseTypes(userId);
    return exerciseTypeModels.map(mapModelToExerciseType).toList();
  }

  @override
  Future<void> save(ExerciseType exerciseType) async {
    try {
      final userId = cache.readString(key: userLoggedInCacheKey) ?? '';
      final exerciseTypeModel = mapExerciseTypeToModel(exerciseType, userId: userId);
      await localDatabase.saveExerciseType(exerciseTypeModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(ExerciseType exerciseType) async {
    final exerciseTypeModel = mapExerciseTypeToModel(exerciseType);
    await localDatabase.updateExerciseType(exerciseTypeModel);
  }
}
