import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:workout_repository/workout_repository.dart';

class ExerciseSetRow extends StatelessWidget {
  const ExerciseSetRow({
    required this.index,
    required this.exercise,
    this.onDelete,
    super.key,
  });

  final int index;
  final Exercise exercise;
  final void Function(String exerciseId, int setIndex)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
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
          IconButton(
            onPressed: () {
              onDelete?.call(exercise.id, index);
            },
            icon: const Icon(
              Icons.delete,
              size: 20,
              color: UIColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
