import 'package:local_db/local_db.dart';
import 'package:workout_repository/workout_repository.dart';

abstract class WorkoutMapper {
  static Workout toWorkout(WorkoutModel workout) {
    return Workout(
      id: workout.id,
      name: workout.name,
    );
  }

  static WorkoutModel toWorkoutModel(Workout workout, String userId) {
    return WorkoutModel(
      id: workout.id,
      userId: userId,
      name: workout.name,
    );
  }

  static WorkoutRecord toWorkoutRecord(WorkoutRecordModel workout) {
    return WorkoutRecord(
      workoutId: workout.id!,
      name: workout.name,
      finishDate: workout.finishDate,
    );
  }

  static WorkoutRecordModel toWorkoutRecordModel(
    WorkoutRecord workout,
    String userId,
  ) {
    return WorkoutRecordModel(
      workoutId: workout.workoutId,
      userId: userId,
      name: workout.name,
      finishDate: workout.finishDate,
    );
  }

  static List<ExerciseModel> toExercisesRecordModel(
    List<Exercise> exercises, {
    int? workoutId,
  }) {
    return exercises
        .map(
          (e) => ExerciseModel(
            name: e.name,
            observation: e.observation,
            workoutId: workoutId,
            sets: e.sets
                .map(
                  (s) => SeriesModel(
                    exerciseId: e.id,
                    reps: s.reps,
                    weight: s.weight,
                    prevReps: s.prevReps,
                    prevWeight: s.prevWeight,
                    isDone: s.isDone,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  static List<ExerciseModel> toExercisesModel(
    List<Exercise> exercises, {
    int? workoutId,
  }) {
    return exercises
        .map(
          (e) => ExerciseModel(
            id: e.id,
            name: e.name,
            observation: e.observation,
            workoutId: workoutId,
            sets: e.sets
                .map(
                  (s) => SeriesModel(
                    id: s.id,
                    exerciseId: e.id,
                    reps: s.reps,
                    weight: s.weight,
                    prevReps: s.prevReps,
                    prevWeight: s.prevWeight,
                    isDone: s.isDone,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  static List<Exercise> toExercises(List<ExerciseModel> exercises) {
    return exercises
        .map(
          (e) => Exercise(
            id: e.id,
            name: e.name,
            observation: e.observation,
            sets: e.sets
                .map(
                  (s) => Series(
                    id: s.id,
                    reps: s.reps,
                    weight: s.weight,
                    prevReps: s.prevReps,
                    prevWeight: s.prevWeight,
                    isDone: s.isDone,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}
