import 'package:local_db/local_db.dart';

class WorkoutModel {
  WorkoutModel({
    required this.id,
    required this.name,
    required this.exercises,
    this.docId,
  });

  final String id;
  final String name;
  final List<ExerciseModel> exercises;
  String? docId;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'exercises': exercises.map((e) => e.toMap()),
        'docId': docId,
      };
}
