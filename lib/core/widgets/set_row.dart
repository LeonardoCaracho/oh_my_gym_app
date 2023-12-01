import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workouts_api/workouts_api.dart';

class SetRow extends StatefulWidget {
  const SetRow({
    required this.exercise,
    required this.onDelete,
    this.isEditMode = false,
    super.key,
  });

  final Exercise exercise;
  final void Function(String exerciseId, int setIndex)? onDelete;
  final bool isEditMode;

  @override
  State<SetRow> createState() => _SetRowState();
}

class _SetRowState extends State<SetRow> {
  String formatPreviousValues(ExerciseSet set) {
    if (set.prevReps != null && set.prevWeight != null) {
      return '${set.prevReps} x ${set.prevWeight}';
    }
    return '---';
  }

  List<Widget> _rowsBuilder(List<ExerciseSet> sets) {
    return sets.asMap().entries.map((entry) {
      final set = entry.value;
      final index = entry.key;

      return Dismissible(
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => widget.onDelete?.call(
          widget.exercise.id,
          sets.indexOf(set),
        ),
        background: Container(
          margin: const EdgeInsets.only(bottom: 8),
          color: UIColors.orange,
          alignment: Alignment.centerRight,
          child: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.delete),
          ),
        ),
        key: Key(index.toString()),
        child: ColoredBox(
          color: set.isDone ? Colors.black26 : UIColors.lightDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '${index + 1}',
                  textAlign: TextAlign.center,
                  style: UITextStyle.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  formatPreviousValues(set),
                  textAlign: TextAlign.center,
                  style: UITextStyle.bodyText2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ExerciseSetRowInput(
                  hintText: '0',
                  value: (set.weight != null && set.weight! > 0)
                      ? set.weight.toString()
                      : null,
                  onChanged: (text) => set.weight = double.tryParse(text) ?? 0,
                ),
              ),
              Expanded(
                child: ExerciseSetRowInput(
                  hintText: '0',
                  value: (set.reps != null && set.reps! > 0)
                      ? set.reps.toString()
                      : null,
                  onChanged: (text) => set.reps = int.tryParse(text) ?? 0,
                ),
              ),
              if (!widget.isEditMode)
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      set.isDone
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                    ),
                    padding: const EdgeInsets.only(top: 5),
                    alignment: Alignment.topCenter,
                    color: set.isDone ? Colors.green[400] : Colors.white,
                    onPressed: () async {
                      await HapticFeedback.lightImpact();
                      setState(() {
                        set.isDone = !set.isDone;
                      });
                    },
                  ),
                )
              else
                const Expanded(
                  child: SizedBox.shrink(),
                ),
            ],
          ),
        ),
      );
    }).toList();
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
            if (!widget.isEditMode)
              Expanded(
                child: Text(
                  'DONE',
                  textAlign: TextAlign.center,
                  style: UITextStyle.caption.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else
              const Expanded(
                child: SizedBox.shrink(),
              ),
          ],
        ),
        const SizedBox(height: 8),
        ..._rowsBuilder(widget.exercise.sets),
      ],
    );
  }
}
