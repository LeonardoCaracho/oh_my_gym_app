class WorkoutRecord {
  WorkoutRecord({
    required this.name,
    required this.finishDate,
    required this.workoutId,
    this.id,
  });

  final int? id;
  final int workoutId;
  final String name;
  DateTime finishDate;
}
