import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

class ExerciseSetRow extends StatelessWidget {
  const ExerciseSetRow({
    required this.index,
    required this.deleteCallback,
    super.key,
  });

  final int index;
  final VoidCallback? deleteCallback;

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
              '$index',
              style: UITextStyle.bodyText2,
            ),
          ),
          const Expanded(
            flex: 2,
            child: ExerciseSetRowInput(
              label: 'Reps: ',
            ),
          ),
          const Expanded(
            flex: 2,
            child: ExerciseSetRowInput(
              label: 'Weight: ',
            ),
          ),
          IconButton(
            onPressed: deleteCallback,
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
