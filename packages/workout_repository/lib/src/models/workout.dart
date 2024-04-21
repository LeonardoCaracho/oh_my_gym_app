// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:workout_repository/workout_repository.dart';

class Workout {
  Workout({
    required this.id,
    required this.name,
    required this.exercises,
    this.docId,
  });

  final String id;
  final String name;
  final List<Exercise> exercises;
  String? docId;
}
