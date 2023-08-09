import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';
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
    void updateWorkouts() {
      context.read<WorkoutsBloc>().add(const WorkoutsRequested());
    }

    return Card(
      color: UIColors.lightPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () async {
          final shouldUpdate = await context.pushNamed<bool>(
            RouteConstants.editWorkoutRouteName,
            extra: workout,
          );

          if (shouldUpdate ?? false) {
            updateWorkouts();
          }
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
              Expanded(
                child: Center(
                  child: IconButton.outlined(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_fill_outlined,
                      size: 42,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
