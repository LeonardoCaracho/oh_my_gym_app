import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';

class ExerciseSetRow extends StatelessWidget {
  const ExerciseSetRow({
    required this.index,
    required this.exercise,
    this.onDelete,
    this.showDelete = true,
    super.key,
  });

  final int index;
  final Exercise exercise;
  final void Function(String exerciseId, int setIndex)? onDelete;
  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${index + 1}',
              style: UITextStyle.bodyText2,
            ),
          ),
          Expanded(
            flex: 2,
            child: ExerciseSetRowInput(
              label: 'Reps: ',
              value: '${exercise.sets[index].reps}',
              onChanged: (text) =>
                  exercise.sets[index].reps = int.tryParse(text) ?? 0,
            ),
          ),
          Expanded(
            flex: 2,
            child: ExerciseSetRowInput(
              label: 'Weight: ',
              value: '${exercise.sets[index].weight}',
              onChanged: (text) =>
                  exercise.sets[index].weight = double.tryParse(text) ?? 0,
            ),
          ),
          if (showDelete)
            InkWell(
              child: const Icon(
                Icons.remove_circle,
                color: UIColors.white,
              ),
              onTap: () {
                onDelete?.call(exercise.id, index);
              },
            ),
        ],
      ),
    );
  }
}
