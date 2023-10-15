import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workouts_api/workouts_api.dart';

class WorkoutRecordDetails extends StatelessWidget {
  const WorkoutRecordDetails({
    required this.record,
    super.key,
  });

  final WorkoutHistory record;

  String dateFormatter(DateTime date) {
    return DateFormat('yMMMMEEEEd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  record.workout.name,
                  style: UITextStyle.caption,
                ),
                Text(
                  dateFormatter(record.finishDate),
                  style: UITextStyle.caption,
                ),
              ],
            ),
            const SizedBox(height: 4),
            ...record.workout.exercises.map(
              (exercise) => ExerciseDetails(
                exercise: exercise,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({
    required this.exercise,
    super.key,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exercise.name,
          style: UITextStyle.caption.copyWith(
            color: UIColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        ...exercise.sets.asMap().keys.toList().map(
              (index) => Row(
                children: [
                  Expanded(
                    child: Text(
                      '${index + 1}',
                      style: UITextStyle.caption.copyWith(
                        color: UIColors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Reps: ${exercise.sets[index].reps}',
                      style: UITextStyle.caption.copyWith(
                        color: UIColors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Weight: ${exercise.sets[index].weight}',
                      style: UITextStyle.caption.copyWith(
                        color: UIColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        const SizedBox(height: 4),
      ],
    );
  }
}
