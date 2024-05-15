import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutRecordDetails extends StatelessWidget {
  const WorkoutRecordDetails({
    required this.record,
    super.key,
  });

  final WorkoutRecord record;

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
                  record.name,
                ),
                Text(
                  dateFormatter(record.finishDate),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // ...record.workout.exercises.map(
            //   (exercise) => ExerciseDetails(
            //     exercise: exercise,
            //   ),
            // ),
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
        ),
        const SizedBox(height: 4),
        ...exercise.sets.asMap().keys.toList().map(
              (index) => Row(
                children: [
                  Expanded(
                    child: Text(
                      '${index + 1}',
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Reps: ${exercise.sets[index].reps}',
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Weight: ${exercise.sets[index].weight}',
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
