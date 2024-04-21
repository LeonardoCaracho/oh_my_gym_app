import 'package:workout_repository/workout_repository.dart';

class WorkoutHistory {
  WorkoutHistory({
    required this.workout,
    required this.finishDate,
    this.docId,
  });

  final Workout workout;
  final DateTime finishDate;
  String? docId;

  static String get collectionName => 'history';
}
