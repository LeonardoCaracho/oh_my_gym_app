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
          final exercises = state.exercises;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: WorkoutNameInput(
                            value: state.workout.name,
                            onChanged: (text) {
                              context.read<EditWorkoutCubit>().updateName(text);
                            },
                          ),
                        ),
                        if (state.exercises.length >= 2)
                          SizedBox(
                            width: 60,
                            child: InkWell(
                              key: const Key('sorting_button'),
                              child: const Icon(Icons.swap_vert),
                              onTap: () {
                                final editWorkoutCubit = context.read<EditWorkoutCubit>();
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return SortingDialog(
                                      editWorkoutCubit: editWorkoutCubit,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: state.exercises.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      alignment: Alignment.centerRight,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.delete),
                      ),
                    ),
                    onDismissed: (direction) {
                      context.read<EditWorkoutCubit>().deleteExercise(
                            index,
                          );
                    },
                    key: Key(exercises[index].name),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ExerciseCard(
                        index: index,
                        isEditMode: true,
                        exercise: exercises[index],
                        onAddSet: () => context.read<EditWorkoutCubit>().addSet(
                              index,
                            ),
                        onDelete: (exerciseId, setIndex) => context.read<EditWorkoutCubit>().deleteSet(
                              exerciseId,
                              setIndex,
                            ),
                      ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: DefaultButtonSmall(
                  text: 'Add Exercise',
                  icon: Icons.add,
                  onPressed: () => context.read<EditWorkoutCubit>().addExercise(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
