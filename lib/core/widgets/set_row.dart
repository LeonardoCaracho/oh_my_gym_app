import 'dart:math';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workouts_api/workouts_api.dart';

class SetRow extends StatelessWidget {
  const SetRow({
    required this.exercise,
    required this.onDelete,
    super.key,
  });

  final Exercise exercise;
  final void Function(String exerciseId, int setIndex)? onDelete;

  List<Widget> rowsBuilder(List<ExerciseSet> sets) {
    return sets
        .map(
          (e) => Dismissible(
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => onDelete?.call(exercise.id, 0),
            background: Container(
              margin: const EdgeInsets.only(bottom: 8),
              color: UIColors.orange,
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.delete),
              ),
            ),
            key: Key(Random().nextInt(99).toString()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '1',
                    textAlign: TextAlign.center,
                    style: UITextStyle.bodyText2,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '0 kg x 11',
                    textAlign: TextAlign.center,
                    style: UITextStyle.bodyText2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ExerciseSetRowInput(
                    hintText: '0.0',
                    value: (e.weight != null && e.weight! > 0)
                        ? e.weight.toString()
                        : null,
                    onChanged: (text) => e.weight = double.tryParse(text) ?? 0,
                  ),
                ),
                Expanded(
                  child: ExerciseSetRowInput(
                    hintText: '0',
                    value: (e.reps != null && e.reps! > 0)
                        ? e.reps.toString()
                        : null,
                    onChanged: (text) => e.reps = int.tryParse(text) ?? 0,
                  ),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'SET',
                textAlign: TextAlign.center,
                style: UITextStyle.caption.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'PREVIOUS',
                textAlign: TextAlign.center,
                style: UITextStyle.caption.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'WEIGHT',
                textAlign: TextAlign.center,
                style: UITextStyle.caption.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'REPS',
                textAlign: TextAlign.center,
                style: UITextStyle.caption.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...rowsBuilder(exercise.sets),
      ],
    );
  }
}
