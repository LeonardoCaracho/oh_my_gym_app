import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';

class ExerciseCardHeader extends StatefulWidget {
  const ExerciseCardHeader({
    required this.isEditMode,
    required this.exercise,
    super.key,
  });

  final bool isEditMode;
  final Exercise exercise;

  @override
  State<ExerciseCardHeader> createState() => _ExerciseCardHeaderState();
}

class _ExerciseCardHeaderState extends State<ExerciseCardHeader> {
  late bool isAddNote;
  late bool hasNote;

  @override
  void initState() {
    hasNote = !widget.isEditMode && widget.exercise.observation!.isNotEmpty;

    if (hasNote) {
      isAddNote = true;
    } else {
      isAddNote = false;
    }

    super.initState();
  }

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
