import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'add_workout_state.dart';

class AddWorkoutCubit extends Cubit<AddWorkoutState> {
  AddWorkoutCubit() : super(const AddWorkoutState());

  void updateName(String name) {
    state.copyWith(workoutName: name);
  }

  void addExercise() {
    final currentExercices = [...state.exercises, Exercise.empty];

    emit(
      state.copyWith(
        exercises: currentExercices,
      ),
    );
  }

  void addSet(int exerciseIndex) {
    final allExercises = [...state.exercises];
    final exercise = allExercises.elementAt(exerciseIndex);

    exercise.sets.add(ExerciseSet.empty);

    emit(
      state.copyWith(exercises: []),
    );

    emit(
      state.copyWith(
        exercises: allExercises,
      ),
    );
  }

  void deleteSet(int exerciseIndex, int setIndex) {
    final allExercises = [...state.exercises];
    final exercise = allExercises.elementAt(exerciseIndex);

    exercise.sets.removeAt(setIndex);

    emit(
      state.copyWith(exercises: []),
    );

    emit(
      state.copyWith(
        exercises: allExercises,
      ),
    );
  }
}
