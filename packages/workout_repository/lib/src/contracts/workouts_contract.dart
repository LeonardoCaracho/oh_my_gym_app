import 'package:workout_repository/workout_repository.dart';

abstract class WorkoutsContract {
  Future<void> saveWorkout(Workout workout);
}
