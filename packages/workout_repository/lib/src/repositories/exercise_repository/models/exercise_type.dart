import 'package:json_annotation/json_annotation.dart';
import 'package:local_db/local_db.dart';

part 'exercise_type.g.dart';

@JsonSerializable()
class ExerciseType {
  ExerciseType({
    this.id,
    required this.userId,
    required this.musclePrimary,
    this.muscleSecondary,
    required this.name,
    required this.type,
  });

  final int? id;
  final String userId;
  final Muscle musclePrimary;
  final List<Muscle>? muscleSecondary;
  final String name;
  final Type type;

  factory ExerciseType.fromJson(Map<String, dynamic> json) => _$ExerciseTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseTypeToJson(this);
}

enum Muscle {
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

extension MuscleX on Muscle {
  MuscleModel convertToMuscleModel() {
    switch (this) {
      case Muscle.abdominals:
        return MuscleModel.abdominals;
      case Muscle.abductors:
        return MuscleModel.abductors;
      case Muscle.adductors:
        return MuscleModel.adductors;
      case Muscle.biceps:
        return MuscleModel.biceps;
      case Muscle.calves:
        return MuscleModel.calves;
      case Muscle.cardio:
        return MuscleModel.cardio;
      case Muscle.chest:
        return MuscleModel.chest;
      case Muscle.forearms:
        return MuscleModel.forearms;
      case Muscle.fullBody:
        return MuscleModel.fullBody;
      case Muscle.glutes:
        return MuscleModel.glutes;
      case Muscle.hamstrings:
        return MuscleModel.hamstrings;
      case Muscle.lats:
        return MuscleModel.lats;
      case Muscle.lowerBack:
        return MuscleModel.lowerBack;
      case Muscle.neck:
        return MuscleModel.neck;
      case Muscle.quadriceps:
        return MuscleModel.quadriceps;
      case Muscle.shoulders:
        return MuscleModel.shoulders;
      case Muscle.traps:
        return MuscleModel.traps;
      case Muscle.triceps:
        return MuscleModel.triceps;
      case Muscle.upperBack:
        return MuscleModel.upperBack;
    }
  }
}

enum Type {
  weightAndReps,
  bodyweight,
  assistedBodyWeight,
  duration,
}

extension TypeX on Type {
  TypeModel convertToTypeModel() {
    switch (this) {
      case Type.assistedBodyWeight:
        return TypeModel.assistedBodyWeight;
      case Type.bodyweight:
        return TypeModel.bodyweight;
      case Type.duration:
        return TypeModel.duration;
      case Type.weightAndReps:
        return TypeModel.weightAndReps;
    }
  }
}
