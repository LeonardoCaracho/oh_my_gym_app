import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.workoutIndex,
    super.key,
  });

  final int workoutIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.lightPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ExerciseCardInput(
                    hintText: 'Exercise name',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ExerciseCardInput(
                    hintText: 'Observations',
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<AddWorkoutCubit, AddWorkoutState>(
            builder: (context, state) {
              final exerciseSets = state.exercises[workoutIndex].sets;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: exerciseSets.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return ExerciseSetRow(
                    index: index + 1,
                    deleteCallback: () =>
                        context.read<AddWorkoutCubit>().deleteSet(
                              workoutIndex,
                              index,
                            ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DefaultButton(
              text: 'Add Set',
              icon: Icons.add,
              onPressed: () => context.read<AddWorkoutCubit>().addSet(
                    workoutIndex,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
