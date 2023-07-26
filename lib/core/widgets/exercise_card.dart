import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';
import 'package:workout_repository/workout_repository.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.exercise,
    super.key,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.lightPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ExerciseCardInput(
                    hintText: 'Exercise name',
                    onChanged: (text) {
                      exercise.name = text;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ExerciseCardInput(
                    hintText: 'Observations',
                    onChanged: (text) {
                      exercise.observation = text;
                    },
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: exercise.sets.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return ExerciseSetRow(
                key: UniqueKey(),
                index: index,
                exercise: exercise,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DefaultButton(
              text: 'Add Set',
              icon: Icons.add,
              onPressed: () => context.read<AddWorkoutCubit>().addSet(exercise),
            ),
          )
        ],
      ),
    );
  }
}
