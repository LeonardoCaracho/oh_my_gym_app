class Series {
  Series({
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
}
