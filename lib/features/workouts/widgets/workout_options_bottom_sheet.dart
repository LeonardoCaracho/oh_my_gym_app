import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutOptionsBottomSheet extends StatelessWidget {
  const WorkoutOptionsBottomSheet({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    void updateWorkouts() {
      context.read<WorkoutsBloc>().add(const WorkoutsRequested());
    }

    void closeBottomSheet() {
      Navigator.pop(context);
    }

    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.play_arrow),
          title: const Text('Start'),
          onTap: () => context.goNamed(RouteConstants.startWorkoutRouteName),
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit'),
          onTap: () async {
            final shouldUpdate = await context.pushNamed<bool>(
              RouteConstants.editWorkoutRouteName,
              extra: workout,
            );

            if (shouldUpdate ?? false) {
              updateWorkouts();
            }

            closeBottomSheet();
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Delete'),
          onTap: () {
            context.read<WorkoutsBloc>().add(WorkoutRemoved(workout: workout));
            closeBottomSheet();
          },
        ),
      ],
    );
  }
}
