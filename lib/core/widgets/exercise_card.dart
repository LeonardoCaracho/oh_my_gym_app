import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

import 'package:workout_repository/workout_repository.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.exercise,
    this.onAddSet,
    this.onDelete,
    this.isEditMode = true,
    super.key,
  });

  final Exercise exercise;
  final VoidCallback? onAddSet;
  final void Function(String exerciseId, int setIndex)? onDelete;
  final bool isEditMode;

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
                    isReadOnly: !isEditMode,
                    value: exercise.name,
                    onChanged: (text) {
                      exercise.name = text;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ExerciseCardInput(
                    isReadOnly: !isEditMode,
                    value: exercise.observation,
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
                showDelete: isEditMode,
                index: index,
                exercise: exercise,
                onDelete: onDelete,
              );
            },
          ),
          const SizedBox(height: 8),
          if (isEditMode)
            Padding(
              padding: const EdgeInsets.all(8),
              child: DefaultButton(
                text: 'Add Set',
                icon: Icons.add,
                onPressed: onAddSet,
              ),
            )
        ],
      ),
    );
  }
}
