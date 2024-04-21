import 'package:workout_repository/src/models/models.dart';

class Exercise {
  Exercise({
    required this.id,
    required this.name,
    this.observation,
    required this.sets,
  });

  String id;
  String name;
  String? observation;
  List<Series> sets;
}
