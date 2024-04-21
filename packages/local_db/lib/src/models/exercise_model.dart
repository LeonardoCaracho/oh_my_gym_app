import 'package:local_db/local_db.dart';

class ExerciseModel {
  ExerciseModel({
    required this.id,
    required this.name,
    this.observation,
    required this.sets,
  });

  String id;
  String name;
  String? observation;
  List<SeriesModel> sets;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'observation': observation,
        'sets': sets.map((s) => s.toMap()),
      };
}
