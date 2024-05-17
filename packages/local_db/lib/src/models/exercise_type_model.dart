import 'package:json_annotation/json_annotation.dart';

part 'exercise_type_model.g.dart';

@JsonSerializable()
class ExerciseTypeModel {
  final int? id;
  final String userId;
  final MuscleModel musclePrimary;
  final List<MuscleModel>? muscleSecondary;
  final String name;
  final TypeModel type;

  ExerciseTypeModel({
    this.id,
    required this.userId,
    required this.musclePrimary,
    this.muscleSecondary,
    required this.name,
    required this.type,
  });

  factory ExerciseTypeModel.fromJson(Map<String, dynamic> json) => _$ExerciseTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseTypeModelToJson(this);
}

enum MuscleModel {
  abdominals,
  abductors,
  adductors,
  biceps,
  calves,
  cardio,
  chest,
  forearms,
  fullBody,
  glutes,
  hamstrings,
  lats,
  lowerBack,
  neck,
  quadriceps,
  shoulders,
  traps,
  triceps,
  upperBack,
}

enum TypeModel {
  weightAndReps,
  bodyweight,
  assistedBodyWeight,
  duration,
}
