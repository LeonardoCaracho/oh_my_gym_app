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
      color: UIColors.lightDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        leading: index != null
            ? ReorderableDragStartListener(
                index: index!,
                child: const Icon(Icons.drag_handle),
              )
            : null,
        tilePadding: const EdgeInsets.symmetric(horizontal: UISpacing.sm),
        initiallyExpanded: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExerciseCardInput(
              hintText: 'Exercise name',
              isReadOnly: isEditMode == false,
              value: exercise.name,
              onChanged: (text) {
                exercise.name = text;
              },
            ),
            const SizedBox(width: UISpacing.sm),
            ExerciseCardInput(
              hintText: 'Notes',
              isReadOnly: isEditMode == false,
              multiLine: true,
              value: exercise.observation,
              onChanged: (text) {
                exercise.observation = text;
              },
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SetRow(
              exercise: exercise,
              onDelete: onDelete,
            ),
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
