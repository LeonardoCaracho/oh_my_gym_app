import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workouts_api/workouts_api.dart';

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
      color: UIColors.lightPurple,
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
                child: WorkoutOptionsBottomSheet(workout: workout),
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
                style: UITextStyle.headline4,
              ),
              const SizedBox(height: UISpacing.lg),
              Text(
                'Total Exercises: ${workout.exercises.length}',
                style: UITextStyle.bodyText2,
              ),
              Text(
                'Total Sets: ${_getTotalSets()}',
                style: UITextStyle.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
