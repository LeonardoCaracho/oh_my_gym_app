class Series {
  Series({
    required this.isDone,
    this.reps,
    this.weight,
    this.prevReps,
    this.prevWeight,
    this.id,
  });

  factory Series.empty() => Series(
        reps: 0,
        weight: 0,
        isDone: false,
      );

  int? id;
  int? reps;
  double? weight;
  int? prevReps;
  double? prevWeight;
  bool isDone;
}
