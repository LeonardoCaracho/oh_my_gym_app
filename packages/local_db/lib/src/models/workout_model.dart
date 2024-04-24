import 'package:local_db/local_db.dart';

class WorkoutModel {
  WorkoutModel({
    this.id,
    required this.userId,
    required this.name,
    required this.exercises,
  });

  final String? id;
  final int userId;
  final String name;
  final List<ExerciseModel> exercises;

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'name': name,
      };
}
