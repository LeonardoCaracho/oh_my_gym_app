import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/workouts/workouts.dart';

class AddWorkoutCard extends StatelessWidget {
  const AddWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    void updateWorkouts() {
      context.read<WorkoutsBloc>().add(const WorkoutsRequested());
    }

    return InkWell(
      onTap: () async {
        final shouldUpdate = await context.pushNamed<bool>(
          RouteConstants.addWorkoutRouteName,
        );

        if (shouldUpdate ?? false) {
          updateWorkouts();
        }
      },
      child: Card(
        color: UIColors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.add,
          size: 64,
        ),
      ),
    );
  }
}
