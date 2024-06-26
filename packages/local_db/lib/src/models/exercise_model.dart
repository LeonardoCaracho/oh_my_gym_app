import 'package:local_db/local_db.dart';

class ExerciseModel {
  ExerciseModel({
    required this.name,
    required this.sets,
    this.workoutId,
    this.id,
    this.observation,
  });

  int? id;
  int? workoutId;
  String? observation;
  String name;
  List<SeriesModel> sets;

  Map<String, dynamic> toMap() => {
        'id': id,
        'workoutId': workoutId,
        'name': name,
        'observation': observation,
      };

  ExerciseModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        sets = [],
        workoutId = json['workoutId'],
        observation = json['observation'],
        id = json['id'];
}
