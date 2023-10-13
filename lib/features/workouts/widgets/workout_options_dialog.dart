import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workouts_api/workouts_api.dart';

class WorkoutOptionsDialog extends StatelessWidget {
  const WorkoutOptionsDialog({
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

    return AlertDialog(
      backgroundColor: UIColors.liver,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            workout.name,
            style: UITextStyle.headline4.copyWith(
              color: UIColors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context
                  .read<WorkoutsBloc>()
                  .add(WorkoutRemoved(workout: workout));
              closeBottomSheet();
            },
          )
        ],
      ),
      content: SizedBox(
        width: 300,
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: workout.exercises.length,
          itemBuilder: (context, index) {
            final exercise = workout.exercises[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(exercise.name),
              subtitle: Text('Sets: ${exercise.sets.length}'),
            );
          },
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: DefaultButton(
                text: 'START',
                icon: Icons.play_arrow,
                onPressed: () {
                  closeBottomSheet();
                  context.goNamed(
                    RouteConstants.startWorkoutRouteName,
                    extra: workout,
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DefaultButton(
                text: 'EDIT',
                icon: Icons.edit,
                onPressed: () async {
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
            ),
          ],
        ),
      ],
    );
  }
}
