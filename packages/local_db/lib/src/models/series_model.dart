class SeriesModel {
  SeriesModel({
    this.exerciseId,
    this.id,
    this.isDone = false,
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
  int? exerciseId;
  int? id;

  Map<String, dynamic> toMap() => {
        'id': id,
        'exerciseId': exerciseId,
        'reps': reps,
        'weight': weight,
        'prevReps': prevReps,
        'prevWeight': prevWeight,
        'isDone': isDone,
      };
}
