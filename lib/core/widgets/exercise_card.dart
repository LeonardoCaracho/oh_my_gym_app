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
      color: UIColors.lightPurple,
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
        tilePadding: const EdgeInsets.all(8),
        initiallyExpanded: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ExerciseCardInput(
                hintText: 'Exercise name',
                isReadOnly: isEditMode == false,
                value: exercise.name,
                onChanged: (text) {
                  exercise.name = text;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ExerciseCardInput(
                hintText: 'Observations',
                isReadOnly: isEditMode == false,
                value: exercise.observation,
                onChanged: (text) {
                  exercise.observation = text;
                },
              ),
            ),
          ],
        ),
        children: [
          MediaQuery(
            data: MediaQuery.of(context).removePadding(removeBottom: true),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: exercise.sets.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return ExerciseSetTile(
                  isEditMode: isEditMode,
                  set: exercise.sets[index],
                  exerciseId: exercise.id,
                  index: index,
                  onDelete: onDelete,
                );
              },
            ),
          ),
          if (isEditMode)
            Padding(
              padding: const EdgeInsets.all(8),
              child: DefaultButton(
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
