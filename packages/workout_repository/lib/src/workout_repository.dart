import 'package:workouts_api/workouts_api.dart';

abstract class WorkoutRepository {
  Future<void> saveWorkout(Workout workout);
  Future<List<Workout>> getWorkouts();
  Future<void> updateWorkout(Workout workout);
  Future<void> deleteWorkout(String docId);
}
