class Workout {
  Workout({
    required this.name,
    this.id,
    this.docId,
  });

  final int? id;
  final String name;
  String? docId;

  factory Workout.create({
    String? name,
    String? docId,
    int? id,
  }) =>
      Workout(
        id: id,
        name: name ?? 'My workout',
        docId: docId ?? '',
      );

  Workout copyWith({
    int? id,
    String? name,
    String? docId,
  }) =>
      Workout(
        id: id ?? this.id,
        name: name ?? this.name,
        docId: docId ?? this.docId,
      );
}
