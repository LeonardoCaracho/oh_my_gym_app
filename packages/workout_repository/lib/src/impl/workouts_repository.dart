import 'package:workout_repository/src/contracts/contracts.dart';
import 'package:workouts_api/workouts_api.dart';

class WorkoutRepository implements WorkoutsContract {
  WorkoutRepository({
    required this.workoutsApi,
  });

  final WorkoutsApi workoutsApi;

  @override
  Future<void> saveWorkout(Workout workout) async {
    await workoutsApi.saveWorkout(workout);
  }

  @override
  Future<List<Workout>> getWorkouts() async {
    return workoutsApi.getWorkouts();
  }

  @override
  Future<void> updateWorkout(Workout workout) async {
    await workoutsApi.updateWorkout(workout);
  }

  @override
  Future<void> deleteWorkout(String docId) async {
    await workoutsApi.deleteWorkout(docId);
  }
}
