import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.exercise,
    this.index,
    this.onAddSet,
    this.onDelete,
    this.isEditMode = false,
    super.key,
  });

  final Exercise exercise;
  final bool isEditMode;
  final VoidCallback? onAddSet;
  final int? index;
  final void Function(String exerciseId, int setIndex)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        initiallyExpanded: true,
        shape: Border.all(color: Colors.transparent),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExerciseCardHeader(isEditMode: isEditMode, exercise: exercise),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
        children: [
          SetRow(
            key: Key(exercise.id),
            exercise: exercise,
            onDelete: onDelete,
            isEditMode: isEditMode,
          ),
          if (isEditMode)
            Padding(
              padding: const EdgeInsets.all(8),
              child: DefaultButtonSmall(
                text: 'Add Set',
                icon: Icons.add,
                onPressed: onAddSet,
              ),
            ),
        ],
      ),
    );
  }
}
