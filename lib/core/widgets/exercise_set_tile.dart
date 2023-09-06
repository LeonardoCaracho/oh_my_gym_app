import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workouts_api/workouts_api.dart';

class ExerciseSetTile extends StatelessWidget {
  const ExerciseSetTile({
    required this.index,
    required this.set,
    required this.exerciseId,
    this.onDelete,
    this.isEditMode = false,
    super.key,
  });

  final bool isEditMode;
  final int index;
  final ExerciseSet set;
  final String exerciseId;
  final void Function(String exerciseId, int setIndex)? onDelete;

  String? _intToString(int? value) {
    return (value != null && value > 0) ? value.toString() : null;
  }

  String? _doubleToString(double? value) {
    return (value != null && value > 0) ? value.toString() : null;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 21,
      ),
      leading: Text(
        '${index + 1}',
        style: UITextStyle.bodyText2,
      ),
      trailing: isEditMode
          ? InkWell(
              child: const Icon(
                Icons.remove_circle,
                color: UIColors.white,
              ),
              onTap: () => onDelete?.call(exerciseId, index),
            )
          : null,
      title: Row(
        children: [
          Expanded(
            flex: 2,
            child: ExerciseSetRowInput(
              label: 'Reps: ',
              value: _intToString(set.reps),
              onChanged: (text) => set.reps = int.tryParse(text) ?? 0,
            ),
          ),
          Expanded(
            flex: 2,
            child: ExerciseSetRowInput(
              label: 'Weight: ',
              hint: '0.0',
              value: _doubleToString(set.weight),
              onChanged: (text) => set.weight = double.tryParse(text) ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
