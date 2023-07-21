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
  final Function deleteCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$index',
              style: UITextStyle.bodyText2,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  'Reps',
                  style: UITextStyle.bodyText2,
                ),
                const SizedBox(width: UISpacing.md),
                const SizedBox(
                  width: 60,
                  child: ExerciseSetRowInput(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  'Weight',
                  style: UITextStyle.bodyText2,
                ),
                const SizedBox(width: UISpacing.md),
                const SizedBox(
                  width: 60,
                  child: ExerciseSetRowInput(),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => deleteCallback(),
            icon: const Icon(
              Icons.delete,
              color: UIColors.darkPurple,
            ),
          ),
        ],
      ),
    );
  }
}
