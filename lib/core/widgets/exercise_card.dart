import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workouts_api/workouts_api.dart';

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
      color: UIColors.lightDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: UISpacing.sm),
        initiallyExpanded: true,
        shape: Border.all(color: Colors.transparent),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExerciseCardHeader(isEditMode: isEditMode, exercise: exercise),
            const SizedBox(height: UISpacing.md),
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
