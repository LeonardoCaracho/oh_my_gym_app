class Series {
  Series({
    required this.isDone,
    this.reps,
    this.weight,
    this.prevReps,
    this.prevWeight,
  });

  factory Series.empty() => Series(
        reps: 0,
        weight: 0,
        isDone: false,
      );

  int? reps;
  double? weight;
  int? prevReps;
  double? prevWeight;
  bool isDone;
}
