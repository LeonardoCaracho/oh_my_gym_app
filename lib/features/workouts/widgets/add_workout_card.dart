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
      onTap: () async {},
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              'Workouts',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            flex: 3,
            child: DefaultButtonSmall(
              text: '+ Add',
              onPressed: () async {
                final shouldUpdate = await context.pushNamed<bool>(
                  RouteConstants.addWorkoutRouteName,
                );

                if (shouldUpdate ?? false) {
                  updateWorkouts();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
