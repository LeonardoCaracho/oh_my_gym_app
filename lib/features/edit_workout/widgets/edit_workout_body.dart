import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:oh_my_gym_app/features/edit_workout/widgets/bottom_section_update_workout.dart';

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
                value: state.workout.name,
                onChanged: (text) {
                  context.read<EditWorkoutCubit>().updateName(text);
                },
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

                    return Dismissible(
                      onDismissed: (direction) {
                        context.read<EditWorkoutCubit>().deleteExercise(
                              index,
                            );
                      },
                      key: UniqueKey(),
                      child: ExerciseCard(
                        isEditMode: true,
                        exercise: exercises[index],
                        onAddSet: () => context
                            .read<EditWorkoutCubit>()
                            .addSet(exercises[index].id),
                        onDelete: (exerciseId, setIndex) =>
                            context.read<EditWorkoutCubit>().deleteSet(
                                  exerciseId,
                                  setIndex,
                                ),
                      ),
                    );
                  },
                ),
              ),
              if (state.isEditMode)
                const BottomSectionUpdateWorkout()
              else
                const BottomSectionSaveWorkout(),
            ],
          );
        },
      ),
    );
  }
}
