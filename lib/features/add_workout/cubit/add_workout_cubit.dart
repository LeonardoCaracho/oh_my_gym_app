import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'add_workout_state.dart';

class AddWorkoutCubit extends Cubit<AddWorkoutState> {
  AddWorkoutCubit({
    required this.workoutsRepository,
  }) : super(const AddWorkoutState());

  final WorkoutsContract workoutsRepository;

  void updateName(String name) {
    emit(
      state.copyWith(workoutName: name),
    );
  }

  void addExercise() {
    emit(
      state.copyWith(
        exercises: [...state.exercises, Exercise.empty],
      ),
    );
  }

  void addSet(Exercise exercise) {
    exercise.sets.add(ExerciseSet.empty);

    emit(
      state.copyWith(
        exercises: [...state.exercises],
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void deleteSet(Exercise exercise, int index) {
    exercise.sets.removeAt(index);

    if (exercise.sets.isEmpty) {}

    emit(
      state.copyWith(
        exercises: [...state.exercises],
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> saveWorkout() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final workout = Workout(
        id: '1',
        name: state.workoutName,
        exercises: state.exercises,
      );

      await workoutsRepository.saveWorkout(workout);

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      print('Error saving workout. $e');
      emit(state.copyWith(status: Status.failure));
    }
  }
}
