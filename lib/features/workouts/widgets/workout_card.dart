import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    required this.workout,
    super.key,
  });

  final Workout workout;

  String _getTotalSets() {
    return workout.exercises
        .fold(
          0,
          (previousValue, element) => previousValue + element.sets.length,
        )
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          final workoutsBloc = context.read<WorkoutsBloc>();
          showModalBottomSheet<void>(
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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workout.name,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Total Exercises: ${workout.exercises.length}',
              ),
              Text(
                'Total Sets: ${_getTotalSets()}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
