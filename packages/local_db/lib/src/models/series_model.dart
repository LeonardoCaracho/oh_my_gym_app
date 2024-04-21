class SeriesModel {
  SeriesModel({
    required this.isDone,
    this.reps,
    this.weight,
    this.prevReps,
    this.prevWeight,
  });

  int? reps;
  double? weight;
  int? prevReps;
  double? prevWeight;
  bool isDone;

  Map<String, dynamic> toMap() => {
        'reps': reps,
        'weight': weight,
        'prevReps': prevReps,
        'prevWeight': prevWeight,
        'isDone': isDone,
      };
}
