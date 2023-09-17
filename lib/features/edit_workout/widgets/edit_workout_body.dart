import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
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
              TextField(
                cursorColor: UIColors.lightDark,
                style: const TextStyle(
                  color: UIColors.white,
                ),
                onChanged: (text) {
                  context.read<EditWorkoutCubit>().updateName(text);
                },
                decoration: const InputDecoration(
                  hintText: 'Workout Name',
                  isDense: true,
                  hintStyle: TextStyle(
                    color: UIColors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: UIColors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: UIColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ExerciseNameInput(
                onChanged: (text) {
                  context.read<EditWorkoutCubit>().updateName(text);
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ReorderableListView.builder(
                  buildDefaultDragHandles: false,
                  onReorder: (oldIndex, newIndex) {
                    context.read<EditWorkoutCubit>().reorderExercises(
                          oldIndex,
                          newIndex,
                        );
                  },
                  itemCount: exercises.length,
                  itemBuilder: (_, index) {
                    return Dismissible(
                      onDismissed: (direction) {
                        context.read<EditWorkoutCubit>().deleteExercise(
                              index,
                            );
                      },
                      key: Key(exercises[index].id),
                      child: ExerciseCard(
                        index: index,
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
            ],
          );
        },
      ),
    );
  }
}
