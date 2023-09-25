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

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    WorkoutNameInput(
                      value: state.workout.name,
                      onChanged: (text) {
                        context.read<EditWorkoutCubit>().updateName(text);
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: state.workout.exercises.length,
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
                      color: UIColors.orange,
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
                    key: Key(exercises[index].id),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
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
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: DefaultButtonSmall(
                  text: 'Add Exercise',
                  icon: Icons.add,
                  onPressed: () =>
                      context.read<EditWorkoutCubit>().addExercise(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
