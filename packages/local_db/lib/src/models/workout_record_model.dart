class WorkoutRecordModel {
  WorkoutRecordModel({
    this.id,
    required this.userId,
    required this.name,
    required this.finishDate,
    required this.workoutId,
  });

  final int? id;
  final int workoutId;
  final String userId;
  final String name;
  final DateTime finishDate;

  Map<String, dynamic> toMap() => {
        'id': id,
        'workoutId': workoutId,
        'userId': userId,
        'name': name,
      };

  WorkoutRecordModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        workoutId = json['workoutId'],
        name = json['name'],
        userId = json['userId'],
        finishDate = json['finish date'];
}
