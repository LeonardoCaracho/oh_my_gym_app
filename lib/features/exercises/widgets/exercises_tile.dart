import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';

class ExercisesTile extends StatelessWidget {
  const ExercisesTile({
    required this.exercise,
    super.key,
  });

  final ExerciseType exercise;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        exercise.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      leading: Icon(
        Icons.sports_gymnastics_rounded,
        color: AppColors.primary,
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'X exercises',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 12),
          Text(
            'X sets',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 12),
          Text(
            'chest, shoulder',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      onTap: () async {},
    );
  }
}
