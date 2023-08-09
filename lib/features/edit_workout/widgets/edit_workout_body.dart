import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';

class EditWorkoutBody extends StatelessWidget {
  const EditWorkoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<EditWorkoutCubit, EditWorkoutState>(
        builder: (context, state) {
          final exercises = state.workout.exercises;

          return Column(
            children: [
              WorkoutNameInput(
                value: state.workout!.name,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: exercises.length + 1,
                  itemBuilder: (_, index) {
                    if (index == exercises.length) {
                      return DefaultButton(
                        text: 'Add Exercise',
                        icon: Icons.add,
                        onPressed: () =>
                            context.read<EditWorkoutCubit>().addExercise(),
                      );
                    }

                    return ExerciseCard(
                      exercise: exercises[index],
                      onAddSet: () => context
                          .read<EditWorkoutCubit>()
                          .addSet(exercises[index].id),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      text: 'CANCEL',
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  BlocConsumer<EditWorkoutCubit, EditWorkoutState>(
                    listener: (context, state) {
                      if (state.status.isSuccess) {
                        context.pop(true);
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: LoadingButton(
                          text: 'SAVE',
                          textOnLoading: 'SAVING',
                          icon: const Icon(Icons.save),
                          isLoading: state.status.isLoading,
                          onPressed: () =>
                              context.read<EditWorkoutCubit>().updateWorkout(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
