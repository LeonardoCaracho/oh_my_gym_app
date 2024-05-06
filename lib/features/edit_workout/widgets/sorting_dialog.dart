import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';

class SortingDialog extends StatelessWidget {
  const SortingDialog({
    required this.editWorkoutCubit,
    super.key,
  });

  final EditWorkoutCubit editWorkoutCubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: BlocProvider.value(
        value: editWorkoutCubit,
        child: Builder(
          builder: (context) {
            return BlocBuilder<EditWorkoutCubit, EditWorkoutState>(
              builder: (context, state) {
                final exercises = state.exercises;

                return Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: ReorderableListView.builder(
                    padding: EdgeInsets.zero,
                    onReorder: (oldIndex, newIndex) {
                      context.read<EditWorkoutCubit>().reorderExercises(
                            oldIndex,
                            newIndex,
                          );
                    },
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        key: Key(exercises[index].name),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                        title: Text(
                          exercises[index].name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        leading: const Icon(
                          Icons.drag_handle_rounded,
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
