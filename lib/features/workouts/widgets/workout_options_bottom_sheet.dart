import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';
import 'package:workouts_api/workouts_api.dart';

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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        children: [
          Text(
            workout.name,
          ),
          const SizedBox(height: 8),
          DefaultButton(
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
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: 'DELETE',
                  icon: Icons.delete,
                  onPressed: () {
                    closeBottomSheet();
                    deleteConfirmationDialog(
                      context,
                      workout,
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DefaultButton(
                  text: 'EDIT',
                  icon: Icons.edit_document,
                  onPressed: () async {
                    closeBottomSheet();
                    final shouldUpdate = await context.pushNamed<bool>(
                      RouteConstants.editWorkoutRouteName,
                      extra: workout,
                    );

                    if (shouldUpdate ?? false) {
                      updateWorkouts();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
