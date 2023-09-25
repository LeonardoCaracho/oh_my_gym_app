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
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExerciseCardHeader(isEditMode: isEditMode, exercise: exercise),
            const SizedBox(width: UISpacing.sm),
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

class ExerciseCardHeader extends StatefulWidget {
  const ExerciseCardHeader({
    super.key,
    required this.isEditMode,
    required this.exercise,
  });

  final bool isEditMode;
  final Exercise exercise;

  @override
  State<ExerciseCardHeader> createState() => _ExerciseCardHeaderState();
}

class _ExerciseCardHeaderState extends State<ExerciseCardHeader> {
  bool isAddNote = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ExerciseCardInput(
                hintText: 'Exercise name',
                isReadOnly: widget.isEditMode == false,
                value: widget.exercise.name,
                onChanged: (text) {
                  widget.exercise.name = text;
                },
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isAddNote = !isAddNote;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  isAddNote ? Icons.speaker_notes_off : Icons.speaker_notes,
                  color: UIColors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        if (isAddNote)
          ExerciseCardInput(
            hintText: 'Notes',
            isReadOnly: widget.isEditMode == false,
            multiLine: true,
            value: widget.exercise.observation,
            onChanged: (text) {
              widget.exercise.observation = text;
            },
          ),
      ],
    );
  }
}
