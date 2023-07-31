import 'package:workout_repository/workout_repository.dart';

// ignore: one_member_abstracts
abstract class WorkoutsContract {
  Future<void> saveWorkout(Workout workout);
}
