class WorkoutModel {
  WorkoutModel({
    this.id,
    required this.userId,
    required this.name,
  });

  final int? id;
  final String userId;
  final String name;

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'name': name,
      };

  WorkoutModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        userId = json['userId'];
}
