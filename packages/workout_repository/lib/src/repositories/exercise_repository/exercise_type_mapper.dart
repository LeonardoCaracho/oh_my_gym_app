import 'package:local_db/local_db.dart';
import 'package:workout_repository/workout_repository.dart';

ExerciseTypeModel mapExerciseTypeToModel(ExerciseType model, {String? userId}) {
  return ExerciseTypeModel(
    id: model.id,
    userId: (userId ?? model.userId) ?? '',
    musclePrimary: model.musclePrimary.convertToMuscleModel(),
    muscleSecondary: model.muscleSecondary?.map((m) => m.convertToMuscleModel()).toList(),
    name: model.name,
    type: model.type.convertToTypeModel(),
  );
}

ExerciseType mapModelToExerciseType(ExerciseTypeModel model) {
  return ExerciseType(
    id: model.id,
    userId: model.userId,
    musclePrimary: convertMuscleModelToMuscle(model.musclePrimary),
    muscleSecondary: model.muscleSecondary?.map(convertMuscleModelToMuscle).toList(),
    name: model.name,
    type: convertTypeModelToType(model.type),
  );
}

Muscle convertMuscleModelToMuscle(MuscleModel muscleModel) {
  switch (muscleModel) {
    case MuscleModel.abdominals:
      return Muscle.abdominals;
    case MuscleModel.abductors:
      return Muscle.abductors;
    case MuscleModel.adductors:
      return Muscle.adductors;
    case MuscleModel.biceps:
      return Muscle.biceps;
    case MuscleModel.calves:
      return Muscle.calves;
    case MuscleModel.cardio:
      return Muscle.cardio;
    case MuscleModel.chest:
      return Muscle.chest;
    case MuscleModel.forearms:
      return Muscle.forearms;
    case MuscleModel.fullBody:
      return Muscle.fullBody;
    case MuscleModel.glutes:
      return Muscle.glutes;
    case MuscleModel.hamstrings:
      return Muscle.hamstrings;
    case MuscleModel.lats:
      return Muscle.lats;
    case MuscleModel.lowerBack:
      return Muscle.lowerBack;
    case MuscleModel.neck:
      return Muscle.neck;
    case MuscleModel.quadriceps:
      return Muscle.quadriceps;
    case MuscleModel.shoulders:
      return Muscle.shoulders;
    case MuscleModel.traps:
      return Muscle.traps;
    case MuscleModel.triceps:
      return Muscle.triceps;
    case MuscleModel.upperBack:
      return Muscle.upperBack;
  }
}

Type convertTypeModelToType(TypeModel typeModel) {
  switch (typeModel) {
    case TypeModel.assistedBodyWeight:
      return Type.assistedBodyWeight;
    case TypeModel.bodyweight:
      return Type.bodyweight;
    case TypeModel.duration:
      return Type.duration;
    case TypeModel.weightAndReps:
      return Type.weightAndReps;
  }
}
