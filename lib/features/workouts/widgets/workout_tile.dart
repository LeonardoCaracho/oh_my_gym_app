import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutTile extends StatelessWidget {
  const WorkoutTile({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        workout.name,
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
      onTap: () async {
        final workoutsBloc = context.read<WorkoutsBloc>();
        await showModalBottomSheet<void>(
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: workoutsBloc,
              child: WorkoutOptionsBottomSheet(
                workout: workout,
              ),
            );
          },
        );
      },
    );
  }
}
