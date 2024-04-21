import 'package:workout_repository/workout_repository.dart';
import 'package:workouts_api/workouts_api.dart' as api;

class WorkoutRepositoryImpl implements WorkoutRepository {
  WorkoutRepositoryImpl({
    required this.workoutsApi,
  });

  final api.WorkoutsApi workoutsApi;

  @override
  Future<void> saveWorkout(Workout workout) async {
    // await workoutsApi.saveWorkout(workout);
  }

  @override
  Future<List<Workout>> getWorkouts() async {
    return [];
    // return workoutsApi.getWorkouts();
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
